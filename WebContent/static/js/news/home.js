/**
 * Created by LiqHe on 2017/2/13.
 */
riot.tag("weather", '<div class="w-header"> <span class="y-icon icon-location" onclick="{changeLocation}" ga_event="mh_change_city">&nbsp;{options.city}</span> <span class="wind">{options.wind}</span> <span class="air" riot-style="background: {options.level}">{options.air}</span> </div> <ul class="y-box days-weather {show: options.weather_show}"> <li class="y-left day"> <span class="title">今天</span> <div title="{options.weather.current_condition}" class="weather-icon weather-icon-{options.weather.weather_icon_id}"></div> <span class="temperature"> <em>{options.weather.low_temperature}</em>&#176; &#47; <em>{options.weather.high_temperature}</em>&#176; </span> </li> <li class="y-left day"> <span class="title">明天</span> <div title="{options.weather.tomorrow_condition}" class="weather-icon weather-icon-{options.weather.tomorrow_weather_icon_id}"></div> <span class="temperature"> <em>{options.weather.tomorrow_low_temperature}</em>&#176; &#47; <em>{options.weather.tomorrow_high_temperature}</em>&#176; </span> </li> <li class="y-left day"> <span class="title">后天</span> <div title="{options.weather.dat_condition}" class="weather-icon weather-icon-{options.weather.dat_weather_icon_id}"></div> <span class="temperature"> <em>{options.weather.dat_low_temperature}</em>&#176; &#47; <em>{options.weather.dat_high_temperature}</em>&#176; </span> </li> </ul> <div class="y-box city-select {show: !options.weather_show}"> <div class="y-box"> <div class="y-left select-style"> <p class="y-box"> <span class="y-left name">{options.current_province}</span> <span class="y-right y-icon icon-more" onclick="{showProvinces}"></span> </p> <div class="y-box province-list {show: options.province_show}"> <a class="y-left item" href="javascript:;" each="{item, i in options.locations}" onclick="{changeProvince}"> {item} </a> </div> </div> <div class="y-right select-style"> <p class="y-box"> <span class="y-left name">{options.current_city}</span> <span class="y-right y-icon icon-more" onclick="{showCities}"></span> </p> <div class="y-box city-list {show: options.city_show}"> <a class="y-left item" href="javascript:;" each="{item, i in options.cities}" onclick="{changeCity}"> {item} </a> </div> </div> </div> <div class="y-box action"> <a href="javascript:;" class="y-left ok-btn" onclick="{onSubmitClick}">确定</a> <a href="javascript:;" class="y-right cancel-btn" onclick="{onCancelClick}">取消</a> </div> </div>', 'class="y-weather"',
    function() {
        function t(t) {
            var e = !0;
            return t >= 0 && 50 >= t ? {
                    c: e ? "#5cbf4c": "#5c8828",
                    t: "优"
                }: t >= 51 && 100 >= t ? {
                        c: e ? "#5cbf4c": "#5c8828",
                        t: "良"
                    }: t >= 101 && 150 >= t ? {
                            c: e ? "#ff9f2d": "#c58120",
                            t: "轻度污染"
                        }: t >= 151 && 200 >= t ? {
                                c: e ? "#ff9f2d": "#c58120",
                                t: "中度污染"
                            }: t >= 201 && 300 >= t ? {
                                    c: e ? "#ff5f5f": "#cf3d3d",
                                    t: "重度污染"
                                }: t >= 301 ? {
                                        c: e ? "#ff5f5f": "#cf3d3d",
                                        t: "严重污染"
                                    }: {
                                        c: "rgba( 214, 117, 3, 0.8 )",
                                        t: "其他"
                                    }
        }
        this.options = {
            current_province: "北京",
            current_city: "北京",
            province_show: !1,
            city_show: !1,
            weather_show: !0
        },
            riot.observable(this),
            this.on("weatherChange",
                function(t) {
                    this._renderWeather(t)
                }),
            this.init = function() {
                this._getCities()
            }.bind(this),
            this.showProvinces = function() {
                this.options.city_show = !1,
                    this.options.province_show = !this.options.province_show
            }.bind(this),
            this.showCities = function() {
                this.options.province_show = !1,
                    this.options.city_show = !this.options.city_show
            }.bind(this),
            this.changeLocation = function() {
                this.options.weather_show = !1
            }.bind(this),
            this.changeProvince = function(t) {
                this.options.city_show = !1,
                    this.options.province_show = !1,
                    this.options.current_province = t.item.item,
                    this._renderCities(t.item.item)
            }.bind(this),
            this.changeCity = function(t) {
                this.options.city_show = !1,
                    this.options.province_show = !1,
                    this.options.current_city = t.item.item
            }.bind(this),
            this.onSubmitClick = function() {
                var t = this;
                this.options.weather_show = !0,
                    this._getWeather({
                        city: t.options.current_city
                    })
            }.bind(this),
            this.onCancelClick = function() {
                this.options.weather_show = !0
            }.bind(this),
            this._getWeather = function(t) {
                var e = this;
                http({
                    url: "/stream/widget/local_weather/data/",
                    method: "GET",
                    data: t,
                    success: function(t) {
                        t = t || {},
                        "success" === t.message && (e._renderWeather(t.data.weather), Cookies.set("WEATHER_CITY", t.data.city, {
                            expires: 100
                        }), e.parent && e.parent.trigger("weatherChange", t.data.weather))
                    }
                })
            }.bind(this),
            this._renderWeather = function(e) {
                this.options.weather = e,
                    this.options.city = e.city_name,
                    this.options.wind = e.wind_direction + e.wind_level + "级",
                    this.options.air = e.quality_level + " " + e.aqi,
                    this.options.level = t(e.aqi).c,
                    this.update()
            }.bind(this),
            this._getCities = function() {
                var t = this;
                http({
                    url: "/stream/widget/local_weather/city/",
                    method: "GET",
                    success: function(e) {
                        e = e || {},
                        "success" === e.message && (t.options.locations = e.data, t._renderCities(t.options.current_province))
                    }
                })
            }.bind(this),
            this._renderCities = function(t) {
                this.options.cities = this.options.locations[t];
                for (var e in this.options.cities) {
                    this.options.current_city = e;
                    break
                }
                this.update()
            }.bind(this),
            this.on("mount",
                function() {
                    this.init()
                })
    }),
    riot.tag("topbar", '<div class="y-box topbar"> <ul class="y-left" if="{opts.home}"> <!--<li class="tb-item"> <a class="tb-link" href="#" target="_blank" ga_event="mh_nav_others">下载APP</a> </li>!--> <li class="tb-item"> <a class="tb-link" href="/desktop.php" target="_blank" ga_event="mh_nav_others">保存到桌面</a> </li></ul> <div class="y-left y-nav-topbar" riot-tag="nav" if="{!opts.home}"></div> <ul class="y-right"> <li class="tb-item"> <a class="tb-link" href="/e/member/login/" target="_blank" ga_event="mh_nav_others">头条号</a> </li>  <li class="tb-item"> <a onclick="{userFeedClick}" class="tb-link" href="javascript:void(0)">反馈</a> </li> <li class="tb-item more"> <a class="tb-link" href="/about/">更多</a> <div class="layer"> <ul> <li> <a href="/about/" class="layer-item" rel="nofollow">关于头条</a> </li> <li> <a href="/media_partners/" class="layer-item" rel="nofollow">媒体合作</a> </li> <li> <a href="/cooperation/" class="layer-item" rel="nofollow">产品合作</a> </li> <li> <a href="/media_cooperation/" class="layer-item" rel="nofollow">合作说明</a> </li> <li> <a href="https://ad.toutiao.com/e/" class="layer-item" target="_blank" rel="nofollow">广告投放</a> </li> <li> <a href="/contact/" class="layer-item" rel="nofollow">联系我们</a> </li> <li> <a href="/user_agreement/" class="layer-item" rel="nofollow">用户协议</a> </li> <li> <a href="/complain/" class="layer-item" rel="nofollow">投诉指引</a> </li> </ul> </div> </li> </ul> <div riot-tag="userFeedback"></div> </div>',
        function(t) {
            this.options = {
                city: "",
                state: "",
                top: 0,
                low: 0
            },
                this.userFeedbackShow = !1;
            var e = this.tags.weather,
                i = this.tags.userFeedback;
            riot.observable(this),
                this.on("weatherChange",
                    function(e) {
                        this._renderWeather(e),
                        t.weatherChange && t.weatherChange(e)
                    }),
                this.init = function() {
                    if (this.opts.home) {
                        var t = Cookies.get("WEATHER_CITY") || "";
                        this._getWeather({
                            city: t
                        })
                    }
                }.bind(this),
                this.userFeedClick = function() {
                    i.trigger("userFeedShow", this.userFeedbackShow),
                        this.userFeedbackShow = !this.userFeedbackShow
                }.bind(this),
                this._getWeather = function(t) {
                    var i = this;
                    http({
                        url: "/stream/widget/local_weather/data/",
                        method: "GET",
                        data: t,
                        success: function(t) {
                            t = t || {},
                            "success" === t.message && (i._renderWeather(t.data.weather), e && e.trigger("weatherChange", t.data.weather))
                        }
                    })
                }.bind(this),
                this._renderWeather = function(t) {
                    this.options.weather = t,
                        this.options.city = t.city_name,
                        this.options.state = t.current_condition,
                        this.options.top = t.high_temperature,
                        this.options.low = t.low_temperature,
                        this.update()
                }.bind(this),
                this.init()
        }),
    riot.tag("searchbox", '<div name="searchBox" class="y-left search-box"> <form action="/e/search/" method="post" data-node="searchForm" target="_blank" onsubmit="{onSearchClick}"> <div class="y-box input-group"> <input class="y-left input-text" name="keyboard" autocomplete="off" ga_event="mh_search" type="text" placeholder="请输入关键字" value=""> <div class="y-right btn-submit"> <input type="hidden" name="show" value="title"><input type="hidden" name="tempid" value="1"><input type="hidden" name="tbname" value="news"><button type="submit" href="javascript:;"> <i class="y-icon icon-search" ga_event="mh_search"></i> </button> </div> </div> </form> <div class="layer {layer-show: options.layershow}" if="{options.hotwords.length > 0}"> <div class="layer-inner">  <ul ga_event="mh_search"> <li each="{item, i in options.hotwords}" class="search-item" onclick="{onSearchItemClick}"> <a href="javascript:;"> <i class="search-no search-no-{i+1}">{i + 1}</i> <span class="search-txt">{item}</span> </a> </li> </ul> </div> </div> </div>',
        function() {
            this.options = {
                hotwords: [],
                keyword: "",
                searchTip: "大家都在搜：",
                layershow: !1
            },
                this.init = function() {
                    this._getHotWords()
                }.bind(this),
                this._getHotWords = function() {
                    var t = this;
                    http({
                        url: "/hot_words/",
                        method: "GET",
                        success: function(e) {
                            e = e.hot_words || e || [],
                            _.isArray(e) && 0 !== e.length && (t.options.hotwords = e, t.options.keyword = t.options.searchTip + e[0], t.update())
                        }
                    })
                }.bind(this),
                this.onFocus = function() {
                    this.options.keyword = "",
                        this.options.layershow = !0
                }.bind(this),
                this.onBlur = function() {
                    this.options.layershow = !1
                }.bind(this),
                this.onSearchClick = function() {
                    var t, e = this.keyword.value;
                    return e ? (t = e.slice(0, 6), t !== this.options.searchTip || (this.options.keyword = e.slice(6), this.options.keyword) ? !0 : (this.keyword.focus(), !1)) : (this.keyword.focus(), !1)
                }.bind(this),
                this.onSearchItemClick = function(t) {
                    this.options.keyword = t.item.item,
                        this.update(),
                        this.searchForm.submit()
                }.bind(this),
                this.on("mount",
                    function() {
                        this.init()
                    })
        }),
    riot.tag("userbox", '<div class="y-right userbox"> <a if="{options.isPgc&&options.id}" class="y-right new-article" href="http://mp.toutiao.com/new_article/" ga_event="mh_write">发文</a> <div if="{options.id}" class="y-right username"> <a ga_event="mh_nav_user" class="user-head" href="//web.toutiao.com/user/{options.id}/pin/" rel="nofollow"> <div class="user-image"> <img onload="this.style.opacity=1;" riot-src="{options.avatarUrl}"> </div> <span>{options.name}</span> </a> <div class="user-layer"> <ul ga_event="mh_nav_user"> <li><a href="http://web.toutiao.com/user/{options.id}/pin/" class="layer-item" rel="nofollow">我的收藏</a></li> <li><a href="http://web.toutiao.com/user/{options.id}/subscribe/" class="layer-item" rel="nofollow">我的订阅</a></li> <li><a href="http://web.toutiao.com/user/{options.id}/followers/" class="layer-item" rel="nofollow">我的粉丝</a></li> <li><a href="http://web.toutiao.com/user/{options.id}/followings/" class="layer-item" rel="nofollow">我的关注</a></li> <li><a href="http://web.toutiao.com/auth/logout/" class="layer-item" rel="nofollow">退出</a></li> </ul> </div> </div> <div if="{!options.id}" class="y-right username"> <a ga_event="nav_login" class="nav-login" href="javascript:;" onclick="{onLoginClick}"> <span>登录</span> </a> </div> </div>',
        function(t) {
            var e = this;
            riot.observable(this),
                this.options = {
                    id: t.userInfo.id,
                    name: t.userInfo.name,
                    avatarUrl: t.userInfo.avatarUrl,
                    isPgc: t.userInfo.isPgc || !1
                },
                this.onLoginClick = function() {
                    window.trigger("login", {
                        successCb: function(t) {
                            window.trigger("userChange", t)
                        },
                        errorCb: function() {}
                    })
                }.bind(this),
                window.on("userChange",
                    function(t) {
                        t && (e.options.id = t.user_id, e.options.name = t.name, e.options.avatarUrl = t.avatar_url, e._isPgc(), e.update())
                    }),
                this._isPgc = function() {
                    var t = this;
                    http({
                        url: "/user/pgc_info/",
                        method: "get",
                        cache: !1,
                        success: function(e) {
                            e = e || {},
                            "success" === e.message && e.data.is_pgc_author && (t.options.isPgc = !0, t.update())
                        }
                    })
                }.bind(this)
        }),
    riot.tag("login", '<div class="login-dialog {hide: options.hide}"> <a class="btn" href="javascript:;" onclick="{hide}"> <i class="icon icon-close"></i> </a> <div class="login-dialog-header"> <h3>邮箱登录</h3> </div> <div class="login-dialog-inner" data-node="inner"> <div class="login-pannel bottom-line"> <form action="/auth/login/" method="POST" onsubmit="{onFormSubmit}"> <ul> <li> <div class="input-group"> <div class="input"> <label>邮箱</label> <input class="name" name="name_or_email" type="text" placeholder="请使用您的注册邮箱" autocomplete="off" spellcheck="false"> </div> </div> </li> <li> <div class="input-group"> <div class="input"> <label>密码</label> <input class="password" name="password" type="password" data-node="password" placeholder="密码" autocomplete="off" spellcheck="false"> </div> </div> </li> <li class="captcha-box {show: options.captchaImg}"> <div class="input-group"> <div class="input"> <input class="password" name="captcha" type="text" data-node="captcha" placeholder="验证码" autocomplete="off" spellcheck="false"> <img name="captchaImg" riot-src="{options.captchaImg}"> </div> </div> </li> <li> <div class="input-group"> <input type="checkbox" name="remember_me" checked="" style="vertical-align:top"> <label for="remember_me" class="label">记住账号</label> </div> </li> <li> <div class="input-group" style="text-align: center;"> <input type="submit" class="submit-btn" value="登录"> <p class="{error: options.errorMsg}">{options.errorMsg}</p> </div> </li> </ul> </form> </div> <div class="login-dialog-header"> <h3>合作网站帐号登录</h3> </div> <div class=""> <ul class="y-box sns_login_list" onclick="{onSnsLoginClick}"> <li class="sinaweibo"> <a href="javascript:;" data-pid="sina_weibo" ga_event="login_sina_weibo"> <i class="icon"></i> 新浪微博 </a> </li> <li class="qqweibo"> <a href="javascript:;" data-pid="qq_weibo" ga_event="login_tencnet_weibo"> <i class="icon"></i> 腾讯微博 </a> </li> <li class="qzone"> <a href="javascript:;" data-pid="qzone_sns" ga_event="login_qqzone"> <i class="icon"></i> QQ空间 </a> </li> <li class="renren"> <a href="javascript:;" data-pid="renren_sns" ga_event="login_renren"> <i class="icon"></i> 人人网 </a> </li> <li class="weixin"> <a href="javascript:;" style="margin-right:0;" data-pid="weixin" ga_event="login_wechat"> <i class="icon"></i> 微信 </a> </li> </ul> </div> </div> </div> <div class="mask {hide: options.hide}"></div>',
        function(t) {
            var e = this;
            riot.observable(this),
                this.options = {
                    hide: !0,
                    errorMsg: "",
                    captchaImg: ""
                },
                this.curSpec = {
                    successCb: t.successCb ||
                    function() {},
                    errorCb: t.errorCb ||
                    function() {}
                },
                this.hide = function() {
                    this.options.hide = !0,
                        this.update()
                }.bind(this),
                this.onFormSubmit = function(t) {
                    t.preventDefault();
                    var e = this,
                        i = http.serialize(t.currentTarget);
                    user.loginByLoc({
                        data: i,
                        successCb: function(t) {
                            "function" == typeof e.curSpec.successCb && e.curSpec.successCb(t),
                                e.hide()
                        },
                        errorCb: function(t) {
                            e.password.value = "",
                                t = t || {};
                            var i = t.data || {};
                            e.options.errorMsg = i.description || "登录失败",
                                i.captcha ? (e.captcha.value = "", e.options.captchaImg = "data:image/gif;base64," + i.captcha) : (e.captcha.value = "", e.options.captchaImg = ""),
                            "function" == typeof e.curSpec.errorCb && e.curSpec.errorCb(t),
                                e.update()
                        }
                    })
                }.bind(this),
                this.onSnsLoginClick = function(t) {
                    var e = utils.getTarget(t),
                        i = utils.getAttribute(e, "data-pid") || utils.getAttribute(e.parentNode, "data-pid");
                    this.hide(),
                        user.loginByOther(i, this.curSpec)
                }.bind(this),
                window.on("login",
                    function(t) {
                        e.options.hide = !1,
                            t = t || {},
                            e.curSpec = {
                                successCb: t.successCb ||
                                function() {},
                                errorCb: t.errorCb ||
                                function() {}
                            },
                            e.update()
                    })
        }),
    riot.tag("userFeedback", '<div class="feedback_dialog"> <div class="dialog-header"> <h3>意见反馈</h3> </div> <div class="dialog-inner"> <div class="feedback_panel"><form action="/e/enews/index.php" method="post" name="form1" onSubmit="return submitfeedback(this)"> <p class="label">联系方式（必填）</p> <div class="input-group"> <input name="bid" type="hidden" value="1" /> <input class="email" placeholder="您的邮箱" type="text" name="email"> </div> <p class="label">您的意见（必填）</p> <div class="input-group"> <textarea style="height:100px;" name="lytext" class="content" maxlength="140" placeholder="请填写您的意见，不超过140字"></textarea> </div> <div class="input-group"> <input name="name" type="hidden" id="name" value="匿名"><input type="submit" name="Submit3" class="submit-btn" value="提交"><input name="enews" type="hidden" id="enews" value="AddGbook" /><input type="hidden" name="ecmsfrom" value="/"> <span class="error">{msg}</span> <a class="close" href="javascript:void(0);" onclick="{hide}">[关闭]</a> </div> </form> </div> </div> </div>', 'class="userFeedback" show="{userFeedShow}"',
        function() {
            this.message = {
                success: "已提交,感谢您的意见",
                fail: "提交错误,请稍后重试",
                mail_error: "请输入正确的联系方式",
                content_error: "请输入您的意见",
                content_length_error: "意见长度超出限制"
            };
            var t = this;
            this.userFeedShow = !1,
                this.msg = "",
                this.disabled = !1,
                riot.observable(this),
                this.on("userFeedShow",
                    function(e) {
                        e ? t.hide() : t.show()
                    }),
                this.showMessage = function(t) {
                    this.msg = this.message[t],
                        this.update()
                }.bind(this),
                this.show = function() {
                    this.userFeedShow = !0,
                        this.update()
                }.bind(this),
                this.hide = function() {
                    this.userFeedShow = !1,
                        this.msg = "",
                        this.update()
                }.bind(this),
                this.onFormSubmit = function() {
                    var e = this["feedback-email"],
                        i = this["feedback-content"];
                    return e.value.length < 5 ? (e.focus(), this.showMessage("mail_error")) : "" === i.value ? (i.focus(), this.showMessage("content_error")) : (this.msg = "", this.disabled = !0, this.update(), void http({
                                headers: {
                                    "X-CSRFToken": Cookies.get("csrftoken")
                                },
                                url: "/post_message/",
                                method: "post",
                                data: {
                                    appkey: "web",
                                    uuid: e.value,
                                    content: "[" + window.location.host + "]" + i.value
                                },
                                success: function(n) {
                                    return "success" !== n.message ? t.showMessage("fail") : (e.value = "", i.value = "", t.disabled = !1, t.showMessage("success"), void setTimeout(function() {
                                                t.hide()
                                            },
                                            2e3))
                                },
                                error: function() {
                                    t.disabled = !1,
                                        t.update(),
                                        t.showMessage("fail")
                                }
                            }))
                }.bind(this)
        }),
    riot.tag("toast", '<div name="toast" class="toast-inner" style="opacity: 10; filter:alpha(opacity=1000);"> <span>{opts.msg}</span> </div>', 'class="toast"',
        function() {
            var t = this;
            this.on("mount",
                function() {
                    var e = this.toast,
                        i = e.clientWidth,
                        n = e.clientHeight,
                        o = new TAnimation;
                    e.style.cssText += "margin-top:-" + n / 2 + "px;margin-left:-" + i / 2 + "px",
                        o.animate({
                                el: e,
                                prop: "opacity",
                                to: 0,
                                transitionDuration: 2e3
                            },
                            function() {
                                t.unmount(!0)
                            })
                })
        }),
    riot.tag("subchannel", '<ul name="subchannel" style="" ga_event="subchannel_click" class="sub-list {sub-list-suspension: options.isTop}"> <li class="sub-item {sub-selected: item.is_current}" each="{item, i in opts.subchannels}"> <a href="/{{item.category}}/">{{item.name}}</a> </li> </ul>', 'if="{opts.subchannels}" class="subchannel"',
        function(t) {
            this.options = {
                suspension: t.suspension || !1,
                isTop: !1
            },
                this.init = function() {
                    var t = this;
                    if (this.options.suspension) {
                        var e = document.getElementById("subchannel"),
                            i = e.clientWidth;
                        this.subchannel.style.width = i + "px",
                            utils.on(window, "scroll", _.throttle(function() {
                                    var i = utils.scrollTop(),
                                        n = utils.offset(e);
                                    t.options.isTop = i > n.top ? !0 : !1,
                                        t.update()
                                },
                                30))
                    }
                }.bind(this),
                this.init()
        }),
    riot.tag("loading", '<div if="{options.cssAnimation}" class="loading ball-pulse"> <div></div> <div></div> <div></div> <span>{options.msg}&sdot;&sdot;&sdot;</span> </div> <div if="{!options.cssAnimation}" class="loading loading-normal"> <img src="http://s3b.pstatp.com/toutiao/resource/toutiao_web/static/style/image/loading_50c5e3e.gif" alt=""> <span>{options.msg}&sdot;&sdot;&sdot;</span> </div>',
        function(t) {
            var e = utils.cssAnimationSupport();
            this.options = {
                cssAnimation: e,
                msg: t.msg || "推荐中"
            }
        }),
    riot.tag("verification", '<div class="code-header">输入验证码，继续浏览文章</div> <div class="y-box input-code"> <input type="text" autocomplete="false" name="code" id="" onkeydown="{onKeyDown}" placeholder="输入验证码"> <img riot-src="data:image/gif;base64,{options.captcha}"> </div> <p if="{options.error}" class="error-msg">验证码错误，请重试</p> <div class="ok-btn" onclick="{onOkClick}">确认</div>', 'if="{options.show}" id="verification"',
        function() {
            var t = this;
            this.options = {
                error: !1,
                show: !1,
                captcha: ""
            },
                this.onOkClick = function() {
                    var t = this;
                    "" !== t.code.value && http({
                        url: "/api/article/check_captcha/",
                        method: "POST",
                        data: {
                            code: t.code.value
                        },
                        success: function(e) {
                            "success" === e.message ? (t.options.show = !1, window.trigger("codeVerificationSuccess")) : (t.options.error = !0, t.options.captcha = e.data.captcha),
                                t.update()
                        }
                    })
                }.bind(this),
                this.onKeyDown = function(t) {
                    var e = utils.getKeyCode(t);
                    return 13 == e ? this.onOkClick() : !0
                }.bind(this),
                window.on("codeVerification",
                    function(e) {
                        t.options.show = !0,
                            t.options.captcha = e.captcha || "",
                            t.update()
                    })
        }),
    !
        function(t) {
            var e = {};
            e.getHoney = function() {
                var t = Math.floor((new Date).getTime() / 1e3),
                    e = t.toString(16).toUpperCase(),
                    i = md5(t).toString().toUpperCase();
                if (8 != e.length) return {
                    as: "479BB4B7254C150",
                    cp: "7E0AC8874BB0985"
                };
                for (var n = i.slice(0, 5), o = i.slice( - 5), s = "", a = 0; 5 > a; a++) s += n[a] + e[a];
                for (var r = "",
                         c = 0; 5 > c; c++) r += e[c + 3] + o[c];
                return {
                    as: "A1" + s + e.slice( - 3),
                    cp: e.slice(0, 3) + r + "E1"
                }
            },
                t.ascp = e
        } (window, document),
    !
        function() {
            var t = {};
            t.getAds = function(t) {
                http({
                    url: "/api/web_ads/",
                    method: "get",
                    success: function(e) {
                        "success" === e.status && e.data.length > 0 && t && t(e.data)
                    }
                })
            },
                window.ADModel = t
        } (window, document),
    !
        function(t, e) {
            function i(t) {
                var i, n = new RegExp("(^| )" + t + "=([^;]*)(;|$)");
                return (i = e.cookie.match(n)) ? unescape(i[2]) : null
            }
            function n() {
                return (new Date).getTime()
            }
            function o(t, e, i) {
                var o, s, a, r, c = 0;
                i || (i = {});
                var l = function() {
                        c = i.leading === !1 ? 0 : n(),
                            o = null,
                            r = t.apply(s, a),
                        o || (s = a = null)
                    },
                    u = function() {
                        var u = n();
                        c || i.leading !== !1 || (c = u);
                        var d = e - (u - c);
                        return s = this,
                            a = arguments,
                            0 >= d || d > e ? (o && (clearTimeout(o), o = null), c = u, r = t.apply(s, a), o || (s = a = null)) : o || i.trailing === !1 || (o = setTimeout(l, d)),
                            r
                    };
                return u.cancel = function() {
                    clearTimeout(o),
                        c = 0,
                        o = s = a = null
                },
                    u
            }
            function s(t, e, i) {
                if (t.addEventListener) return t.addEventListener(e, i, !1),
                    i;
                if (t.attachEvent) {
                    var n = function() {
                        var e = window.event;
                        e.target = e.srcElement,
                            i.call(t, e)
                    };
                    return t.attachEvent("on" + e, n),
                        n
                }
            }
            function a(t, e) {
                if (!t) return "";
                var i = t.getAttribute(e);
                return i ? i: ""
            }
            function r(t, e, i) {
                t && t.setAttribute(e, i)
            }
            function c() {
                return window.innerHeight && window.innerWidth ? {
                        winWidth: window.innerWidth,
                        winHeight: window.innerHeight
                    }: document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth ? {
                            winWidth: document.documentElement.clientWidth,
                            winHeight: document.documentElement.clientHeight
                        }: void 0
            }
            function l(t) {
                var e = t.getBoundingClientRect();
                return e.top + 16 < v.winHeight && e.bottom > 16
            }
            function u(t) {
                var e = XMLHttpRequest ? new XMLHttpRequest: new ActiveXObject("Microsoft.XMLHTTP"),
                    i = (t.type || "get").toUpperCase(),
                    n = t.url,
                    o = t.data;
                if (n) {
                    var s = [];
                    for (var a in o) s.push(a + "=" + o[a]);
                    "GET" === i ? (n = n + "?" + s.join("&") + "&_=" + Math.random(), e.open(i, n, !0), e.send()) : (e.open(i, n, !0), e.setRequestHeader("X-Requested-With", "XMLHttpRequest"), e.setRequestHeader("Content-type", "application/x-www-form-urlencoded"), e.send(s.join("&"))),
                        e.onload = function() { (e.status >= 200 && e.status < 300 || 304 == e.status) && t.success && t.success.call(e, e.responseText)
                        }
                }
            }
            function d(t) {
                u({
                    url: g,
                    type: "POST",
                    data: {
                        value: t.value,
                        tag: "embeded_ad",
                        label: t.label,
                        is_ad_event: "1",
                        log_extra: t.extra,
                        category: "web",
                        utm_source: i("utm_source"),
                        csrfmiddlewaretoken: i("csrftoken")
                    },
                    success: function() {}
                }),
                taAnalysis && taAnalysis.send("event", {
                    ev: "feed_ad_" + t.label
                })
            }
            function h(t) {
                var e = new Image;
                e.src = t
            }
            function p() {
                for (var t, e = 0,
                         i = m.length; i > e; e++) {
                    var n = m[e];
                    l(n) ? 1 != a(n, "ad_show") && (r(n, "ad_show", 1), t = {
                            value: a(n, "ad_id"),
                            extra: a(n, "ad_extra") || f(n),
                            label: "show",
                            track: a(n, "ad_track")
                        },
                        t.track && h(t.track), d(t)) : r(n, "ad_show", 0)
                }
            }
            function f(t) {
                if (!t) return "";
                var e = t.querySelectorAll("#ad_extra")[0];
                return e.innerText || ""
            }
            var g = "/action_log/",
                m = [],
                v = c(),
                _ = {};
            _.setAds = function(t) {
                m = t,
                    p()
            },
                _.sendMsg = function(t) {
                    d(t)
                },
                s(t, "scroll", o(function() {
                        p()
                    },
                    150)),
                s(t, "resize", o(function() {
                        v = c()
                    },
                    150)),
                t.tAdMonitor = _
        } (window, document),
    riot.tag("channel", '<div class="channel {channel-fixed: options.isSuspendion}" ga_event="left-channel-click"> <ul> <li class="channel-item {active: item.url == options.tag}" each="{item, i in options.navItem}"> <a href="{item.url}" target="{_blank: item.independent}"> <i class="y-icon icon-{item.icon}"></i><span>{item.name}</span> </a> </li> <li class="channel-item channel-more"> <a href="javascript:;"> <i class="y-icon icon-morechannel"></i><span>更多</span> </a> <div class="channel-more-layer"> <ul> <li class="y-left channel-item" each="{item, i in options.navMore}"> <a href="{item.url}" target="{_blank: item.independent}"> <i class="y-icon icon-{item.icon}"></i><span>{item.name}</span> </a> </li> </ul> </div> </li> </ul> </div>',
        function(t) {
            function e(t) {
                var e = i.options.navItem.length,
                    n = i.options.navItem[e - 1];
                i.options.navItem[e - 1] = i.options.navMore[t],
                    i.options.navMore[t] = n
            }
            var i = this;
            this.options = {
                navItem: [{
                    name: "推荐",
                    url: "/",
                    icon: "recommandchannel"
                },
                    {
                        name: "热点",
                        url: "/news_hot/",
                        icon: "hotchannel"
                    },
                    {
                        name: "视频",
                        url: "/video/",
                        icon: "videochannel"
                    },
                    {
                        name: "图片",
                        url: "/news_image/",
                        icon: "imagechannel",
                        independent: !0
                    },
                    {
                        name: "军事",
                        url: "/news_military/",
                        icon: "militarychannel"
                    },
                    {
                        name: "社会",
                        url: "/news_society/",
                        icon: "socialchannel"
                    },
                    {
                        name: "娱乐",
                        url: "/news_entertainment/",
                        icon: "entertainmentchannel"
                    },
                    {
                        name: "科技",
                        url: "/news_tech/",
                        icon: "technologychannel"
                    },
                    {
                        name: "体育",
                        url: "/news_sports/",
                        icon: "sportschannel"
                    },
                    {
                        name: "汽车",
                        url: "/news_car/",
                        icon: "carchannel",
                        independent: !0
                    },
                    {
                        name: "财经",
                        url: "/news_finance/",
                        icon: "financechannel"
                    },
                    {
                        name: "游戏",
                        url: "/news_game/",
                        icon: "gamechannel"
                    }],
                navMore: [{
                    name: "国际",
                    url: "/news_world/",
                    icon: "internationalchannel"
                },
                    {
                        name: "时尚",
                        url: "/news_fashion/",
                        icon: "fashionchannel"
                    },
                    {
                        name: "健康",
                        url: "/news_health/",
                        icon: "healthchannel"
                    },
                    {
                        name: "历史",
                        url: "/news_history/",
                        icon: "explorechannel"
                    },
                    {
                        name: "星座",
                        url: "/news_astro/",
                        icon: "travelchannel"
                    },
                    {
                        name: "家居",
                        url: "/news_home/",
                        icon: "foodchannel"
                    }],
                isSuspendion: !1,
                tag: t.tag
            },
                this.init = function() {
                    for (var i = t.tag,
                             n = this.options.navMore.length,
                             o = 0; n > o; o++) {
                        var s = this.options.navMore[o];
                        if (s.url === i) {
                            e(o);
                            break
                        }
                    }
                }.bind(this),
                this.init(),
                utils.on(window, "scroll", _.throttle(function() {
                        var t = utils.scrollTop();
                        i.options.isSuspendion = t > 78,
                            i.update()
                    },
                    10))
        }),
    riot.tag("nchannel", '<div class="nchannel {nchannel-fixed: options.isSuspendion}" ga_event="left-channel-click"> <ul> <li each="{item, i in options.navItem}" onclick="{onItemClick}"> <a class="nchannel-item {active: item.url == options.tag}" href="{item.url}" target="{_blank: item.independent}" ga_event="{channel_refreh: item.url == options.tag}"> <i show="{options.abType==1}" class="y-icon icon-refreshfeed {channel-refresh: options.isRefresh}"></i><span>{item.name}</span> </a> </li> <li class="nchannel-more"> <a href="javascript:;" class="nchannel-item"> <span>更多</span> </a> <div class="nchannel-more-layer"> <ul> <li each="{item, i in options.navMore}"> <a class="y-left nchannel-item" href="{item.url}" target="{_blank: item.independent}"> <span>{item.name}</span> </a> </li> </ul> </div> </li> </ul> </div>',
        function(t) {
            function e(t) {
                var e = i.options.navItem.length,
                    n = i.options.navItem[e - 1];
                i.options.navItem[e - 1] = i.options.navMore[t],
                    i.options.navMore[t] = n
            }
            var i = this,
                n = null;
            this.options = {
                navItem: [{
                    name: "推荐",
                    url: "/",
                    icon: "recommandchannel"
                },
                    {
                        name: "热点",
                        url: "/news_hot/",
                        icon: "hotchannel"
                    },
                    {
                        name: "视频",
                        url: "/video/",
                        icon: "videochannel"
                    },
                    {
                        name: "图片",
                        url: "/news_image/",
                        icon: "imagechannel",
                        independent: !0
                    },
                    {
                        name: "军事",
                        url: "/news_military/",
                        icon: "militarychannel"
                    },
                    {
                        name: "社会",
                        url: "/news_society/",
                        icon: "socialchannel"
                    },
                    {
                        name: "娱乐",
                        url: "/news_entertainment/",
                        icon: "entertainmentchannel"
                    },
                    {
                        name: "科技",
                        url: "/news_tech/",
                        icon: "technologychannel"
                    },
                    {
                        name: "体育",
                        url: "/news_sports/",
                        icon: "sportschannel"
                    },
                    {
                        name: "汽车",
                        url: "/news_car/",
                        icon: "carchannel",
                        independent: !0
                    },
                    {
                        name: "财经",
                        url: "/news_finance/",
                        icon: "financechannel"
                    },
                    {
                        name: "游戏",
                        url: "/news_game/",
                        icon: "gamechannel"
                    }],
                navMore: [{
                    name: "国际",
                    url: "/news_world/",
                    icon: "internationalchannel"
                },
                    {
                        name: "时尚",
                        url: "/news_fashion/",
                        icon: "fashionchannel"
                    },
                    {
                        name: "健康",
                        url: "/news_health/",
                        icon: "healthchannel"
                    },
                    {
                        name: "历史",
                        url: "/news_history/",
                        icon: "explorechannel"
                    },
                    {
                        name: "星座",
                        url: "/news_astro/",
                        icon: "travelchannel"
                    },
                    {
                        name: "家居",
                        url: "/news_home/",
                        icon: "foodchannel"
                    }],
                isSuspendion: !1,
                tag: t.tag,
                isRefresh: !1,
                abType: t.abType
            },
                this.init = function() {
                    for (var i = t.tag,
                             n = this.options.navMore.length,
                             o = 0; n > o; o++) {
                        var s = this.options.navMore[o];
                        if (s.url === i) {
                            e(o);
                            break
                        }
                    }
                }.bind(this),
                this.init(),
                this.onItemClick = function(e) {
                    var o = e.item.item.url == t.tag;
                    return 1 == t.abType && o ? n ? !1 : (i.options.isRefresh = !0, window.trigger("feedRefresh"), n = setTimeout(function() {
                                    i.options.isRefresh = !1,
                                        clearTimeout(n),
                                        n = null,
                                        i.update()
                                },
                                1e3), !1) : !0
                }.bind(this),
                utils.on(window, "scroll", _.throttle(function() {
                        var t = utils.scrollTop();
                        i.options.isSuspendion = t > 98 ? !0 : !1,
                            i.update()
                    },
                    10))
        }),
    riot.tag("feedBox", '<div class="feedBox" name="feedBox"> <div if="{options.isRefresh}" riot-tag="loading"></div> <div if="{opts.type==1}" riot-tag="commonFeed" list="{options.list}" category="{opts.category}" abtype="{opts.abType}"></div> <div if="{opts.type==1}" riot-tag="wcommonFeed" list="{options.list}" category="{opts.category}" abtype="{opts.abType}"></div> <div if="{opts.type==2}" riot-tag="essayFeed" list="{options.list}"></div> <div if="{options.isLoadmore}" riot-tag="loading"></div> </div>',
        function(t) {
            function e(t) {
                var e = ascp.getHoney();
                r.params = _.extend({},
                    r.params, {
                        as: e.as,
                        cp: e.cp,
                        max_behot_time: "refresh" === t ? 0 : r.params.max_behot_time_tmp
                    })
            }
            function i() {
                for (var t = 0; t < r.options.list.length; t++) {
                    var e = r.options.list[t];
                    e.timeago = utils.timeAgo(e.behot_time)
                }
            }
            function n() {
                var t;
                return tStorage.exist() && tStorage.get("n_cache_id") === s && (t = tStorage.get(a)),
                t && tStorage.decode(t)
            }
            function o(t) {
                tStorage.exist() && (tStorage.set("n_cache_id", s), t && tStorage.set(a, tStorage.encode(t)))
            }
            riot.observable(this);
            var s = "1",
                a = "N" + location.pathname,
                r = this,
                c = !1,
                l = !1,
                u = t.feedUrl ? "/api/pc/feed/": "/api/article/feed/";
            this.options = {
                list: [],
                isRefresh: !1,
                isLoadmore: !1
            },
                this.params = {
                    category: t.category,
                    utm_source: "toutiao",
                    widen: t.widen || 0,
                    max_behot_time: 0,
                    max_behot_time_tmp: 0
                },
                this.init = function() {
                    var e = n();
                    e && _.isArray(e.data) && (this.options.list = this.options.list.concat(e.data)),
                        this.refresh(),
                        utils.on(window, "scroll", _.throttle(function() {
                                var t = utils.scrollTop(),
                                    e = r.feedBox.clientHeight,
                                    i = window.screen.height;
                                600 > e - t - i && r.loadmore()
                            },
                            350)),
                    1 === t.type && setInterval(function() {
                            i(),
                                r.update()
                        },
                        12e4)
                }.bind(this),
                this.refresh = function(e) {
                    window.scrollTo(0, e || 0),
                        this.options.isRefresh = !0,
                        r.update(),
                        this.getData("refresh",
                            function(e) {
                                var i = e.data || [];
                                r.options.isRefresh = !1,
                                1 == t.type && i.length > 0 && r.options.list.push({
                                    feedMsg: !0,
                                    behot_time: r.params.max_behot_time_tmp,
                                    article_genre: "refresh"
                                }),
                                i.length > 0 && o(e),
                                    window.trigger("feedRefreshStop", i.length)
                            })
                }.bind(this),
                this.loadmore = function() {
                    this.options.isLoadmore = !0,
                        r.update(),
                        this.getData("loadmore",
                            function() {
                                r.options.isLoadmore = !1
                            })
                }.bind(this),
                this.getData = function(n, o) {
                    c || l || (c = !0, e(n), http({
                        url: u,
                        method: "get",
                        data: r.params,
                        success: function(e) {
                            if ("success" === e.message) {
                                if (e.data && e.data.captcha) return l = !0,
                                    void window.trigger("codeVerification", e.data);
                                "refresh" === n && (r.options.list = [], r.update()),
                                    r.options.list = r.options.list.concat(e.data),
                                    r.params.max_behot_time_tmp = e.next.max_behot_time,
                                1 == t.type && i(),
                                taAnalysis && taAnalysis.send("event", {
                                    ev: "article_show_count",
                                    ext_id: e.data.length
                                })
                            }
                            c = !1,
                            o && o(e),
                                r.update()
                        }
                    }))
                }.bind(this),
                this.init(),
                window.on("codeVerificationSuccess",
                    function() {
                        l = !1
                    }),
                window.on("feedRefresh",
                    function() {
                        window.trigger("msgAlert-close");
                        var t = 0;
                        document.getElementById("J_carousel") && (t = 454),
                            r.refresh(t)
                    })
        }),
    riot.tag("msgAlert", '<div if="{options.show}" name="msgAlertPlace" class="msgAlert-place"> <div name="msgAlert" class="msgAlert"> <span onclick="{onRereshClick}" ga_event="refresh_float_click">您有未读新闻，点击查看</span> <i class="y-icon icon-dislikenewfeed" onclick="{onCloseRefreshClick}" ga_event="refresh_close_click"></i> </div> </div> <div class="msgAlert {msgAlert-hidden: options.articleCount < 0}"> <span if="{options.articleCount > 0}">为您推荐了{options.articleCount}篇文章</span> <span if="{options.articleCount == 0}">暂时没有更新，休息一会儿吧</span> <div style="background-color: #fff; height: 1px;"></div> </div>',
        function(t) {
            function e() {
                n && (clearTimeout(n), n = null),
                    n = setTimeout(function() {
                            i.options.show = !0,
                                utils.removeClass(i.msgAlert, "msgAlert-fixed"),
                                i.update()
                        },
                        s)
            }
            var i = this,
                n = null,
                o = null,
                s = 36e4;
            this.options = {
                show: !1,
                category: t.category,
                articleCount: -1
            },
                this.onRereshClick = function() {
                    this.options.show = !1,
                        window.trigger("feedRefresh")
                }.bind(this),
                this.onCloseRefreshClick = function() {
                    this.options.show = !1,
                        e()
                }.bind(this),
                window.on("msgAlert-close",
                    function() {
                        i.options.show = !1,
                            e(),
                            i.update()
                    }),
                window.on("feedRefreshStop",
                    function(t) {
                        i.options.articleCount = t > 0 ? t - 1 : 0,
                        o && clearTimeout(o),
                            o = setTimeout(function() {
                                    i.options.articleCount = -1,
                                        i.update()
                                },
                                2300)
                    }),
                this.on("mount",
                    function() {
                        if ("__all__" === i.options.category) {
                            this.msgAlert.style.width = t.mwidth + "px";
                            var n = t.mtop;
                            utils.on(window, "scroll", _.throttle(function() {
                                    var t = utils.offset(i.msgAlertPlace).top;
                                    n = t > n ? t: n,
                                        scrollTop = utils.scrollTop(),
                                    i.options.show && (scrollTop > n ? utils.addClass(i.msgAlert, "msgAlert-fixed") : utils.removeClass(i.msgAlert, "msgAlert-fixed"))
                                },
                                10)),
                                e()
                        }
                    })
        }),
    riot.tag("commonFeed", '<div class="commonFeed"> <div riot-tag="msgAlert" category="{opts.category}" mwidth="600" mtop="100"></div> <ul> <li class="item {item-hidden: item.honey} {J_add: item.ad_id}" each="{item, i in opts.list}" ga_event="{item.article_genre}_item_click" ad_id="{item.ad_id}" ad_track="{item.ad_track_url}" onclick="{onItemClick}"> <span id="ad_extra" style="display:none;">{item.log_extra}</span> <div if="{!item.feedMsg}" class="y-box item-inner"> <div if="{item.single_mode}" class="y-left lbox" ga_event="{item.article_genre}_img_click"> <a class="img-wrap" href="{item.source_url}" target="_blank"> <img riot-src="{item.image_url}" alt=""> <i if="{item.has_video && item.video_duration_str}" class="ftype video"> <span>{item.video_duration_str}</span> </i> </a> </div> <div class="{rbox: item.single_mode} {normal: !item.single_mode}"> <div class="rbox-inner"> <div class="title-box" ga_event="{item.article_genre}_title_click"> <a class="link title" href="{item.source_url}" target="_blank"> {item.title} </a> </div> <div if="{item.has_gallery}" class="img-list y-box" ga_event="{item.article_genre}_img_click"> <a each="{imgItem, j in item.image_list}" if="{j<3}" class="img-wrap" href="{item.source_url}" target="_blank"> <img riot-src="{imgItem.url}" alt=""> </a> <span class="img-num">{item.gallary_image_count}图</span> </div> <div class="y-box footer"> <div class="y-left"> <div class="y-left" if="{!item.media_url}"> <a class="lbtn media-avatar avatar-bg-{parent.sourceFlag(item.source, i)}" href="/search/?keyword={item.source}" ga_event="{item.article_genre}_avatar_click" target="_blank">{parent.sourceHandle(item.source)}</a> <a class="lbtn source" href="/search/?keyword={item.source}" ga_event="{item.article_genre}_name_click" target="_blank">&nbsp;{item.source}&nbsp;&sdot;</a> </div> <div class="y-left" if="{item.media_url}"> <a class="lbtn media-avatar" ga_event="{item.article_genre}_avatar_click" href="{item.media_url}" target="_blank"> <img riot-src="{item.media_avatar_url}" alt=""> </a> <a class="lbtn source" ga_event="{item.article_genre}_name_click" href="{item.media_url}" target="_blank">&nbsp;{item.source}&nbsp;&sdot;</a> <a class="lbtn comment" ga_event="{item.article_genre}_comment_click" href="{item.source_url}/#comment_area" target="_blank">&nbsp;{item.comments_count}评论&nbsp;&sdot;</a> </div> <span class="lbtn">&nbsp;{item.timeago}</span> <span if="{item.hot}" class="lbtn tag-hot">热</span> <span if="{item.ad_id}" class="lbtn recommend">{item.ad_label}</span> </div> <div class="y-right"> <span class="dislike" data-groupid="{item.group_id}" ga_event="{item.article_genre}_dislike_click" onclick="{onDislikeClick}"> 不感兴趣 <i class="y-icon icon-dislikenewfeed"></i> </span> </div> </div> </div> </div> </div> <div if="{item.feedMsg}" class="list-refresh-msg" onclick="{onFeedrefreshClick}"> <span>{item.timeago}看到这里</span> &nbsp;点击刷新&nbsp;<i class="y-icon icon-refreshfeed"></i> </div> </li> </ul> </div>',
        function(t) {
            var e = this,
                i = {};
            this.options = {
                abtype: t.abtype
            },
                this.onDislikeClick = function(t) {
                    user.checkLogin({
                        successCb: function() {
                            e._dislike(t.item)
                        },
                        errorCb: function() {
                            window.trigger("login", {
                                successCb: function(i) {
                                    window.trigger("userChange", i),
                                        e._dislike(t.item)
                                }
                            })
                        }
                    })
                }.bind(this),
                this._dislike = function(i) {
                    http({
                        url: "/api/dislike/",
                        data: {
                            group_id: i.item.group_id,
                            action: "dislike",
                            app_name: "toutiao_web"
                        },
                        method: "post",
                        success: function(n) {
                            "success" === n.message && (t.list.splice(i.i, 1), e.update())
                        }
                    })
                }.bind(this),
                this.onFeedrefreshClick = function() {
                    window.trigger("feedRefresh")
                }.bind(this),
                this.onItemClick = function(t) {
                    var e = t.item.item;
                    return e.ad_id && tAdMonitor && tAdMonitor.sendMsg({
                        label: "click",
                        value: e.ad_id,
                        extra: e.log_extra
                    }),
                    e.is_diversion_page && taAnalysis && taAnalysis.send("event", {
                        ev: "diversion_page_click"
                    }),
                        !0
                }.bind(this),
                this.sourceFlag = function(t, e) {
                    return (t = t.replace(/\s*/gi, "")) ? (void 0 === i[t] && (i[t] = e % 6), i[t]) : 0
                }.bind(this),
                this.sourceHandle = function(t) {
                    return t = t.replace(/\s*/gi, ""),
                        t ? t.slice(0, 1) : ""
                }.bind(this),
                this.on("updated",
                    function() {
                        if (tAdMonitor) {
                            var t = document.querySelectorAll(".J_add");
                            t && tAdMonitor.setAds(t)
                        }
                    })
        }),
    riot.tag("hotVideo", '<div class="module-head video-head"><a href="/video/" target="_blank">热门视频</a></div> <ul> <li class="hot-item" each="{ items }"> <a class="hot-link" href="{display_url}" target="_blank"> <div class="module-pic video-image"> <img riot-src="{pc_image_url}" onload="this.style.opacity=1"> </div> <i class="hot-tag video-tag"> <span>{video_duration_format}</span> </i> <p class="hot-title module-title">{title}</p> </a> </li> </ul>', 'class="hotVideo module" if="{items.length !== 0}" ga_event="click_video_recommend"',
        function() {
            var t = this;
            this.items = [],
                this.init = function() {
                    this.getData()
                }.bind(this),
                this.getData = function() {
                    http({
                        url: "/api/article/pc_hot_video/",
                        method: "get",
                        data: {},
                        success: function(e) {
                            this.loading = !1,
                            "success" === e.message && 0 !== e.data.length && (t.items = e.data, t.show = !0, t.update())
                        }
                    })
                }.bind(this),
                this.init()
        }),
    riot.tag("hotPicture", '<div class="module-head pic-head"><a href="/news_image/" target="_blank">精彩图片</a></div> <ul> <li class="hot-item" each="{ items }"> <a href="{article_url}" class="hot-link" target="_blank"> <div if="{gallary_flag === 1}" class="pic-style style_1"> <div class="module-pic pic-big"><img riot-src="{image_list[0].url}" alt=""></div> </div> <div if="{gallary_flag === 2}" class="pic-style style_2"> <div class="module-pic pic-middle"><img riot-src="{image_list[0].url}" alt=""></div> <div class="module-pic pic-small"><img riot-src="{image_list[1].url}" alt=""></div> <div class="module-pic pic-small"><img riot-src="{image_list[2].url}" alt=""></div> </div> <div if="{gallary_flag === 3}" class="pic-style style_3"> <div class="module-pic pic-middle"><img riot-src="{image_list[1].url}" alt=""></div> <div class="module-pic pic-small"><img riot-src="{image_list[0].url}" alt=""></div> <div class="module-pic pic-small"><img riot-src="{image_list[2].url}" alt=""></div> </div> <i if="{gallery_image_count}" class="hot-tag pic-tag"> <span>{gallery_image_count}图</span> </i> <p class="hot-title module-title">{title}</p> </a> </li> </ul>', 'class="hotPicture module" if="{items.length !== 0}" ga_event="click_pictures_recommend"',
        function() {
            var t = this;
            this.items = [],
                this.init = function() {
                    this.getData()
                }.bind(this),
                this.getData = function() {
                    http({
                        url: "/api/article/pc_hot_gallery/",
                        method: "get",
                        data: {},
                        success: function(e) {
                            "success" === e.message && 0 !== e.data.length && (t.items = e.data, t.update())
                        }
                    })
                }.bind(this),
                this.init()
        }),
    riot.tag("hotNews", '<div class="module-head news-head"> 24小时热闻 </div> <ul class="news-content"> <li each="{ items }" class="news-list"> <a href="/a{group_id}" target="_blank" class="news-link"> <div if="{image_url}" class="module-pic news-pic"><img riot-src="{image_url}"></div> <div class="news-inner"> <p class="module-title">{title}</p> </div> </a> </li> </ul>', 'class="hotNews module" ga_event="click_hot_news"',
        function(t) {
            this.items = t.hotNews.slice(0, 4)
        }),
    riot.tag("hotJoke", '<div class="joke-head module-head"> <a href="/essay_joke/" target="_blank">热门段子</a> </div> <div id="jokeContainer"> <ul id="jokeInner" name="scrollInner"> <li each="{items}" class="joke-list" > <a class="joke-user" href="/user/{group.user.user_id}" target="_blank"> <div><img riot-src="{group.user.avatar_url}" alt=""></div> <div><span class="user-name">{group.user.name}</span></div> </a>  <div if="{long === true}" class="joke-text"> <a href="/a{group.group_id}" target="_blank"> <p if="{fold === true}">{shortText}<span class="{fold:fold===true,unfold:fold===false}" onclick="{foldClick}">{btn}</span></p> <p if="{fold === false}">{group.text}<span class="{fold:fold===true,unfold:fold===false}" onclick="{foldClick}">{btn}</span></p> </a> </div> <div if="{long === false}" class="joke-text"> <a href="/a{group.group_id}" target="_blank"> <p>{group.text}</p> </a> </div>  <div class="joke-comment"> <a href="/a{group.group_id}/#comment" target="_blank"> {group.comment_count}条神评 </a> <span onclick="{onDiggClick}" class="{selected:group.user_digg === 1}"> <i class="y-icon icon-handup"></i>{count} </span> </div> </li> </ul> <div class="joke-mask"></div> </div>', 'if="{items.length !== 0}" class="hotJoke module" ga_event="click_joke_news"',
        function() {
            function t(t) {
                for (var e = 0,
                         i = t.length,
                         n = 0; i > n; n++) t.charCodeAt(n) > 255 ? e += 2 : e++;
                return e
            }
            function e(t, e) {
                for (var i = "",
                         n = 0,
                         o = 0; o < t.length && (t.charCodeAt(o) > 255 ? n += 2 : n++, i += t.charAt(o), !(n >= e)); o++);
                return i
            }
            var i = this;
            this.items = [],
                this.init = function() {
                    this.getData()
                }.bind(this),
                this.getData = function() {
                    http({
                        url: "/api/article/pc_hot_essay?count=4",
                        method: "get",
                        data: {},
                        success: function(t) {
                            "success" === t.message && 0 !== t.data.length && (i.items = t.data, i.fillJoke())
                        }
                    })
                }.bind(this),
                this.fillJoke = function() {
                    for (var n = 0; n < i.items.length; n++) {
                        var o = i.items[n];
                        o.count = i.numFormat(o.group.digg_count);
                        var s = t(o.group.text);
                        s > 180 ? (o["long"] = !0, o.shortText = e(o.group.text, 150) + "...", o.btn = "展开", o.fold = !0) : o["long"] = !1
                    }
                    i.update(),
                        scrollbar("jokeContainer", "jokeInner", "scrollDiv")
                }.bind(this),
                this.foldClick = function(t) {
                    var e = t.item;
                    e.fold ? (e.fold = !1, e.btn = "收起") : (e.fold = !0, e.btn = "展开"),
                        i.update()
                }.bind(this),
                this.onDiggClick = function(t) {
                    var e = t.item,
                        n = e.group.group_id;
                    if (1 !== e.group.user_digg) {
                        var o = function() {
                            http({
                                headers: {
                                    "X-CSRFToken": Cookies.get("csrftoken")
                                },
                                url: "/group/article/" + n + "/digg/",
                                method: "post",
                                success: function(t) {
                                    "success" === t.message && (e.group.user_digg = 1, e.count = i.numFormat(t.stats.digg_count), i.update())
                                }
                            })
                        };
                        user.checkLogin({
                            successCb: function() {
                                o()
                            },
                            errorCb: function() {
                                window.trigger("login", {
                                    successCb: function(t) {
                                        window.trigger("userChange", t),
                                            o()
                                    }
                                })
                            }
                        })
                    }
                }.bind(this),
                this.numFormat = function(t) {
                    return "[object Number]" === Object.prototype.toString.call( + t) ? 1e4 > t ? t: (t / 1e4).toFixed(2) + "万": void 0
                }.bind(this),
                this.init()
        });
