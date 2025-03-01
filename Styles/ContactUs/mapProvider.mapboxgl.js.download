(function($, global) {
    'use strict';

    var DEFAULT_LAYOUT = 'layout1';

    var mapStylesMap = {
        layout1: {
            layerId: 'mapbox://styles/dannyb123/cj1nokhth002h2ro98mhwrfje'
        },
        layout2: {
            layerId: 'mapbox://styles/dannyb123/cj1g5pss2000k2rpk9km6e0br',
            hasColor: true,
            paintProperty: [
                {
                    layer: 'water',
                    property: 'fill-color'
                }
            ],
            defaultColor: '#fabfd6'
        },
        layout3: {
            layerId: 'mapbox://styles/dannyb123/cj1anrhcr009m2sn3j97epb1p'
        },
        layout4: {
            layerId: 'mapbox://styles/dannyb123/cj1oxf9mh006e2rmrfgo9cmuy'
        },
        layout5: {
            layerId: 'mapbox://styles/dannyb123/cj1gea1ar001i2rp1cnw3brak',
            hasColor: true,
            paintProperty: [
                {
                    layer: 'country-label-lg',
                    property: 'text-color'
                },
                {
                    layer: 'country-label-md',
                    property: 'text-color'
                },
                {
                    layer: 'country-label-sm',
                    property: 'text-color'
                },
                {
                    layer: 'state-label-lg',
                    property: 'text-color'
                },
                {
                    layer: 'country-label-md',
                    property: 'text-color'
                },
                {
                    layer: 'country-label-sm',
                    property: 'text-color'
                },
                {
                    layer: 'marine-label-sm-ln',
                    property: 'text-color'
                },
                {
                    layer: 'marine-label-sm-pt',
                    property: 'text-color'
                },
                {
                    layer: 'marine-label-md-pt',
                    property: 'text-color'
                },
                {
                    layer: 'marine-label-md-ln',
                    property: 'text-color'
                },
                {
                    layer: 'marine-label-lg-pt',
                    property: 'text-color'
                },
                {
                    layer: 'marine-label-lg-ln',
                    property: 'text-color'
                },
                {
                    layer: 'place-label-lg-n',
                    property: 'text-color'
                },
                {
                    layer: 'place-label-lg-s',
                    property: 'text-color'
                },
                {
                    layer: 'place-label-md-n',
                    property: 'text-color'
                },
                {
                    layer: 'place-label-md-s',
                    property: 'text-color'
                },
                {
                    layer: 'place-label-sm',
                    property: 'text-color'
                },
                {
                    layer: 'place-islands',
                    property: 'text-color'
                },
                {
                    layer: 'place-towns',
                    property: 'text-color'
                },
                {
                    layer: 'place-village',
                    property: 'text-color'
                },
                {
                    layer: 'place-hamlet',
                    property: 'text-color'
                },
                {
                    layer: 'place-suburb',
                    property: 'text-color'
                },
                {
                    layer: 'place-neighbourhood',
                    property: 'text-color'
                },
                {
                    layer: 'place-islets-archipelago-aboriginal',
                    property: 'text-color'
                },
                {
                    layer: 'airport-label',
                    property: 'text-color'
                },
                {
                    layer: 'poi-scalerank1',
                    property: 'text-color'
                },
                {
                    layer: 'poi-parks-scalerank1',
                    property: 'text-color'
                },
                {
                    layer: 'water-label',
                    property: 'text-color'
                },
                {
                    layer: 'poi-parks-scalerank2',
                    property: 'text-color'
                },
                {
                    layer: 'poi-scalerank2',
                    property: 'text-color'
                },
                {
                    layer: 'poi-parks-scalerank3',
                    property: 'text-color'
                },
                {
                    layer: 'poi-scalerank3',
                    property: 'text-color'
                },
                {
                    layer: 'road-label-large',
                    property: 'text-color'
                },
                {
                    layer: 'road-label-medium',
                    property: 'text-color'
                },
                {
                    layer: 'road-label-small',
                    property: 'text-color'
                },
                {
                    layer: 'waterway-label',
                    property: 'text-color'
                },
                {
                    layer: 'road-rail',
                    property: 'line-color'
                },
                {
                    layer: 'road-motorway',
                    property: 'line-color'
                },
                {
                    layer: 'road-trunk',
                    property: 'line-color'
                },
                {
                    layer: 'road-primary',
                    property: 'line-color'
                },
                {
                    layer: 'road-secondary-tertiary',
                    property: 'line-color'
                },
                {
                    layer: 'road-street',
                    property: 'line-color'
                },
                {
                    layer: 'road-street_limited',
                    property: 'line-color'
                },
                {
                    layer: 'road-service-link-track',
                    property: 'line-color'
                },
                {
                    layer: 'road-pedestrian',
                    property: 'line-color'
                },
                {
                    layer: 'road-motorway_link',
                    property: 'line-color'
                },
                {
                    layer: 'road-trunk_link',
                    property: 'line-color'
                },
                {
                    layer: 'road-steps',
                    property: 'line-color'
                },
                {
                    layer: 'road-path',
                    property: 'line-color'
                },
                {
                    layer: 'road-sidewalks',
                    property: 'line-color'
                },
                {
                    layer: 'road-construction',
                    property: 'line-color'
                },
                {
                    layer: 'road-motorway-case',
                    property: 'line-color'
                },
                {
                    layer: 'road-trunk-case',
                    property: 'line-color'
                },
                {
                    layer: 'road-main-case',
                    property: 'line-color'
                },
                {
                    layer: 'road-trunk_link-case',
                    property: 'line-color'
                },
                {
                    layer: 'road-motorway_link-case',
                    property: 'line-color'
                },
                {
                    layer: 'road-primary-case',
                    property: 'line-color'
                },
                {
                    layer: 'road-main-case',
                    property: 'line-color'
                },
                {
                    layer: 'road-street-case',
                    property: 'line-color'
                },
                {
                    layer: 'road-service-link-track-case',
                    property: 'line-color'
                },
                {
                    layer: 'road-street_limited-case',
                    property: 'line-color'
                },
                {
                    layer: 'road-street-low',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-motorway',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-trunk',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-primary',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-secondary-tertiary',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-street',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-pedestrian',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-steps',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-path',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-construction',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-motorway-case',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-trunk-case',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-motorway_link-case',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-trunk_link-case',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-primary-case',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-secondary-teriary-case',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-street-case',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-service-link-track-case',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-street-case',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-street-low',
                    property: 'line-color'
                },
                {
                    layer: 'tunnel-street_limited-low',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-motorway-2',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-trunk-2',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-motorway_link-2',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-trunk_link-2',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-motorway-2-case',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-trunk_link-2-case',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-rail',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-motorway',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-trunk',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-primary',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-secondary-tertiary',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-street',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-street_limited',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-service-link-track',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-pedestrian',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-motorway_link',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-trunk_link',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-steps',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-path',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-construction',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-motorway-case',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-trunk_link-case',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-primary-case',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-secondary-tertiary-case',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-street-case',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-street_limited-case',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-service-link-track-case',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-street_limited-low',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-street-low',
                    property: 'line-color'
                },
                {
                    layer: 'bridge-pedestrian-case',
                    property: 'line-color'
                }
            ],
            defaultColor: '#a1f7ff'
        },
        layout6: {
            layerId: 'mapbox://styles/dannyb123/cj1gd98jx000d2rmsqzx47mxa'
        }
    };

    var defaultOptions = {
        zoomControl: true,
        scrollZoom: false,
        dragPan: true,
        doubleClickZoom: false,
        satelliteSwitcher: false,
        fullScreenSwitcher: false
    };

    var supportedLanguages = {
        en: true,
        es: true,
        fr: true,
        de: true,
        ru: true,
        zh: true,
        ar: true,
        pt: true,
        ko: true,
        ja: true,
        he: true,
        nl: true,
        it: false,
        fi: true,
        pl: true,
        sl: true,
        cs: true,
        hu: true,
        ka: true,
        lv: true,
        sr: true,
        tr: true,
        ro: true,
        mn: true,
        bs: true,
        id: true,
        sq: true,
        th: true,
        bg: true,
        is: true,
        sk: true
    };

    var mapboxScriptLoadDeferred;

    var component = {
        init: function(editorMode, opts) {
            return loadMapboxScript();
        },

        cleanup: function(map) {
            map.remove();
        },

        /**
         * args -
         * conatiner : regular domnode element
         * zoom - zoom
         */
        drawMap: function(args) {
            return internalDrawMap(args);
        },

        refreshSize: function(map) {
            map.resize();
        },

        refreshZoom: function(map, zoom) {
            map.setZoom(zoom);
        },

        refreshStyle: function(map, style) {
            setMapStyle(map, style);
        },

        openPopup: function(map) {
            if (map && map.dmPopup && !map.dmPopup.isOpen()) {
                map.dmPopupMarker.setPopup(map.dmPopup);
                map.dmPopupMarker.togglePopup();
            }
        },

        refreshPopup: function(map) {},

        closePopup: function(map) {
            if (map && map.dmPopup && map.dmPopup.isOpen()) {
                map.dmPopupMarker.togglePopup();
            }
        },

        setCenter: function(map, loc, zoom) {
            if (!loc.lat || !loc.lng) {
                return;
            }

            zoom = zoom || map.getZoom() || 13;

            map.setCenter(new mapboxgl.LngLat(loc.lng, loc.lat), zoom);
        },

        createMarker: function(map, options) {
            var el = document.createElement('div');
            el.className = 'marker';

            // if no location set dummy marker loc else it will make problem later on
            var loc = new mapboxgl.LngLat(options.lng || 50.5, options.lat || 30.5);
            var markerOptions = options.markerOptions || {};

            var myMarker = new mapboxgl.Marker(el).setLngLat(loc).addTo(map);

            return myMarker;
        },

        setBounds: function(map, bounds) {
            if (!bounds) {
                return;
            }

            var boundsArray = [bounds['northeast'], bounds['southwest']].map(function(bound) {
                return new mapboxgl.LngLat(bound.lng, bound.lat);
            });

            var mapboxBounds = new mapboxgl.LngLatBounds();
            boundsArray.forEach(function(item) {
                mapboxBounds.extend(item);
            });

            map.fitBounds(mapboxBounds, { duration: 0, padding: 50 });
        },

        updateMarker: function(marker, loc) {
            if (!loc.lat || !loc.lng) {
                return;
            }

            marker.setLngLat(new mapboxgl.LngLat(loc.lng, loc.lat));
        }
    };

    function internalDrawMap(args) {
        var device = $.layoutDevice ? $.layoutDevice.type : 'mobile';
        var container = $(args.container).find('.mapContainer')[0] || $(args.container)[0],
            options = args.options || {},
            markers = args.markers || [
                {
                    lat: args.lat,
                    lng: args.lng,
                    popup: args.popupOptions
                }
            ],
            location = args.lng && args.lat ? new mapboxgl.LngLat(args.lng, args.lat) : null,
            style = args.style || {
                layout: args.layout || 'layout1',
                colorScheme: args.colorScheme
            },
            zoom = args.zoom || args.options.zoom || 13;

        var mapOptions = $.extend(
            {
                container: container,
                style: mapStylesMap[style.layout].layerId,
                zoom: zoom
            },
            defaultOptions,
            {
                scrollZoom: options.scrollWheelZoom,
                dragPan: options.dragging || options.dragging,
                doubleClickZoom: options.doubleClickZoom,
                zoomControl: options.zoomControl,
                satelliteSwitcher: options.satelliteSwitcher,
                fullScreenSwitcher: options.fullScreenSwitcher
            }
        );

        $(container).empty();

        if (device && device == 'mobile') {
            mapOptions.dragPan = false;
        }

        var map = new mapboxgl.Map(mapOptions);

        if (mapOptions.zoomControl) {
            var nav = new mapboxgl.NavigationControl();
            map.addControl(nav, 'top-left');
        }

        if (location) {
            map.setCenter(location);
        }

        // filter out not valid marker locations
        markers = markers
            .map(function(marker) {
                if (marker.lat && marker.lng) {
                    marker.location = new mapboxgl.LngLat(marker.lng, marker.lat);
                }

                return marker;
            })
            .filter(function(marker) {
                return marker.location;
            });

        var bounds = new mapboxgl.LngLatBounds();

        markers.forEach(function(marker) {
            var el = document.createElement('div');
            el.className = 'marker map-marker';

            var myMarker = new mapboxgl.Marker(el).setLngLat(marker.location);

            if (marker.listener) {
                $(el).click(marker.listener);
            }

            var popupOptions = marker.popup || {};

            if (popupOptions.show) {
                var popupDisplay = marker.popup.display || 'click';
                var markerHeight = 40;
                var markerRadius = 10;
                var linearOffset = 25;

                var popupOffsets = {
                    top: [0, 0],
                    'top-left': [0, 0],
                    'top-right': [0, 0],
                    bottom: [0, -markerHeight],
                    'bottom-left': [linearOffset, (markerHeight - markerRadius + linearOffset) * -1],
                    'bottom-right': [-linearOffset, (markerHeight - markerRadius + linearOffset) * -1],
                    left: [markerRadius, (markerHeight - markerRadius) * -1],
                    right: [-markerRadius, (markerHeight - markerRadius) * -1]
                };
                var popup = new mapboxgl.Popup({
                    closeButton: popupDisplay !== 'hover',
                    closeOnClick: false,
                    offset: popupOffsets
                }).setHTML('<div class="map-popup-wrapper">' + marker.popup.html + '</div>');

                if (popupDisplay === 'always') {
                    myMarker.setPopup(popup);

                    map.once('render', function() {
                        myMarker.togglePopup();
                    });
                } else if (popupDisplay === 'click') {
                    myMarker.setPopup(popup);
                } else {
                    // hover default
                    $(el).on('mouseenter', function() {
                        popup.setLngLat(marker.location);
                        popup.addTo(map);
                    });

                    $(el).on('mouseleave', function() {
                        popup.remove();
                    });
                }

                map.dmPopup = popup;
                map.dmPopupMarker = myMarker;
            }

            myMarker.addTo(map);
            bounds.extend(marker.location);
        });

        if (options.fitBounds) {
            if (markers.length > 1) {
                map.fitBounds(bounds, { duration: 0, padding: 50 });
            } else if (markers.length === 1) {
                map.setCenter(markers[0].location);
            }
        }

        if (args.language && isLanguageSupported(args.language)) {
            map.once('styledata', function () {
                Object.keys(map.style._layers)
                  .filter(function (key) {
                    return (
                      map.getLayer(key)?.type === 'symbol' &&
                      typeof map.getLayoutProperty(key, 'text-field') === 'string' &&
                      map.getLayoutProperty(key, 'text-field').startsWith('{name_') &&
                      key.indexOf('road_label_highway_shield') < 0
                    );
                  })
                  .forEach(function (key) {
                    map.setLayoutProperty(key, 'text-field', '{name_' + args.language + '}');
                  });
              });
              
        }

        if (mapOptions.fullScreenSwitcher) {
            map.addControl(new mapboxgl.FullscreenControl(), 'top-right');
        }

        if (mapOptions.satelliteSwitcher) {
            map.addControl(new SatelliteControl());
        }

        map.once('click', function() {
            map.scrollZoom.enable();
        });

        setMapColorScheme(map, style);

        return map;
    }

    function isLanguageSupported(language) {
        return supportedLanguages[language];
    }

    function loadMapboxScript(params) {
        if (mapboxScriptLoadDeferred) {
            return mapboxScriptLoadDeferred.promise();
        }
        mapboxScriptLoadDeferred = $.Deferred();

        var version = global.build || '';
        var vendorVersion = mapboxVersionDirectory();
        var CDNhost;
        if (window.rtCommonProps) {
            CDNhost = rtCommonProps['common.resources.cdn.host'];
        } else {
            CDNhost = commonProps['common.resources.cdn.host'];
        }
        var baseDir = CDNhost + '/editor/ed/vendor/mapbox' + vendorVersion;

        $.loadScript(baseDir + '/mapbox-gl.js?version=' + version).then(function() {
            mapboxgl.accessToken =
                'pk.eyJ1IjoiZGFubnliMTIzIiwiYSI6ImNqMGljZ256dzAwMDAycXBkdWxwbDgzeXYifQ.Ck5P-0NKPVKAZ6SH98gxxw';
            mapboxScriptLoadDeferred.resolve();
        });

        $.loadCss([{ id: 'mapbox-gl-css', path: baseDir + '/mapbox-gl.css?version=' + version }]);

        $('head').append('<style id="mapbox-internal-css" />');
        $('#mapbox-internal-css').html(
            ".marker.mapboxgl-marker { margin-top: -20px; width: 25px; height: 41px; z-index: 100; display: block; background-image: url('/editor/ed/vendor/leaflet/images/marker-icon.png'); }"
        );

        return mapboxScriptLoadDeferred.promise();
    }

    function setMapStyle(map, styleParams) {
        var mapStyle = mapStylesMap[styleParams.layout || DEFAULT_LAYOUT];
        map.setStyle(mapStyle.layerId);

        setMapColorScheme(map, styleParams);
    }

    function setMapColorScheme(map, styleParams) {
        var mapStyle = mapStylesMap[styleParams.layout];

        if (mapStyle.hasColor) {
            map.once('styledata', function() {
                mapStyle.paintProperty.forEach(function(paintProperty) {
                    if (map.style._layers[paintProperty.layer]) {
                        map.setPaintProperty(
                            paintProperty.layer,
                            paintProperty.property,
                            styleParams.colorScheme || mapStyle.defaultColor
                        );
                    }
                }, this);
            });
        }
    }

    function centerMapWithPopup(map, popup, location) {
        var px = map.project(location); // find the pixel location on the map where the popup anchor is
        px.y -= popup._container.clientHeight / 2; // find the height of the popup container, divide by 2, subtract from the Y axis of marker location
        map.panTo(map.unproject(px), { animate: true }); // pan to new center
    }

    $.geoProviders = $.geoProviders || {};
    $.geoProviders.mapbox = $.geoProviders.mapbox || {};
    $.geoProviders.mapbox.gl = component;

    function mapboxVersionDirectory() {
        var version = getMapboxVersion();
        if (!version) {
            return '';
        }

        return '/v' + version;
    }

    function getMapboxVersion() {
        if (window.rtCommonProps) {
            return rtCommonProps['common.mapsProvider.version'];
        }

        return commonProps['common.mapsProvider.version'];
    }

    var satelliteSwitcherMarkup =
        '<div class="mapboxgl-ctrl mapboxgl-ctrl-group"><button class="switcher map-switcher"></button></div>';

    function SatelliteControl() {
        return {
            onAdd: function(map) {
                this._map = map;
                this._container = $(satelliteSwitcherMarkup);

                var that = this;

                this._container.find('.switcher').click(function() {
                    $(this).toggleClass('map-switcher satellite-switcher');

                    if (that._style) {
                        that._map.setStyle(that._style);
                        that._style = null;
                    } else {
                        that._style = that._map.getStyle();
                        that._map.setStyle('mapbox://styles/mapbox/satellite-v9');
                    }
                });

                return this._container[0];
            },
            onRemove: function() {
                this._container.remove();
                this._map = undefined;
            },
            getDefaultPosition: function() {
                return 'top-right';
            }
        };
    }
})(jQuery, window);
