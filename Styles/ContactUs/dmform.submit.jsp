<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections" %>
<%@page import="java.util.Enumeration" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.LinkedHashMap" %>
<%@page import="java.util.LinkedList" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.Set" %>
<%@page import="org.apache.commons.lang3.StringUtils" %>
<%@page import="com.duda.common.DudaCommonUtils" %>
<%@page import="com.duda.common.JSONHelper" %>
<%@page import="com.duda.common.MailSender" %>
<%@page import="com.duda.common.MailSenderBean.MailLogMessage" %>
<%@page import="com.duda.common.ServerConfigurations" %>
<%@page import="com.duda.common.ServerConfigurations.DMServerType" %>
<%@page import="com.duda.common.beans.DMBeans" %>
<%@page import="com.duda.common.multilingual.Language" %>
<%@page import="com.duda.common.site.SiteType" %>
<%@page import="com.duda.common.web.UrlHelper" %>
<%@page import="com.duda.commons.Pair" %>
<%@page import="com.duda.engine.core.http.HttpHelper" %>
<%@page import="com.duda.otf.FormAbusePreventerModifier" %>
<%@page import="com.duda.engine.site.DMSiteFunctions" %>
<%@page import="com.duda.engine.util.locale.LocaleUtils" %>
<%@page import="com.duda.engine.util.recaptcha.CaptchaUtils" %>
<%@page import="com.duda.form.FormFieldNameComparator" %>
<%@page import="com.duda.log.DudaLog" %>
<%@page import="com.duda.pers.Account" %>
<%@page import="com.duda.pers.ContactUs" %>
<%@page import="com.duda.pers.Site" %>
<%@page import="com.duda.pers.conf.PersistencyBeans" %>
<%@page import="com.duda.resources.CommonProps" %>
<%@page import="com.duda.resources.DMLocale" %>
<%@page import="com.duda.runtime.ContactFormLifeCycleHandler" %>
<%@page import="com.duda.services.multilingual.MultilingualService" %>
<%@page import="com.duda.webutil.JSPHelper" %>
<%@page import="com.google.common.collect.Sets" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%
    final String FILE_ATTACHMENT_PATTERN = "%2Fforms%2Fattachments%2F";
    // ensure to process POST requests only
    if (CommonProps.getBoolean("runtime.emailForm.submitOnPostOnly", true)
            && StringUtils.equalsIgnoreCase(request.getMethod(), "GET")) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
        return;
    }

    String siteAlias = request.getParameter("alias");
    Site site = StringUtils.isNotEmpty(siteAlias) ? PersistencyBeans.siteDataRepository().getSite(siteAlias) : null;
    Account account = site != null ? site.getParentAccount() : null;
    Language lang = site != null ? DMBeans.bean(MultilingualService.class).getSiteDefaultLanguage(site) : null;
    DMLocale fallback = account != null ? account.getLocaleObject() : null;
    DMLocale locale = lang != null ? DMLocale.lookupJavaPrefix(lang.getCommonStringsLangCode()) : fallback;

    String dmformsendto = request.getParameter("dmformsendto");
	/*if (CommonProps.getBoolean("contact.form.recipient.punycode.enabled", true)) {
	    dmformsendto = DudaCommonUtils.getPunyCodeEncoded(dmformsendto);
	}*/

    Pair<String, Boolean> formEncryptedValues = FormAbusePreventerModifier
            .getFormEncryptedValues(dmformsendto, UrlHelper.getRequestOriginalServerInfo(request).getServerName());
    if (formEncryptedValues == null) {
        // null is returned when there was a wrong format of the field
        return;
    }
    String sendToEmails = formEncryptedValues.getElementOne();
    boolean requiresCaptcha = formEncryptedValues.getElementTwo();

    String recap = request.getParameter(CaptchaUtils.RECAPTCHA_RESPONSE_PARAM);
    if (recap != null) {
        boolean isValid = CaptchaUtils.isValid(recap, request.getRemoteAddr());
        if (!isValid) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Wrong captcha");
            return;
        }
    } else if (requiresCaptcha) {
        response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Missing captcha");
        return;
    }

    String[] emails;
    if (StringUtils.isEmpty(sendToEmails)) {
        if (account == null) {
            return;
        } else {
            // Fix for null email field at runtime
            emails = new String[] {account.getEmail() != null ? account.getEmail() : account.getName()};
        }
    } else {
        emails = sendToEmails.split(",");
        if (emails.length == 0 || emails[0].isEmpty()) {
            if (account == null) {
                return;
            } else {
                emails = new String[] {account.getEmail()};
            }
        }
    }

    String nl = "<br/>";

    String subject = request.getParameter("dmformsubject");
    Set<String> abusePatterns = CommonProps.getSet("dmform.abuse.subject", Sets.newHashSet("diabetics", "diabetes"));
    if (DudaCommonUtils.containsAnyIgnoreCase(subject, abusePatterns)) {
        DudaLog.info("Block sending mail by abuse subject: '{}'", subject);
        return;
    }

    Enumeration<String> paramNames = request.getParameterNames();
    StringBuilder msg = new StringBuilder(1024);
    msg.append(LocaleUtils.get("ui.formResponse.1", locale) + nl + nl);

    if (Site.getType(site) == SiteType.DUDAONE) {
        msg.append(LocaleUtils.get("ui.formResponse.3", locale) + " - "
                + DMBeans.bean(DMSiteFunctions.class).getSiteConfig(site).getProdUrlToSite(site) + "." + nl);
    } else {
        msg.append(LocaleUtils.get("ui.formResponse.2", locale) + " - "
                + DMBeans.bean(DMSiteFunctions.class).getSiteConfig(site).getProdUrlToSite(site) + "." + nl);
    }

    ArrayList<String> fields = new ArrayList<String>();
    while (paramNames.hasMoreElements()) {
        String name = paramNames.nextElement();
        if (name.startsWith("dmform-")) {
            fields.add(name);
        }
    }
    String mail = null;
    Collections.sort(fields, new FormFieldNameComparator());
    Map<String, Object> formFieldsAndValues = new LinkedHashMap<String, Object>(fields.size());
    List<Map<String, ?>> formFieldsData = new LinkedList<Map<String, ?>>();
    int untitled = 1;

    StringBuilder filedsMsg = new StringBuilder(1024);
    for (String s : fields) {
        String[] vals = request.getParameterValues(s);

        if (vals != null && vals.length > 0) {

            Map<String, Object> formFieldData = new HashMap<String, Object>();
            formFieldData.put("field_id",s);

            String fieldLabel = request.getParameter("label-" + s);

            if (DudaCommonUtils.isEmpty(fieldLabel)) {
                fieldLabel = "untitled_" + untitled;
                untitled++;
            }

            // label is non unique
            if (formFieldsAndValues.containsKey(fieldLabel)) {
                int i = 1;
                do {
                    fieldLabel = fieldLabel + "_" + i;
                    i++;
                } while (formFieldsAndValues.containsKey(fieldLabel));
            }

            if (vals.length == 1) {
                formFieldsAndValues.put(fieldLabel, vals[0]);
            } else {
                formFieldsAndValues.put(fieldLabel, vals);
            }

            String fieldType = request.getParameter("type-" + s);
            if (DudaCommonUtils.isEmpty(fieldType)) {
                fieldType = "unknown_type";
            }

            formFieldData.put("type", fieldType);
            formFieldData.put("label", fieldLabel);
            formFieldData.put("value", formFieldsAndValues.get(fieldLabel));
            formFieldData.put("key", request.getParameter("integrationMappingType-" + s));
            formFieldsData.add(formFieldData);

            for (String val : vals) {

                if (val != null) {
                    val = val.replace("\n", nl);
                }
                if (mail == null && DudaCommonUtils.isValidMail(val)) {
                    mail = val;
                }

                val = (DudaCommonUtils.isSimplePhoneNumberMatch(val)) ? "<a href='tel:" + val + "'>" + val + "</a>"
                        : val;
                // if this is a file attachment, hide the ugly link by an "open file" link
                val = (val.contains(FILE_ATTACHMENT_PATTERN)) ? "<a href='" + val + "'>" + LocaleUtils.get("form.response.openfile", locale) + "</a>"
                        : val;
                if (StringUtils.endsWith(fieldLabel, ":")) {
                    filedsMsg.append(fieldLabel + " " + val).append(nl);
                } else {
                    filedsMsg.append(fieldLabel + ": " + val).append(nl);
                }

            }
        }
    }

    if (DudaCommonUtils.isEmpty(filedsMsg.toString())) {
        DudaLog.info("Form is sending email with empty input fileds content... [site: {}]", siteAlias);
    }

    msg.append(filedsMsg);

    if (mail != null) {
        msg.append(nl).append("<a href='mailto:").append(mail).append("'>")
                .append(LocaleUtils.get("ui.formResponse.4", locale)).append("</a>").append(nl);
    }

    ContactUs contactUs = null;
    String message = msg.toString();
    String title = request.getParameter("form_title");
    String formId = request.getParameter("form_id");
    String from = "form-processor" + " <form-processor@" + MailSender.TO_DOMAIN_PLACEHOLDER + ">";

    String utmCampaign = null;

    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("_dm_rt_campaign")) {
                utmCampaign = cooky.getValue();
                break;
            }
        }
    }

    if (mail != null && CommonProps.getBoolean("common.mail.form.sendfromsubmitter", false)) {
        from = mail;
    }

    // Add preview notification
    if (DMServerType.DEV.equals(ServerConfigurations.getDMServerType())) {

        String previewNotice = LocaleUtils.get("contactForm.submit.preview.notice", locale);

        message = StringUtils.join(message, nl, nl, previewNotice);
    }

    MailSender.MailMessage m = new MailSender.MailMessage().to(emails).subject(subject).message(message).from(from)
            .isHtml(true);

    Set<String> abuseContentPatterns = CommonProps.getSet("dmform.abuse.message", Sets.newHashSet("Diane Jamieson", "dianecodona@hotmail.com"));
    if (DudaCommonUtils.isNotEmpty(m.getMessage()) && DudaCommonUtils.containsAnyIgnoreCase(m.getMessage(), abuseContentPatterns)) {
        DudaLog.info("Block sending mail by abuse content: '{}'", m.getMessage());
        return;
    }

    m.addHeader("alias", site != null ? site.getAlias() : "No Site");

    if (StringUtils.isNotBlank(formId)) {
        contactUs = new ContactUs(formId, site.getAlias(), HttpHelper.getClientIpAddr(request), title, mail,
                JSONHelper.toJSON(formFieldsAndValues));
        if (DudaCommonUtils.isNotEmpty(utmCampaign)) {
            contactUs.setUtmCampaign(utmCampaign);
        }
    }

    if (CommonProps.getBoolean("dmform.logMail", true)) {
        String content = m.getMessage();
        int contentLen = StringUtils.length(content);
        int maxContentLen = 2048;
        if (contentLen > 0) {
            content = content.substring(0, Math.min(0 + maxContentLen, content.length()));
        }

        MailLogMessage mailLogMessage = new MailLogMessage();
        mailLogMessage.setTo(m.getTo().toString());
        mailLogMessage.setSubject(m.getSubject());
        mailLogMessage.setContent(m.getMessage());

        DudaLog.info(JSONHelper.toJSON(mailLogMessage));
    }

    JSPHelper.accountService().sendMail(account, m, contactUs);
    DMBeans.bean(ContactFormLifeCycleHandler.class).contactFormSent(site, contactUs, formFieldsData, new HashMap<String,String>());

%>
<html>
<head>
    <link type="text/css" rel="stylesheet"
          href="${rconf.rtBase}/css/runtime.css"/>
    <meta id="view" name="viewport" content="width=device-width"/>
</head>

<body>
</body>
</html>
<%!
%>
