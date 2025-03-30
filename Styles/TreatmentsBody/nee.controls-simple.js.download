(function ($) {

  $.fn.onOffBtn = function (settings) {
    if (this.size() === 0) {
      return this;
    }

    var defaults = {
      initState: true,
      onFn: function () {
      },
      offFn: function () {
      }
    };
    var newSettings = $.extend({}, defaults, settings || {});
    if (typeof newSettings.initState === "function") {
      newSettings.initState = newSettings.initState();
    }

    var btn = this;
    if ($.dmfw.isDudaone()) {
      // btn.append('<div class="oneOnButtonMode"><span class="dm-icon-checkmark"></span></div>');
      // btn.append('<div class="oneOffButtonMode"><span class="dm-icon-plus"></span></div>');
      btn.append(
          '<div class="onOffHandle"><span class="dm-icon-checkmark"></span><span class="dm-icon-plus"></span></div>')

    }
    btn.state = newSettings.initState;
    btn.addClass("neeOnButton");
    if ($.dmfw.isDudaone()) {
      btn.addClass("neeOnButtonOne");
    }
    _setSkin(btn, newSettings.disabled);
    _blockHeight(btn);
    btn.unbind('click');
    btn.click(function () {
      if (!newSettings.disabled) {
        btn.state = !btn.state;
        if (btn.state) {
          newSettings.onFn(true);
        } else {
          newSettings.offFn(false);
        }
        _setSkin(btn);
        _blockHeight(btn)
      }
    });

    function _blockHeight(btn) {
      if (btn.parents('#headerToggleShowOlyPrecent').length) {
        var heightSlider = btn.parents('#headerToggleShowOlyPrecent').find(
            '.heightSetting');
        if (heightSlider.length) {
          if (btn.state == true) {
            heightSlider.addClass('blocked');
          } else {
            heightSlider.removeClass('blocked');
          }
        }
      }
    }

    function _setSkin(btn, disabled) {
      if (btn.state) {
        btn.removeClass("neeOffButton");
        if ($.dmfw.isDudaone()) {
          btn.removeClass("neeOffButtonOne");
        }
      } else {
        btn.addClass("neeOffButton");
        if ($.dmfw.isDudaone()) {
          btn.addClass("neeOffButtonOne");
        }
      }
      if (disabled) {
        btn.addClass("neeOnOffButtonDisabled");
        if ($.dmfw.isDudaone()) {
          btn.addClass("neeOnOffButtonDisabledOne");
        }
      } else {
        btn.removeClass("neeOnOffButtonDisabled");
        if ($.dmfw.isDudaone()) {
          btn.removeClass("neeOnOffButtonDisabledOne");
        }
      }
    }

    btn.disable = function () {
      newSettings.disabled = true;
      _setSkin(btn, true);
    };
    btn.enable = function () {
      newSettings.disabled = false;
      _setSkin(btn, false);
    };

    return btn;

  };

  $.fn.toggleModeWidget = function (settings) {
    var defaults = {
      initState: 0,
      first: {
        name: "First",
        toggle: function () {
        }
      },
      last: {
        name: "Last",
        toggle: function () {
        }
      }
    };
    var newSettings = $.extend({}, defaults, settings || {});

    var btn = this;
    btn.state = newSettings.initState;
    var holder = $("<div class='toggleModeButtons'></div>");
    if (settings && settings.classToAdd) {
      holder.addClass(settings.classToAdd);
    }

    var first = $("<span class='modeFirst'>" + newSettings.first.name
        + "</span>");
    var last = $("<span class='modeLast'>" + newSettings.last.name + "</span>");
    holder.append(first).append(last);
    btn.empty();
    btn.append(holder);
    _bindEvents(first, 0, newSettings.first);
    _bindEvents(last, 1, newSettings.last);
    _setSkin(btn);

    function _bindEvents(mode, index, modeSett) {
      mode.unbind('click.toggleMode');
      mode.bind('click.toggleMode', function () {
        btn.state = index;
        modeSett.toggle();
        _setSkin(btn);
      });
    }

    function _setSkin(btn) {
      var first = btn.find('.modeFirst');
      var last = btn.find('.modeLast');
      if (btn.state == 0) {
        _setSelected(first, last);
      } else {
        _setSelected(last, first);
      }

      function _setSelected(selected, other) {
        selected.removeClass("toggleModeOff");
        selected.addClass("toggleModeOn");
        other.removeClass("toggleModeOn");
        other.addClass("toggleModeOff");

      }
    }

  };

  $.fn.dmQrCodePopup = function (settings) {
    var content = $('<div class="dmwrQRCodeWrapper">' +
        '<img src="https://chart.googleapis.com/chart?cht=qr&chs=250x250&chl='
        + encodeURI(settings.url) + '"/>' +
        '<div class="dmwrQRCodeTextWrapper"><span class="dmwrQRCodeText">' +
        dmStr["ui.nee.publishPanel.300"] + '</span></div></div');
    $(this).neePopUpDiv(content);
  };

  $.fn.shareByEmailPopup = function (settings) {
    var content = $('<div class="dmwrSendEmailWrapper">' +
        '<div class="neeSendEmailText">' + dmStr["ui.nee.publishPanel.301"]
        + '</div>' +

        '<div class="neeSendEmailInput"> <input type="text" class="email" placeholder="'
        + dmStr['ui.nee.publishPanel.302'] + '"/>' +
        '<span class="neeSendEmailBtn orangeBtn ptOrangeBtn">'
        + dmStr["ui.nee.preview.popup.8"] + '</span></div>' +
        '<div class="neeSendMailMsg"></div>' +
        '</div>');
    $(this).neePopUpDiv(content, {
      init: function (self) {

        var sendMailOpts = {
          mailType: settings.mailType,
          siteAddress: settings.siteAddress,
          msg: self.find('.neeSendMailMsg'),
          input: self.find('.neeSendEmailInput input'),
          sendBtn: self.find('.neeSendEmailBtn'),
          addTryModeParam: settings.addTryModeParam
        };
        $.dmops.sendSiteAddressMail(sendMailOpts);
      }
    });
  };

  $.fn.inputURL = function (inputBox, options) {

    var checkURL = {
      inputBox: null,
      url: null,
      validateResponse: null,
      protocol: null, // http || https
      hostname: null, // www.example.com
      domain: null, // example.com
      path: null,
      fixDupliateDomain: false,

      errorsMsg: null,
      errorsMsgParams: null,
      options: {
        protocol: '', // http || https
        hostname: '', // www.example.com
        domain: '', // example.com
        mustHavepPath: false,
        changeOnInvalidProtocol: false,
        changeOnInvalidHostName: false,
        changeOnInvalidDomain: false,
        fixDupliateDomain: false
      },

      init: function (inputBox, options) {
        var self = this;
        this.inputBox = inputBox;
        this.url = $(inputBox).val();
        if (typeof options == 'object') {
          self.options = options;
        }

        if ('' !== self.options.protocol) {
          //self.protocol = $.url('protocol', self.url);
          self.protocol = self.url.substr(0, self.url.indexOf('://'));

          if (self.protocol !== self.options.protocol) {
            self.onInvalidProtocol();
            if (null !== self.errorsMsg) {
              self.onError(options);

              self.validateResponse = false;
              return false;
            }
          }
        }

        if ('' !== self.options.hostname) {
          self.hostname = $.url('hostname', self.url);

          if (self.hostname.replace('www.', '')
              !== self.options.hostname.replace('www.', '')) {
            self.onInvalidDomain();
            if (null !== self.errorsMsg) {
              self.onError(options);
              self.validateResponse = false;
              return false;
            }
          }
        }

        if (true == self.options.mustHavepPath) {
          self.checkPath();
          if (null !== self.errorsMsg) {
            self.onError(options);
            self.validateResponse = false;
            return false;

          }
        }

        //check if valide URL at all
        if (false == self.url.isUrl) {
          self.errorsMsg = $.dmString('nee.error.invalidUrl.1');
          self.onError(options);
          self.validateResponse = false;
          return false;
        }

        if (true == self.options.fixDupliateDomain) {
          this.checkDupliateDomain();
        }

        self.validateResponse = true;
        return true;
      },

      onError: function (options) {
        var qtipOpt;
        if (options.style) {
          qtipOpt = {
            style: options.style,
            position: options.position,
            hide: options.hide
          };
        }

        $.dmfw.showValidationError(this.inputBox,
            $.dmString(this.errorsMsg, this.errorsMsgParams), '', qtipOpt);
        $.dmx.editor.setValid(false);
      },

      onInvalidProtocol: function () {
        if (true == this.options.changeOnInvalidProtocol) {
          var protocolString = this.url.split(':');
          if ('http' !== protocolString[0] && 'https' !== protocolString[0]) {
            this.url = this.options.protocol + '://' + this.url;
            $(this.inputBox).val(this.url);
          } else {
            this.url = this.url.replace(this.protocol, this.options.protocol);
            $(this.inputBox).val(this.url);
          }

        } else {
          this.errorsMsg = 'ui.urlValidate.protocol';
          this.errorsMsgParams = [(this.options.protocol).toUpperCase()];
        }

      },
      onInvalidDomain: function () {
        if (true == this.options.changeOnInvalidDomain) {
          $(this.inputBox).val(
              $(this.inputBox).val().replace(this.domain, this.options.domain));

        } else {
          this.errorsMsg = 'ui.urlValidate.domain';
          this.errorsMsgParams = [this.options.domain];
        }

      },
      checkPath: function () {
        this.path = $.url('path', this.url);
        if ('/' == this.path) {
          this.errorsMsg = 'ui.urlValidate.urlIncompleted';
        }
      },
      checkDupliateDomain: function () {

        var fullDomain = this.options.protocol + '://' + this.options.domain
            + '/';
        var fullDomianLengh = fullDomain.length;

        if (this.url.lastIndexOf(fullDomain)) {

        }

      }

    }; //end of check URL

    checkURL.init(inputBox, options);

    return checkURL.validateResponse;
  };

  $.fn.dmGeneralAutoComplete = function (options) {
    options = options || {};
    var facebookPages = options.facbookPages
        && commonProps['feature.flag.facebookimport']; // the 'facbook' typo is widespread
    var _self = $(this);
    var wrap = $("<div id='fbPageswrapper' class='fbPageswrapper'></div>");
    var currentSelection = 0;
    var currentRet = null;
    var fbAccess = _self.data('dmfbat');
    var globalWebUrl = '';
    wrap.insertAfter(_self);
    wrap.hide();
    wrap.css("width", options.width || _self.outerWidth()).css(
        "left", _self.position().left + "px");
    if (options.cssClass) {
      wrap.addClass(options.cssClass);
    }

    //add event listener
    function _getFacbookPageResult(elem) {
      if (elem.username) {
        return "https://facebook.com/" + elem.username;
      } else {
        return elem.link;
      }
    }

    function handleReturn(elem) {
      wrap.hide();
      var ret = elem;
      if (elem.type == 'url') {
        ret = elem.id;
      } else if (facebookPages) {
        ret = _getFacbookPageResult(elem);
      }
      //can add more results functions			
      _self.unbind("keypress.keyUp");
      options.callback && options.callback(ret);
    }

    function handleClickEvents() {
      $(".fbPageswrapper").unbind('click.selectOption').on("click.selectOption",
          'ul li', function (event) {
            event.stopPropagation();
            var elem = eval("(" + $(this).attr('data-elem') + ")");
            handleReturn(elem);
          });
    }

    function _handleFacebookPagesData(data, items) {
      $.each(data.data, function (key, val) {
        var c_im = val.picture && val.picture.data && val.picture.data.url
            ? "url(" + val.picture.data.url + ");" : "";
        var itemStr = '<li id="' + key + '" data-elem="' + JSON.stringify(
            val).replace(/\'/g, '&rsquo;').replace(/\"/g, '\'') + '">' +
            '<div class="imgInfo" style="background-image: ' + c_im
            + '"></div><div class="genInfo"><div class="genName">' + val.name +
            '</div>' +
            '<div class="genCat">' + val.category + '</div>';
        if (val.type != 'url') {
          itemStr += '<div class="genLikes">' + val.likes + ' likes' + '</div>';
        }
        itemStr += '</div></li>';
        items.push(itemStr);
      });
      return items;
    }

    function handleResults(data) {
      wrap.find("ul").remove();
      if (data.data.length == 0) {
        $('<ul/>', {
          'class': 'my-new-list emptyList',
          html: 'No results found for your query. Check your spelling or try another term.'
        }).appendTo(wrap);
        wrap.show();
      } else {
        var items = _handleFacebookPagesData(data, []);
        $('<ul/>', {
          'class': 'my-new-list',
          html: items.join('')
        }).appendTo(wrap);
        wrap.show();
        handleClickEvents();
      }

    }

    function setSelected(menuitem) {
      wrap.find("ul li").removeClass("itemhover");
      wrap.find("ul li").eq(menuitem).addClass("itemhover");
      var _curElm = wrap.find("ul li").eq(menuitem);
      currentRetWrap = _curElm.attr('data-elem');
      currentRet = eval("(" + currentRetWrap + ")");
      wrap.scrollTop(parseInt(_curElm.index() * _curElm.height()));
    }

    function _navigate(direction) {
      if (wrap.find("ul li.itemhover").size() == 0) {
        currentSelection = -1;
      }
      if (direction == 'up' && currentSelection != -1) {
        if (currentSelection != 0) {
          currentSelection--;
        }
      } else if (direction == 'down') {
        if (currentSelection != wrap.find("ul li").size() - 1) {
          currentSelection++;
        }
      }
      setSelected(currentSelection);
    }

    _self.unbind('keypress').keypress(function (event) {
      event.stopPropagation();
      $(this).unbind('keyup').keyup(function (e) {
        if (e.keyCode == 38 || e.keyCode == 40 || e.keyCode == 13) {
          return;
        }
        var val = $.trim(this.value);
        if (val.length >= 2) {
          if (options.webUrl) {
            globalWebUrl = val.replace(/\s+/g, ' ');
            if (globalWebUrl.indexOf(".") == -1) {
              globalWebUrl = "http://www." + globalWebUrl + ".com";
            } else if (globalWebUrl.indexOf("http") == -1) {
              globalWebUrl = "http://" + globalWebUrl;
            }
            var categoryStr = (window.dmStr
                && dmStr["ui.one.onboarding.start.yourWebsiteURL"])
                || "Your website URL";
            data = {
              data: [{
                type: "url",
                id: globalWebUrl,
                name: globalWebUrl,
                category: categoryStr,
                picture: {
                  data: {
                    url: "//t1.gstatic.com/images?q=tbn:ANd9GcTLSTPr2hncXSe1pCgMrkK8GSl2jP_-lei98c4UFvkSZHtycvBBuQ"
                  }
                }
              }]
            }
            handleResults(data);
          }

          if (facebookPages) {
            $.getJSON('https://graph.facebook.com/search?fields=username,name,likes,picture,category,link&q='
                + val +
                '&type=page&limit=20&access_token=' + fbAccess,
                function (data) {

                  if (options.webUrl) {
                    data.data.unshift({
                      type: "url",
                      id: globalWebUrl,
                      name: globalWebUrl,
                      category: categoryStr,
                      picture: {
                        data: {
                          url: "//t1.gstatic.com/images?q=tbn:ANd9GcTLSTPr2hncXSe1pCgMrkK8GSl2jP_-lei98c4UFvkSZHtycvBBuQ"
                        }
                      }
                    });
                  }
                  handleResults(data);
                }).fail(function () {
              var apiUrl = _apiUiPath + "/getfacebookauthtoken?force=true";
              var settings = {
                type: 'get',
                cache: false,
                async: true,
                processData: true,
                contentType: 'application/json',
                url: apiUrl,
                success: function (data) {
                  fbAccess = data.value;
                  _self.data('dmfbat', fbAccess);
                }
              };
              $.ajax(settings);
            });
          }
          //can add more complete options
        } else {
          wrap.hide();
        }
      });
      $(this).unbind('keydown').keydown(function (event) {
        event.stopPropagation();
        switch (event.keyCode) {
          case 38:
            _navigate('up');
            ;
            break;
          case 40:
            _navigate('down');
            break;
          case 13:
            if (currentRet != null) {
              handleReturn(currentRet);
            }
            break;
        }
      });
    });
    _self.unbind('clickoutside').bind('clickoutside', function () {
      wrap.hide();
    });
  };

})(jQuery);