var scrollbar = function(t, e, i) {
    function n(t, e, i) {
        t.addEventListener ? t.addEventListener(e, i, !1) : t.attachEvent ? t.attachEvent("on" + e, i) : t["on" + e] = i
    }
    function o(t, e, i) {
        t.removeEventListener ? t.removeEventListener(e, i, !1) : t.attachEvent ? t.attachEvent("on" + e, i) : t["on" + e] = i
    }
    function s() {
        document.getElementById("scrollbar").parentNode.style.display = "block"
    }
    function a() {
        document.getElementById("scrollbar").parentNode.style.display = "none"
    }
    function r(t) {
        var e = t || window.event;
        return e.wheelDelta ? -e.wheelDelta: 40 * e.detail
    }
    function c() {
        this.init.apply(this, arguments)
    }
    var l = document,
        u = 0;
    c.prototype = {
        init: function(t, e, i) {
            var t = l.getElementById(t),
                e = l.getElementById(e),
                n = this._createScroll(t, i);
            this._resizeScorll(n, t, e),
                this._tragScroll(n, t, e),
                this._wheelChange(n, t, e),
                this._clickScroll(n, t, e)
        },
        _createScroll: function(t, e) {
            var i = l.createElement("div"),
                n = l.createElement("div"),
                o = l.createElement("span");
            return i.appendChild(n),
                n.appendChild(o),
                n.className = e,
                n.setAttribute("id", "scrollbar"),
                t.appendChild(i),
                n
        },
        _resizeScorll: function(t, e, i) {
            var o = t.parentNode,
                r = (i.offsetHeight, e.clientWidth),
                c = e.clientHeight,
                l = t.offsetWidth,
                u = r - l;
            t.style.position = "absolute",
                o.style.position = "absolute",
                o.style.width = l + "px",
                o.style.height = c + "px",
                o.style.left = u + "px",
                o.style.display = "none",
                e.style.overflow = "hidden",
                e.style.position = "relative",
                i.style.position = "absolute",
                i.style.left = 0,
                i.style.top = 0,
                i.style.width = r + "px",
                n(e, "mouseover", s),
                n(e, "mouseout", a)
        },
        _tragScroll: function(t, e, i) {
            t.onmousedown = function(s) {
                function r(n) {
                    var s = n || window.event,
                        r = s.clientY,
                        l = r - d + c;
                    l > e.clientHeight - t.offsetHeight && (l = e.clientHeight - t.offsetHeight),
                    0 >= l && (l = 0),
                        t.style.top = l + "px",
                        i.style.top = -l * ((i.offsetHeight - e.offsetHeight) / (e.clientHeight - t.offsetHeight)) + "px",
                        u = l,
                        o(e, "mouseout", a),
                        t.parentNode.style.display = "block",
                        document.body.style.userSelect = "none",
                        document.body.style.MozUserSelect = "none",
                        document.body.style.WebkitUserSelect = "none",
                        document.body.onselectstart = document.body.ondrag = function() {
                            return ! 1
                        }
                }
                var c = t.offsetTop,
                    l = s || window.event,
                    d = l.clientY;
                document.onmousemove = r,
                    document.onmouseup = function() {
                        this.onmousemove = null,
                            n(e, "mouseout", a),
                            document.body.style.userSelect = "auto",
                            document.body.style.MozUserSelect = "auto",
                            document.body.style.WebkitUserSelect = "auto",
                            document.body.onselectstart = document.body.ondrag = function() {
                                return ! 0
                            }
                    }
            }
        },
        _wheelChange: function(t, e, i) {
            n(e, "mousewheel",
                function(n) {
                    document.all ? window.event.returnValue = !1 : n.preventDefault();
                    var o = r(n);
                    u += o / 6,
                    0 >= u && (u = 0),
                    u >= e.clientHeight - t.offsetHeight && (u = e.clientHeight - t.offsetHeight),
                        t.style.top = u + "px",
                        i.style.top = -u * (i.offsetHeight - e.offsetHeight) / (e.clientHeight - t.offsetHeight) + "px"
                }),
                n(e, "DOMMouseScroll",
                    function(n) {
                        var o = r(n);
                        n.preventDefault(),
                            u += o / 6,
                        0 >= u && (u = 0),
                        u >= e.clientHeight - t.offsetHeight && (u = e.clientHeight - t.offsetHeight),
                            t.style.top = u + "px",
                            i.style.top = -u * (i.offsetHeight - e.offsetHeight) / (e.clientHeight - t.offsetHeight) + "px"
                    })
        },
        _clickScroll: function(t, e, i) {
            var n = t.parentNode;
            n.onclick = function(n) {
                var o = n || window.event,
                    s = (o.target || o.srcElement, e.getBoundingClientRect().top),
                    a = o.clientY - s - t.offsetHeight / 2;
                0 >= a && (a = 0),
                a >= e.clientHeight - t.offsetHeight && (a = e.clientHeight - t.offsetHeight),
                    t.style.top = a + "px",
                    i.style.top = -a * (i.offsetHeight - e.offsetHeight) / (e.clientHeight - t.offsetHeight) + "px",
                    u = a
            }
        }
    },
        new c(t, e, i)
};
riot.tag("feedback", '<ul class="{ab-style: opts.abType == 2}"> <li class="tool-item go-top" onclick="{goTop}"> <a href="javascript:;"> <i class="y-icon icon-backtotopfeed"></i> </a> </li> </ul>', 'class="feedback"',
    function() {
        this.onFeedRefresh = function() {
            window.trigger("feedRefresh")
        }.bind(this),
            this.goTop = function() {
                window.scrollTo(0, 0)
            }.bind(this)
    }),
    riot.tag("tbanneradd", '',
        function() {}),
    riot.tag("tfeedadd", '',
        function() {
            this.options = {
                isClose: !1
            },
                this.closeFeedAdd = function(t) {
                    this.options.isClose = !0,
                        utils.preventDefault(t)
                }.bind(this)
        }),
    riot.tag("essayFeed", '<div class="essayFeed"> <ul> <li class="essay-item" each="{item in opts.list}"> <div if="{item.group.status === 112}" class="hot-tag">热门</div> <div class="media-info"> <a class="img-wrap" href="/user/{item.group.user.user_id}" target="_blank"> <img riot-src="{item.group.user.avatar_url}" alt=""> </a> <a class="media-name" href="/user/{item.group.user.user_id}" target="_blank">{item.group.user.name}</a> </div> <a href="/a{item.group.group_id}" target="_blank"> <p class="essay-content">{item.group.text}</p> </a> <a if="{item.comments && item.comments.length>0}" href="/a{item.group.group_id}" target="_blank" class="god-comment"> <span>神评：</span>{item.comments[0].text} </a> <div class="essay-tool"> <div class="action-btn action-btn-left {selected:item.group.user_digg}" data-type="dig" onclick="{ diggClick }"> <i class="y-icon icon-handup"></i><span>{numFormat(item.group.digg_count)}</span> </div> <div class="action-btn action-btn-left {selected:item.group.user_bury}" data-type="bury" onclick="{ buryClick }"> <i class="y-icon icon-handdown"></i><span>{numFormat(item.group.bury_count)}</span> </div> <div class="action-btn action-btn-right share-wrap" > <i class="y-icon icon-share"></i> <span>{numFormat(item.group.share_count)}</span> <div class="snsbox clearfix"> <p class="snsbox-share">分享到:</p> <div class="snszone"> <i class="sns-btn sns-weixin" title="分享到微信" onmouseenter="{weixinshare}" data-share="0"> <div class="qrcodeW"> <div class="qrcode"></div> </div> </i> <i class="sns-btn sns-qzone" title="分享到QQ空间" onclick="{qzoneClick}"></i> <i class="sns-btn sns-weibo" title="分享到新浪微博" onclick="{tsinaClick}"></i> </div> </div> </div> <div class="action-btn action-btn-right {selected:item.group.user_repin}" onclick="{repinClick}"> <i class="y-icon icon-favorite"></i> <span>{numFormat(item.group.repin_count)}</span> </div> <a href="/a{item.group.group_id}#comment" target="_blank" class="action-btn action-btn-right essay-comment"> <i class="y-icon icon-comment"></i><span>{numFormat(item.group.comment_count)}</span> </a> </div> </li> </ul> </div>',
        function() {
            var t = this;
            this.sendRequest = function(e, i) {
                var n = i.group.group_id,
                    o = "/api/essay/item_action/",
                    s = function() {
                        http({
                            headers: {
                                "X-CSRFToken": Cookies.get("csrftoken")
                            },
                            url: o,
                            method: "post",
                            data: {
                                action: e,
                                group_id: n,
                                app_name: "neihanshequ_web",
                                csrfmiddlewaretoken: Cookies.get("csrftoken")
                            },
                            success: function(n) {
                                if ("success" === n.message) {
                                    switch (e) {
                                        case "digg":
                                            i.group.user_digg = 1,
                                                i.group.digg_count = n.digg_count;
                                            break;
                                        case "bury":
                                            i.group.user_bury = 1,
                                                i.group.bury_count = n.bury_count;
                                            break;
                                        case "repin":
                                            i.group.user_repin = 1,
                                                i.group.repin_count = n.repin_count;
                                            break;
                                        case "unrepin":
                                            i.group.user_repin = 0,
                                                i.group.repin_count = n.repin_count
                                    }
                                    t.update()
                                }
                            }
                        })
                    };
                user.checkLogin({
                    successCb: function() {
                        s()
                    },
                    errorCb: function() {
                        window.trigger("login", {
                            successCb: function(t) {
                                window.trigger("userChange", t),
                                    s()
                            }
                        })
                    }
                })
            }.bind(this),
                this.diggClick = function(t) {
                    var e = t.item.item;
                    e.group.user_digg || e.group.user_bury || this.sendRequest("digg", e)
                }.bind(this),
                this.buryClick = function(t) {
                    var e = t.item.item;
                    e.group.user_digg || e.group.user_bury || this.sendRequest("bury", e)
                }.bind(this),
                this.repinClick = function(t) {
                    var e = t.item.item,
                        i = 0 == e.group.user_repin ? "repin": "unrepin";
                    this.sendRequest(i, e)
                }.bind(this),
                this.numFormat = function(t) {
                    return "[object Number]" === Object.prototype.toString.call( + t) ? 1e4 > t ? t: (t / 1e4).toFixed(2) + "万": void 0
                }.bind(this),
                this.qzoneClick = function(t) {
                    var e = {
                        url: "http://toutiao.com/a" + t.item.item.group.group_id + "/?app=news_article",
                        text: "【（分享来自 @今日头条）" + t.item.item.group.text + "...",
                        desc: "来自头条 http://toutiao.com"
                    };
                    bdshare("qzone", e)
                }.bind(this),
                this.tsinaClick = function(t) {
                    var e = {
                        url: "http://toutiao.com/a" + t.item.item.group.group_id + "/?app=news_article",
                        text: "【（分享来自 @今日头条）" + t.item.item.group.text + "...",
                        desc: "来自头条 http://toutiao.com"
                    };
                    bdshare("tsina", e)
                }.bind(this),
                this.weixinshare = function(t) {
                    var e = t.target,
                        i = "http://neihanshequ.com/p" + t.item.item.group.group_id + "/?app=news_article";
                    if (1 != e.getAttribute("data-share")) {
                        var n = qrCode(6, "M");
                        n.addData(i),
                            n.make(),
                            e.getElementsByTagName("div")[1].innerHTML = n.createTableTag(),
                            e.setAttribute("data-share", 1)
                    }
                }.bind(this)
        }),
    !
        function(t, e, i) {
            "undefined" != typeof module && module.exports ? module.exports = i() : "function" == typeof define && define.amd ? define("static/js/lib/qrcode", [], i) : e[t] = i()
        } ("qrCode", this,
            function() {
                function t(e, i) {
                    if ("undefined" == typeof e.length) throw new Error(e.length + "/" + i);
                    var n = function() {
                            for (var t = 0; t < e.length && 0 == e[t];) t += 1;
                            for (var n = new Array(e.length - t + i), o = 0; o < e.length - t; o += 1) n[o] = e[o + t];
                            return n
                        } (),
                        o = {};
                    return o.get = function(t) {
                        return n[t]
                    },
                        o.getLength = function() {
                            return n.length
                        },
                        o.multiply = function(e) {
                            for (var i = new Array(o.getLength() + e.getLength() - 1), n = 0; n < o.getLength(); n += 1) for (var s = 0; s < e.getLength(); s += 1) i[n + s] ^= a.gexp(a.glog(o.get(n)) + a.glog(e.get(s)));
                            return t(i, 0)
                        },
                        o.mod = function(e) {
                            if (o.getLength() - e.getLength() < 0) return o;
                            for (var i = a.glog(o.get(0)) - a.glog(e.get(0)), n = new Array(o.getLength()), s = 0; s < o.getLength(); s += 1) n[s] = o.get(s);
                            for (var s = 0; s < e.getLength(); s += 1) n[s] ^= a.gexp(a.glog(e.get(s)) + i);
                            return t(n, 0).mod(e)
                        },
                        o
                }
                var e = function(e, i) {
                    var o = 236,
                        a = 17,
                        u = e,
                        d = n[i],
                        h = null,
                        g = 0,
                        m = null,
                        v = new Array,
                        _ = {},
                        w = function(t, e) {
                            g = 4 * u + 17,
                                h = function(t) {
                                    for (var e = new Array(t), i = 0; t > i; i += 1) {
                                        e[i] = new Array(t);
                                        for (var n = 0; t > n; n += 1) e[i][n] = null
                                    }
                                    return e
                                } (g),
                                b(0, 0),
                                b(g - 7, 0),
                                b(0, g - 7),
                                C(),
                                k(),
                                T(t, e),
                            u >= 7 && x(t),
                            null == m && (m = E(u, d, v)),
                                A(m, e)
                        },
                        b = function(t, e) {
                            for (var i = -1; 7 >= i; i += 1) if (! ( - 1 >= t + i || t + i >= g)) for (var n = -1; 7 >= n; n += 1) - 1 >= e + n || e + n >= g || (h[t + i][e + n] = i >= 0 && 6 >= i && (0 == n || 6 == n) || n >= 0 && 6 >= n && (0 == i || 6 == i) || i >= 2 && 4 >= i && n >= 2 && 4 >= n ? !0 : !1)
                        },
                        y = function() {
                            for (var t = 0,
                                     e = 0,
                                     i = 0; 8 > i; i += 1) {
                                w(!0, i);
                                var n = s.getLostPoint(_); (0 == i || t > n) && (t = n, e = i)
                            }
                            return e
                        },
                        k = function() {
                            for (var t = 8; g - 8 > t; t += 1) null == h[t][6] && (h[t][6] = t % 2 == 0);
                            for (var e = 8; g - 8 > e; e += 1) null == h[6][e] && (h[6][e] = e % 2 == 0)
                        },
                        C = function() {
                            for (var t = s.getPatternPosition(u), e = 0; e < t.length; e += 1) for (var i = 0; i < t.length; i += 1) {
                                var n = t[e],
                                    o = t[i];
                                if (null == h[n][o]) for (var a = -2; 2 >= a; a += 1) for (var r = -2; 2 >= r; r += 1) h[n + a][o + r] = -2 == a || 2 == a || -2 == r || 2 == r || 0 == a && 0 == r ? !0 : !1
                            }
                        },
                        x = function(t) {
                            for (var e = s.getBCHTypeNumber(u), i = 0; 18 > i; i += 1) {
                                var n = !t && 1 == (e >> i & 1);
                                h[Math.floor(i / 3)][i % 3 + g - 8 - 3] = n
                            }
                            for (var i = 0; 18 > i; i += 1) {
                                var n = !t && 1 == (e >> i & 1);
                                h[i % 3 + g - 8 - 3][Math.floor(i / 3)] = n
                            }
                        },
                        T = function(t, e) {
                            for (var i = d << 3 | e,
                                     n = s.getBCHTypeInfo(i), o = 0; 15 > o; o += 1) {
                                var a = !t && 1 == (n >> o & 1);
                                6 > o ? h[o][8] = a: 8 > o ? h[o + 1][8] = a: h[g - 15 + o][8] = a
                            }
                            for (var o = 0; 15 > o; o += 1) {
                                var a = !t && 1 == (n >> o & 1);
                                8 > o ? h[8][g - o - 1] = a: 9 > o ? h[8][15 - o - 1 + 1] = a: h[8][15 - o - 1] = a
                            }
                            h[g - 8][8] = !t
                        },
                        A = function(t, e) {
                            for (var i = -1,
                                     n = g - 1,
                                     o = 7,
                                     a = 0,
                                     r = s.getMaskFunction(e), c = g - 1; c > 0; c -= 2) for (6 == c && (c -= 1);;) {
                                for (var l = 0; 2 > l; l += 1) if (null == h[n][c - l]) {
                                    var u = !1;
                                    a < t.length && (u = 1 == (t[a] >>> o & 1));
                                    var d = r(n, c - l);
                                    d && (u = !u),
                                        h[n][c - l] = u,
                                        o -= 1,
                                    -1 == o && (a += 1, o = 7)
                                }
                                if (n += i, 0 > n || n >= g) {
                                    n -= i,
                                        i = -i;
                                    break
                                }
                            }
                        },
                        S = function(e, i) {
                            for (var n = 0,
                                     o = 0,
                                     a = 0,
                                     r = new Array(i.length), c = new Array(i.length), l = 0; l < i.length; l += 1) {
                                var u = i[l].dataCount,
                                    d = i[l].totalCount - u;
                                o = Math.max(o, u),
                                    a = Math.max(a, d),
                                    r[l] = new Array(u);
                                for (var h = 0; h < r[l].length; h += 1) r[l][h] = 255 & e.getBuffer()[h + n];
                                n += u;
                                var p = s.getErrorCorrectPolynomial(d),
                                    f = t(r[l], p.getLength() - 1),
                                    g = f.mod(p);
                                c[l] = new Array(p.getLength() - 1);
                                for (var h = 0; h < c[l].length; h += 1) {
                                    var m = h + g.getLength() - c[l].length;
                                    c[l][h] = m >= 0 ? g.get(m) : 0
                                }
                            }
                            for (var v = 0,
                                     h = 0; h < i.length; h += 1) v += i[h].totalCount;
                            for (var _ = new Array(v), w = 0, h = 0; o > h; h += 1) for (var l = 0; l < i.length; l += 1) h < r[l].length && (_[w] = r[l][h], w += 1);
                            for (var h = 0; a > h; h += 1) for (var l = 0; l < i.length; l += 1) h < c[l].length && (_[w] = c[l][h], w += 1);
                            return _
                        },
                        E = function(t, e, i) {
                            for (var n = r.getRSBlocks(t, e), l = c(), u = 0; u < i.length; u += 1) {
                                var d = i[u];
                                l.put(d.getMode(), 4),
                                    l.put(d.getLength(), s.getLengthInBits(d.getMode(), t)),
                                    d.write(l)
                            }
                            for (var h = 0,
                                     u = 0; u < n.length; u += 1) h += n[u].dataCount;
                            if (l.getLengthInBits() > 8 * h) throw new Error("code length overflow. (" + l.getLengthInBits() + ">" + 8 * h + ")");
                            for (l.getLengthInBits() + 4 <= 8 * h && l.put(0, 4); l.getLengthInBits() % 8 != 0;) l.putBit(!1);
                            for (; ! (l.getLengthInBits() >= 8 * h) && (l.put(o, 8), !(l.getLengthInBits() >= 8 * h));) l.put(a, 8);
                            return S(l, n)
                        };
                    return _.addData = function(t) {
                        var e = l(t);
                        v.push(e),
                            m = null
                    },
                        _.isDark = function(t, e) {
                            if (0 > t || t >= g || 0 > e || e >= g) throw new Error(t + "," + e);
                            return h[t][e]
                        },
                        _.getModuleCount = function() {
                            return g
                        },
                        _.make = function() {
                            w(!1, y())
                        },
                        _.createTableTag = function(t, e) {
                            t = t || 2,
                                e = "undefined" == typeof e ? 4 * t: e;
                            var i = "";
                            i += '<table style="',
                                i += " border-width: 0px; border-style: none;",
                                i += " border-collapse: collapse;",
                                i += '">',
                                i += "<tbody>";
                            for (var n = 0; n < _.getModuleCount(); n += 1) {
                                i += "<tr>";
                                for (var o = 0; o < _.getModuleCount(); o += 1) i += '<td style="',
                                    i += " border-width: 0px; border-style: none;",
                                    i += " border-collapse: collapse;",
                                    i += " padding: 0px; margin: 0px;",
                                    i += " width: " + t + "px;",
                                    i += " height: " + t + "px;",
                                    i += " background-color: ",
                                    i += _.isDark(n, o) ? "#000000": "#ffffff",
                                    i += ";",
                                    i += '"/>';
                                i += "</tr>"
                            }
                            return i += "</tbody>",
                                i += "</table>"
                        },
                        _.createImg = function(t, e) {
                            t = t || 2,
                                e = "undefined" == typeof e ? 4 * t: e;
                            var i = _.getModuleCount() * t + 2 * e,
                                n = e,
                                o = i - e,
                                s = p(i, i,
                                    function(e, i) {
                                        if (e >= n && o > e && i >= n && o > i) {
                                            var s = Math.floor((e - n) / t),
                                                a = Math.floor((i - n) / t);
                                            return _.isDark(a, s) ? 0 : 1
                                        }
                                        return 1
                                    });
                            return {
                                width: i,
                                height: i,
                                src: s
                            }
                        },
                        _.createImgTag = function(t, e) {
                            var i = this.createImg(t, e);
                            return f(i.width, i.height, i.src)
                        },
                        _
                };
                e.stringToBytes = function(t) {
                    for (var e = new Array,
                             i = 0; i < t.length; i += 1) {
                        var n = t.charCodeAt(i);
                        e.push(255 & n)
                    }
                    return e
                },
                    e.createStringToBytes = function(t, e) {
                        var i = function() {
                                for (var i = d(t), n = function() {
                                        var t = i.read();
                                        if ( - 1 == t) throw new Error;
                                        return t
                                    },
                                         o = 0, s = {};;) {
                                    var a = i.read();
                                    if ( - 1 == a) break;
                                    var r = n(),
                                        c = n(),
                                        l = n(),
                                        u = String.fromCharCode(a << 8 | r),
                                        h = c << 8 | l;
                                    s[u] = h,
                                        o += 1
                                }
                                if (o != e) throw new Error(o + " != " + e);
                                return s
                            } (),
                            n = "?".charCodeAt(0);
                        return function(t) {
                            for (var e = new Array,
                                     o = 0; o < t.length; o += 1) {
                                var s = t.charCodeAt(o);
                                if (128 > s) e.push(s);
                                else {
                                    var a = i[t.charAt(o)];
                                    "number" == typeof a ? (255 & a) == a ? e.push(a) : (e.push(a >>> 8), e.push(255 & a)) : e.push(n)
                                }
                            }
                            return e
                        }
                    };
                var i = {
                        MODE_NUMBER: 1,
                        MODE_ALPHA_NUM: 2,
                        MODE_8BIT_BYTE: 4,
                        MODE_KANJI: 8
                    },
                    n = {
                        L: 1,
                        M: 0,
                        Q: 3,
                        H: 2
                    },
                    o = {
                        PATTERN000: 0,
                        PATTERN001: 1,
                        PATTERN010: 2,
                        PATTERN011: 3,
                        PATTERN100: 4,
                        PATTERN101: 5,
                        PATTERN110: 6,
                        PATTERN111: 7
                    },
                    s = function() {
                        var e = [[], [6, 18], [6, 22], [6, 26], [6, 30], [6, 34], [6, 22, 38], [6, 24, 42], [6, 26, 46], [6, 28, 50], [6, 30, 54], [6, 32, 58], [6, 34, 62], [6, 26, 46, 66], [6, 26, 48, 70], [6, 26, 50, 74], [6, 30, 54, 78], [6, 30, 56, 82], [6, 30, 58, 86], [6, 34, 62, 90], [6, 28, 50, 72, 94], [6, 26, 50, 74, 98], [6, 30, 54, 78, 102], [6, 28, 54, 80, 106], [6, 32, 58, 84, 110], [6, 30, 58, 86, 114], [6, 34, 62, 90, 118], [6, 26, 50, 74, 98, 122], [6, 30, 54, 78, 102, 126], [6, 26, 52, 78, 104, 130], [6, 30, 56, 82, 108, 134], [6, 34, 60, 86, 112, 138], [6, 30, 58, 86, 114, 142], [6, 34, 62, 90, 118, 146], [6, 30, 54, 78, 102, 126, 150], [6, 24, 50, 76, 102, 128, 154], [6, 28, 54, 80, 106, 132, 158], [6, 32, 58, 84, 110, 136, 162], [6, 26, 54, 82, 110, 138, 166], [6, 30, 58, 86, 114, 142, 170]],
                            n = 1335,
                            s = 7973,
                            r = 21522,
                            c = {},
                            l = function(t) {
                                for (var e = 0; 0 != t;) e += 1,
                                    t >>>= 1;
                                return e
                            };
                        return c.getBCHTypeInfo = function(t) {
                            for (var e = t << 10; l(e) - l(n) >= 0;) e ^= n << l(e) - l(n);
                            return (t << 10 | e) ^ r
                        },
                            c.getBCHTypeNumber = function(t) {
                                for (var e = t << 12; l(e) - l(s) >= 0;) e ^= s << l(e) - l(s);
                                return t << 12 | e
                            },
                            c.getPatternPosition = function(t) {
                                return e[t - 1]
                            },
                            c.getMaskFunction = function(t) {
                                switch (t) {
                                    case o.PATTERN000:
                                        return function(t, e) {
                                            return (t + e) % 2 == 0
                                        };
                                    case o.PATTERN001:
                                        return function(t) {
                                            return t % 2 == 0
                                        };
                                    case o.PATTERN010:
                                        return function(t, e) {
                                            return e % 3 == 0
                                        };
                                    case o.PATTERN011:
                                        return function(t, e) {
                                            return (t + e) % 3 == 0
                                        };
                                    case o.PATTERN100:
                                        return function(t, e) {
                                            return (Math.floor(t / 2) + Math.floor(e / 3)) % 2 == 0
                                        };
                                    case o.PATTERN101:
                                        return function(t, e) {
                                            return t * e % 2 + t * e % 3 == 0
                                        };
                                    case o.PATTERN110:
                                        return function(t, e) {
                                            return (t * e % 2 + t * e % 3) % 2 == 0
                                        };
                                    case o.PATTERN111:
                                        return function(t, e) {
                                            return (t * e % 3 + (t + e) % 2) % 2 == 0
                                        };
                                    default:
                                        throw new Error("bad maskPattern:" + t)
                                }
                            },
                            c.getErrorCorrectPolynomial = function(e) {
                                for (var i = t([1], 0), n = 0; e > n; n += 1) i = i.multiply(t([1, a.gexp(n)], 0));
                                return i
                            },
                            c.getLengthInBits = function(t, e) {
                                if (e >= 1 && 10 > e) switch (t) {
                                    case i.MODE_NUMBER:
                                        return 10;
                                    case i.MODE_ALPHA_NUM:
                                        return 9;
                                    case i.MODE_8BIT_BYTE:
                                        return 8;
                                    case i.MODE_KANJI:
                                        return 8;
                                    default:
                                        throw new Error("mode:" + t)
                                } else if (27 > e) switch (t) {
                                    case i.MODE_NUMBER:
                                        return 12;
                                    case i.MODE_ALPHA_NUM:
                                        return 11;
                                    case i.MODE_8BIT_BYTE:
                                        return 16;
                                    case i.MODE_KANJI:
                                        return 10;
                                    default:
                                        throw new Error("mode:" + t)
                                } else {
                                    if (! (41 > e)) throw new Error("type:" + e);
                                    switch (t) {
                                        case i.MODE_NUMBER:
                                            return 14;
                                        case i.MODE_ALPHA_NUM:
                                            return 13;
                                        case i.MODE_8BIT_BYTE:
                                            return 16;
                                        case i.MODE_KANJI:
                                            return 12;
                                        default:
                                            throw new Error("mode:" + t)
                                    }
                                }
                            },
                            c.getLostPoint = function(t) {
                                for (var e = t.getModuleCount(), i = 0, n = 0; e > n; n += 1) for (var o = 0; e > o; o += 1) {
                                    for (var s = 0,
                                             a = t.isDark(n, o), r = -1; 1 >= r; r += 1) if (! (0 > n + r || n + r >= e)) for (var c = -1; 1 >= c; c += 1) 0 > o + c || o + c >= e || (0 != r || 0 != c) && a == t.isDark(n + r, o + c) && (s += 1);
                                    s > 5 && (i += 3 + s - 5)
                                }
                                for (var n = 0; e - 1 > n; n += 1) for (var o = 0; e - 1 > o; o += 1) {
                                    var l = 0;
                                    t.isDark(n, o) && (l += 1),
                                    t.isDark(n + 1, o) && (l += 1),
                                    t.isDark(n, o + 1) && (l += 1),
                                    t.isDark(n + 1, o + 1) && (l += 1),
                                    (0 == l || 4 == l) && (i += 3)
                                }
                                for (var n = 0; e > n; n += 1) for (var o = 0; e - 6 > o; o += 1) t.isDark(n, o) && !t.isDark(n, o + 1) && t.isDark(n, o + 2) && t.isDark(n, o + 3) && t.isDark(n, o + 4) && !t.isDark(n, o + 5) && t.isDark(n, o + 6) && (i += 40);
                                for (var o = 0; e > o; o += 1) for (var n = 0; e - 6 > n; n += 1) t.isDark(n, o) && !t.isDark(n + 1, o) && t.isDark(n + 2, o) && t.isDark(n + 3, o) && t.isDark(n + 4, o) && !t.isDark(n + 5, o) && t.isDark(n + 6, o) && (i += 40);
                                for (var u = 0,
                                         o = 0; e > o; o += 1) for (var n = 0; e > n; n += 1) t.isDark(n, o) && (u += 1);
                                var d = Math.abs(100 * u / e / e - 50) / 5;
                                return i += 10 * d
                            },
                            c
                    } (),
                    a = function() {
                        for (var t = new Array(256), e = new Array(256), i = 0; 8 > i; i += 1) t[i] = 1 << i;
                        for (var i = 8; 256 > i; i += 1) t[i] = t[i - 4] ^ t[i - 5] ^ t[i - 6] ^ t[i - 8];
                        for (var i = 0; 255 > i; i += 1) e[t[i]] = i;
                        var n = {};
                        return n.glog = function(t) {
                            if (1 > t) throw new Error("glog(" + t + ")");
                            return e[t]
                        },
                            n.gexp = function(e) {
                                for (; 0 > e;) e += 255;
                                for (; e >= 256;) e -= 255;
                                return t[e]
                            },
                            n
                    } (),
                    r = function() {
                        var t = [[1, 26, 19], [1, 26, 16], [1, 26, 13], [1, 26, 9], [1, 44, 34], [1, 44, 28], [1, 44, 22], [1, 44, 16], [1, 70, 55], [1, 70, 44], [2, 35, 17], [2, 35, 13], [1, 100, 80], [2, 50, 32], [2, 50, 24], [4, 25, 9], [1, 134, 108], [2, 67, 43], [2, 33, 15, 2, 34, 16], [2, 33, 11, 2, 34, 12], [2, 86, 68], [4, 43, 27], [4, 43, 19], [4, 43, 15], [2, 98, 78], [4, 49, 31], [2, 32, 14, 4, 33, 15], [4, 39, 13, 1, 40, 14], [2, 121, 97], [2, 60, 38, 2, 61, 39], [4, 40, 18, 2, 41, 19], [4, 40, 14, 2, 41, 15], [2, 146, 116], [3, 58, 36, 2, 59, 37], [4, 36, 16, 4, 37, 17], [4, 36, 12, 4, 37, 13], [2, 86, 68, 2, 87, 69], [4, 69, 43, 1, 70, 44], [6, 43, 19, 2, 44, 20], [6, 43, 15, 2, 44, 16]],
                            e = function(t, e) {
                                var i = {};
                                return i.totalCount = t,
                                    i.dataCount = e,
                                    i
                            },
                            i = {},
                            o = function(e, i) {
                                switch (i) {
                                    case n.L:
                                        return t[4 * (e - 1) + 0];
                                    case n.M:
                                        return t[4 * (e - 1) + 1];
                                    case n.Q:
                                        return t[4 * (e - 1) + 2];
                                    case n.H:
                                        return t[4 * (e - 1) + 3];
                                    default:
                                        return void 0
                                }
                            };
                        return i.getRSBlocks = function(t, i) {
                            var n = o(t, i);
                            if ("undefined" == typeof n) throw new Error("bad rs block @ typeNumber:" + t + "/errorCorrectLevel:" + i);
                            for (var s = n.length / 3,
                                     a = new Array,
                                     r = 0; s > r; r += 1) for (var c = n[3 * r + 0], l = n[3 * r + 1], u = n[3 * r + 2], d = 0; c > d; d += 1) a.push(e(l, u));
                            return a
                        },
                            i
                    } (),
                    c = function() {
                        var t = new Array,
                            e = 0,
                            i = {};
                        return i.getBuffer = function() {
                            return t
                        },
                            i.get = function(e) {
                                var i = Math.floor(e / 8);
                                return 1 == (t[i] >>> 7 - e % 8 & 1)
                            },
                            i.put = function(t, e) {
                                for (var n = 0; e > n; n += 1) i.putBit(1 == (t >>> e - n - 1 & 1))
                            },
                            i.getLengthInBits = function() {
                                return e
                            },
                            i.putBit = function(i) {
                                var n = Math.floor(e / 8);
                                t.length <= n && t.push(0),
                                i && (t[n] |= 128 >>> e % 8),
                                    e += 1
                            },
                            i
                    },
                    l = function(t) {
                        var n = i.MODE_8BIT_BYTE,
                            o = e.stringToBytes(t),
                            s = {};
                        return s.getMode = function() {
                            return n
                        },
                            s.getLength = function() {
                                return o.length
                            },
                            s.write = function(t) {
                                for (var e = 0; e < o.length; e += 1) t.put(o[e], 8)
                            },
                            s
                    },
                    u = function() {
                        var t = new Array,
                            e = {};
                        return e.writeByte = function(e) {
                            t.push(255 & e)
                        },
                            e.writeShort = function(t) {
                                e.writeByte(t),
                                    e.writeByte(t >>> 8)
                            },
                            e.writeBytes = function(t, i, n) {
                                i = i || 0,
                                    n = n || t.length;
                                for (var o = 0; n > o; o += 1) e.writeByte(t[o + i])
                            },
                            e.writeString = function(t) {
                                for (var i = 0; i < t.length; i += 1) e.writeByte(t.charCodeAt(i))
                            },
                            e.toByteArray = function() {
                                return t
                            },
                            e.toString = function() {
                                var e = "";
                                e += "[";
                                for (var i = 0; i < t.length; i += 1) i > 0 && (e += ","),
                                    e += t[i];
                                return e += "]"
                            },
                            e
                    },
                    d = function(t) {
                        var e = t,
                            i = 0,
                            n = 0,
                            o = 0,
                            s = {};
                        s.read = function() {
                            for (; 8 > o;) {
                                if (i >= e.length) {
                                    if (0 == o) return - 1;
                                    throw new Error("unexpected end of file./" + o)
                                }
                                var t = e.charAt(i);
                                if (i += 1, "=" == t) return o = 0,
                                    -1;
                                t.match(/^\s$/) || (n = n << 6 | a(t.charCodeAt(0)), o += 6)
                            }
                            var s = n >>> o - 8 & 255;
                            return o -= 8,
                                s
                        };
                        var a = function(t) {
                            if (t >= 65 && 90 >= t) return t - 65;
                            if (t >= 97 && 122 >= t) return t - 97 + 26;
                            if (t >= 48 && 57 >= t) return t - 48 + 52;
                            if (43 == t) return 62;
                            if (47 == t) return 63;
                            throw new Error("c:" + t)
                        };
                        return s
                    },
                    h = function(t, e) {
                        var i = t,
                            n = e,
                            o = new Array(t * e),
                            s = {};
                        s.setPixel = function(t, e, n) {
                            o[e * i + t] = n
                        },
                            s.write = function(t) {
                                t.writeString("GIF87a"),
                                    t.writeShort(i),
                                    t.writeShort(n),
                                    t.writeByte(128),
                                    t.writeByte(0),
                                    t.writeByte(0),
                                    t.writeByte(0),
                                    t.writeByte(0),
                                    t.writeByte(0),
                                    t.writeByte(255),
                                    t.writeByte(255),
                                    t.writeByte(255),
                                    t.writeString(","),
                                    t.writeShort(0),
                                    t.writeShort(0),
                                    t.writeShort(i),
                                    t.writeShort(n),
                                    t.writeByte(0);
                                var e = 2,
                                    o = r(e);
                                t.writeByte(e);
                                for (var s = 0; o.length - s > 255;) t.writeByte(255),
                                    t.writeBytes(o, s, 255),
                                    s += 255;
                                t.writeByte(o.length - s),
                                    t.writeBytes(o, s, o.length - s),
                                    t.writeByte(0),
                                    t.writeString(";")
                            };
                        var a = function(t) {
                                var e = t,
                                    i = 0,
                                    n = 0,
                                    o = {};
                                return o.write = function(t, o) {
                                    if (t >>> o != 0) throw new Error("length over");
                                    for (; i + o >= 8;) e.writeByte(255 & (t << i | n)),
                                        o -= 8 - i,
                                        t >>>= 8 - i,
                                        n = 0,
                                        i = 0;
                                    n = t << i | n,
                                        i += o
                                },
                                    o.flush = function() {
                                        i > 0 && e.writeByte(n)
                                    },
                                    o
                            },
                            r = function(t) {
                                for (var e = 1 << t,
                                         i = (1 << t) + 1, n = t + 1, s = c(), r = 0; e > r; r += 1) s.add(String.fromCharCode(r));
                                s.add(String.fromCharCode(e)),
                                    s.add(String.fromCharCode(i));
                                var l = u(),
                                    d = a(l);
                                d.write(e, n);
                                var h = 0,
                                    p = String.fromCharCode(o[h]);
                                for (h += 1; h < o.length;) {
                                    var f = String.fromCharCode(o[h]);
                                    h += 1,
                                        s.contains(p + f) ? p += f: (d.write(s.indexOf(p), n), s.size() < 4095 && (s.size() == 1 << n && (n += 1), s.add(p + f)), p = f)
                                }
                                return d.write(s.indexOf(p), n),
                                    d.write(i, n),
                                    d.flush(),
                                    l.toByteArray()
                            },
                            c = function() {
                                var t = {},
                                    e = 0,
                                    i = {};
                                return i.add = function(n) {
                                    if (i.contains(n)) throw new Error("dup key:" + n);
                                    t[n] = e,
                                        e += 1
                                },
                                    i.size = function() {
                                        return e
                                    },
                                    i.indexOf = function(e) {
                                        return t[e]
                                    },
                                    i.contains = function(e) {
                                        return "undefined" != typeof t[e]
                                    },
                                    i
                            };
                        return s
                    },
                    p = function(t, e, i) {
                        for (var n = h(t, e), o = 0; e > o; o += 1) for (var s = 0; t > s; s += 1) n.setPixel(s, o, i(s, o));
                        var a = u();
                        n.write(a);
                        var r = a.toByteArray(),
                            c = new Buffer(r);
                        return "data:image/gif;base64," + c.toString("base64")
                    },
                    f = function(t, e, i, n) {
                        var o = "";
                        return o += "<img",
                            o += ' src="',
                            o += i,
                            o += '"',
                            o += ' width="',
                            o += t,
                            o += '"',
                            o += ' height="',
                            o += e,
                            o += '"',
                        n && (o += ' alt="', o += n, o += '"'),
                            o += "/>"
                    };
                return e
            }),
    !
        function(t, e, i) {
            "undefined" != typeof module && module.exports ? module.exports = i() : "function" == typeof define && define.amd ? define("static/js/lib/bdshare", [], i) : e[t] = i()
        } ("bdshare", this,
            function() {
                var t = "6649976",
                    e = "http://s.share.baidu.com/",
                    i = function() {
                        var t = (new Date).getTime(),
                            e = (new Date).getTime() + 1e3,
                            i = (new Date).getTime() + 3e3;
                        return t.toString(32) + e.toString(32) + i.toString(32)
                    },
                    n = function(t, e) {
                        for (var i = t.length,
                                 n = "",
                                 o = 1; e >= o; o++) {
                            var s = Math.floor(i * Math.random());
                            n += t.charAt(s)
                        }
                        return n
                    },
                    o = function() {
                        var t = (new Date).toString(36),
                            e = n("0123456789abcdefghijklmnopqrstuvwxyz", 3);
                        return t + e
                    },
                    s = function(n, s) {
                        s = s || {};
                        var a = i(),
                            r = 0,
                            c = "",
                            l = document.title,
                            u = s.wbuid || "",
                            d = o(),
                            h = (window.isAppPage ? "app": "detail/list", encodeURIComponent(s.pic || "")),
                            p = encodeURIComponent(s.url || ""),
                            f = encodeURIComponent(s.comment || ""),
                            g = encodeURIComponent(s.desc || "");
                        "tsina" === n ? l = (s.text || l) + (s.weibotext || c) : ("tqq" === n && (s.text = s.text.replace("@今日头条", "@headlineapp")), l = s.text || l),
                            l = encodeURIComponent(l.substring(0, 300));
                        var m = "?click=1&url=" + p + "&uid=" + t + "&to=" + n + "&type=text&relateUid=" + u + "&pic=" + h + "&title=" + l + "&key=&sign=on&desc=" + g + "&comment=" + f + "&searchPic=0&l=" + a + "&linkid=" + d + "&sloc=&apiType=0&buttonType=" + r,
                            v = e + m,
                            _ = e + "commit" + m + "&t=" + Math.random(),
                            w = function() {
                                var t = [];
                                return function(e) {
                                    var i = t.push(new Image) - 1;
                                    t[i].onload = function() {
                                        t[i] = t[i].onload = null
                                    },
                                        t[i].src = e
                                }
                            } ();
                        setTimeout(function() {
                                w(_)
                            },
                            1500),
                            window.open(v, "_blank", "height=500,width=700,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no")
                    };
                return s
            }),
    function(t, e) {
        var i = e.getElementById("module-inner"),
            n = e.getElementById("module-place"),
            o = e.getElementById("m-hotNews"),
            s = utils.offset(n).top,
            a = (utils.getWinSize().winHeight, e.getElementById("adindexhover"));
        utils.on(t, "scroll", _.throttle(function() {
                var t = i.clientHeight,
                    e = utils.scrollTop();
                s + t > e ? (utils.removeClass(o, "module-fixed"), a.style.display = "none") : (utils.addClass(o, "module-fixed"), a.style.display = "block")
            },
            60)),
            setTimeout(function() {
                    ADModel.getAds(function(t) {
                        for (var e = 0; e < t.length; e++) {
                            var i = t[e];
                            1 == i.web_position && riot.mount("tfeedadd", {
                                add: i
                            }),
                            2 == i.web_position && riot.mount("tbanneradd", {
                                add: i
                            })
                        }
                    })
                },
                40)
    } (window, document, void 0);