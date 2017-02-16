/**
 * Created by LiqHe on 2017/2/13.
 */
!
    function(t, e) {
        "use strict";
        "function" == typeof define && define.amd ? define("static/js/lib/es5-shim", [], e) : "object" == typeof exports ? module.exports = e() : t.returnExports = e()
    } (this,
        function() {
            var t, e, r = Array,
                n = r.prototype,
                o = Object,
                i = o.prototype,
                a = Function,
                u = a.prototype,
                s = String,
                f = s.prototype,
                l = Number,
                c = l.prototype,
                h = n.slice,
                p = n.splice,
                g = n.push,
                y = n.unshift,
                d = n.concat,
                v = n.join,
                b = u.call,
                m = u.apply,
                w = Math.max,
                T = Math.min,
                D = i.toString,
                x = "function" == typeof Symbol && "symbol" == typeof Symbol.toStringTag,
                S = Function.prototype.toString,
                O = /^\s*class /,
                j = function(t) {
                    try {
                        var e = S.call(t),
                            r = e.replace(/\/\/.*\n/g, ""),
                            n = r.replace(/\/\*[.\s\S]*\*\//g, ""),
                            o = n.replace(/\n/gm, " ").replace(/ {2}/g, " ");
                        return O.test(o)
                    } catch(i) {
                        return ! 1
                    }
                },
                E = function(t) {
                    try {
                        return j(t) ? !1 : (S.call(t), !0)
                    } catch(e) {
                        return ! 1
                    }
                },
                M = "[object Function]",
                I = "[object GeneratorFunction]",
                t = function(t) {
                    if (!t) return ! 1;
                    if ("function" != typeof t && "object" != typeof t) return ! 1;
                    if (x) return E(t);
                    if (j(t)) return ! 1;
                    var e = D.call(t);
                    return e === M || e === I
                },
                U = RegExp.prototype.exec,
                F = function(t) {
                    try {
                        return U.call(t),
                            !0
                    } catch(e) {
                        return ! 1
                    }
                },
                k = "[object RegExp]";
            e = function(t) {
                return "object" != typeof t ? !1 : x ? F(t) : D.call(t) === k
            };
            var N, C = String.prototype.valueOf,
                R = function(t) {
                    try {
                        return C.call(t),
                            !0
                    } catch(e) {
                        return ! 1
                    }
                },
                A = "[object String]";
            N = function(t) {
                return "string" == typeof t ? !0 : "object" != typeof t ? !1 : x ? R(t) : D.call(t) === A
            };
            var $ = o.defineProperty &&
                    function() {
                        try {
                            var t = {};
                            o.defineProperty(t, "x", {
                                enumerable: !1,
                                value: t
                            });
                            for (var e in t) return ! 1;
                            return t.x === t
                        } catch(r) {
                            return ! 1
                        }
                    } (),
                P = function(t) {
                    var e;
                    return e = $ ?
                        function(t, e, r, n) { ! n && e in t || o.defineProperty(t, e, {
                            configurable: !0,
                            enumerable: !1,
                            writable: !0,
                            value: r
                        })
                        }: function(t, e, r, n) { ! n && e in t || (t[e] = r)
                        },
                        function(r, n, o) {
                            for (var i in n) t.call(n, i) && e(r, i, n[i], o)
                        }
                } (i.hasOwnProperty),
                J = function(t) {
                    var e = typeof t;
                    return null === t || "object" !== e && "function" !== e
                },
                Z = l.isNaN ||
                    function(t) {
                        return t !== t
                    },
                z = {
                    ToInteger: function(t) {
                        var e = +t;
                        return Z(e) ? e = 0 : 0 !== e && e !== 1 / 0 && e !== -(1 / 0) && (e = (e > 0 || -1) * Math.floor(Math.abs(e))),
                            e
                    },
                    ToPrimitive: function(e) {
                        var r, n, o;
                        if (J(e)) return e;
                        if (n = e.valueOf, t(n) && (r = n.call(e), J(r))) return r;
                        if (o = e.toString, t(o) && (r = o.call(e), J(r))) return r;
                        throw new TypeError
                    },
                    ToObject: function(t) {
                        if (null == t) throw new TypeError("can't convert " + t + " to object");
                        return o(t)
                    },
                    ToUint32: function(t) {
                        return t >>> 0
                    }
                },
                G = function() {};
            P(u, {
                bind: function(e) {
                    var r = this;
                    if (!t(r)) throw new TypeError("Function.prototype.bind called on incompatible " + r);
                    for (var n, i = h.call(arguments, 1), u = function() {
                            if (this instanceof n) {
                                var t = m.call(r, this, d.call(i, h.call(arguments)));
                                return o(t) === t ? t: this
                            }
                            return m.call(r, e, d.call(i, h.call(arguments)))
                        },
                             s = w(0, r.length - i.length), f = [], l = 0; s > l; l++) g.call(f, "$" + l);
                    return n = a("binder", "return function (" + v.call(f, ",") + "){ return binder.apply(this, arguments); }")(u),
                    r.prototype && (G.prototype = r.prototype, n.prototype = new G, G.prototype = null),
                        n
                }
            });
            var Y = b.bind(i.hasOwnProperty),
                B = b.bind(i.toString),
                H = b.bind(h),
                W = m.bind(h),
                L = b.bind(f.slice),
                X = b.bind(f.split),
                q = b.bind(f.indexOf),
                K = b.bind(g),
                Q = b.bind(i.propertyIsEnumerable),
                V = b.bind(n.sort),
                _ = r.isArray ||
                    function(t) {
                        return "[object Array]" === B(t)
                    },
                te = 1 !== [].unshift(0);
            P(n, {
                    unshift: function() {
                        return y.apply(this, arguments),
                            this.length
                    }
                },
                te),
                P(r, {
                    isArray: _
                });
            var ee = o("a"),
                re = "a" !== ee[0] || !(0 in ee),
                ne = function(t) {
                    var e = !0,
                        r = !0,
                        n = !1;
                    if (t) try {
                        t.call("foo",
                            function(t, r, n) {
                                "object" != typeof n && (e = !1)
                            }),
                            t.call([1],
                                function() {
                                    "use strict";
                                    r = "string" == typeof this
                                },
                                "x")
                    } catch(o) {
                        n = !0
                    }
                    return !! t && !n && e && r
                };
            P(n, {
                    forEach: function(e) {
                        var r, n = z.ToObject(this),
                            o = re && N(this) ? X(this, "") : n,
                            i = -1,
                            a = z.ToUint32(o.length);
                        if (arguments.length > 1 && (r = arguments[1]), !t(e)) throw new TypeError("Array.prototype.forEach callback must be a function");
                        for (; ++i < a;) i in o && ("undefined" == typeof r ? e(o[i], i, n) : e.call(r, o[i], i, n))
                    }
                },
                !ne(n.forEach)),
                P(n, {
                        map: function(e) {
                            var n, o = z.ToObject(this),
                                i = re && N(this) ? X(this, "") : o,
                                a = z.ToUint32(i.length),
                                u = r(a);
                            if (arguments.length > 1 && (n = arguments[1]), !t(e)) throw new TypeError("Array.prototype.map callback must be a function");
                            for (var s = 0; a > s; s++) s in i && (u[s] = "undefined" == typeof n ? e(i[s], s, o) : e.call(n, i[s], s, o));
                            return u
                        }
                    },
                    !ne(n.map)),
                P(n, {
                        filter: function(e) {
                            var r, n, o = z.ToObject(this),
                                i = re && N(this) ? X(this, "") : o,
                                a = z.ToUint32(i.length),
                                u = [];
                            if (arguments.length > 1 && (n = arguments[1]), !t(e)) throw new TypeError("Array.prototype.filter callback must be a function");
                            for (var s = 0; a > s; s++) s in i && (r = i[s], ("undefined" == typeof n ? e(r, s, o) : e.call(n, r, s, o)) && K(u, r));
                            return u
                        }
                    },
                    !ne(n.filter)),
                P(n, {
                        every: function(e) {
                            var r, n = z.ToObject(this),
                                o = re && N(this) ? X(this, "") : n,
                                i = z.ToUint32(o.length);
                            if (arguments.length > 1 && (r = arguments[1]), !t(e)) throw new TypeError("Array.prototype.every callback must be a function");
                            for (var a = 0; i > a; a++) if (a in o && !("undefined" == typeof r ? e(o[a], a, n) : e.call(r, o[a], a, n))) return ! 1;
                            return ! 0
                        }
                    },
                    !ne(n.every)),
                P(n, {
                        some: function(e) {
                            var r, n = z.ToObject(this),
                                o = re && N(this) ? X(this, "") : n,
                                i = z.ToUint32(o.length);
                            if (arguments.length > 1 && (r = arguments[1]), !t(e)) throw new TypeError("Array.prototype.some callback must be a function");
                            for (var a = 0; i > a; a++) if (a in o && ("undefined" == typeof r ? e(o[a], a, n) : e.call(r, o[a], a, n))) return ! 0;
                            return ! 1
                        }
                    },
                    !ne(n.some));
            var oe = !1;
            n.reduce && (oe = "object" == typeof n.reduce.call("es5",
                    function(t, e, r, n) {
                        return n
                    })),
                P(n, {
                        reduce: function(e) {
                            var r = z.ToObject(this),
                                n = re && N(this) ? X(this, "") : r,
                                o = z.ToUint32(n.length);
                            if (!t(e)) throw new TypeError("Array.prototype.reduce callback must be a function");
                            if (0 === o && 1 === arguments.length) throw new TypeError("reduce of empty array with no initial value");
                            var i, a = 0;
                            if (arguments.length >= 2) i = arguments[1];
                            else for (;;) {
                                if (a in n) {
                                    i = n[a++];
                                    break
                                }
                                if (++a >= o) throw new TypeError("reduce of empty array with no initial value")
                            }
                            for (; o > a; a++) a in n && (i = e(i, n[a], a, r));
                            return i
                        }
                    },
                    !oe);
            var ie = !1;
            n.reduceRight && (ie = "object" == typeof n.reduceRight.call("es5",
                    function(t, e, r, n) {
                        return n
                    })),
                P(n, {
                        reduceRight: function(e) {
                            var r = z.ToObject(this),
                                n = re && N(this) ? X(this, "") : r,
                                o = z.ToUint32(n.length);
                            if (!t(e)) throw new TypeError("Array.prototype.reduceRight callback must be a function");
                            if (0 === o && 1 === arguments.length) throw new TypeError("reduceRight of empty array with no initial value");
                            var i, a = o - 1;
                            if (arguments.length >= 2) i = arguments[1];
                            else for (;;) {
                                if (a in n) {
                                    i = n[a--];
                                    break
                                }
                                if (--a < 0) throw new TypeError("reduceRight of empty array with no initial value")
                            }
                            if (0 > a) return i;
                            do a in n && (i = e(i, n[a], a, r));
                            while (a--);
                            return i
                        }
                    },
                    !ie);
            var ae = n.indexOf && -1 !== [0, 1].indexOf(1, 2);
            P(n, {
                    indexOf: function(t) {
                        var e = re && N(this) ? X(this, "") : z.ToObject(this),
                            r = z.ToUint32(e.length);
                        if (0 === r) return - 1;
                        var n = 0;
                        for (arguments.length > 1 && (n = z.ToInteger(arguments[1])), n = n >= 0 ? n: w(0, r + n); r > n; n++) if (n in e && e[n] === t) return n;
                        return - 1
                    }
                },
                ae);
            var ue = n.lastIndexOf && -1 !== [0, 1].lastIndexOf(0, -3);
            P(n, {
                    lastIndexOf: function(t) {
                        var e = re && N(this) ? X(this, "") : z.ToObject(this),
                            r = z.ToUint32(e.length);
                        if (0 === r) return - 1;
                        var n = r - 1;
                        for (arguments.length > 1 && (n = T(n, z.ToInteger(arguments[1]))), n = n >= 0 ? n: r - Math.abs(n); n >= 0; n--) if (n in e && t === e[n]) return n;
                        return - 1
                    }
                },
                ue);
            var se = function() {
                var t = [1, 2],
                    e = t.splice();
                return 2 === t.length && _(e) && 0 === e.length
            } ();
            P(n, {
                    splice: function() {
                        return 0 === arguments.length ? [] : p.apply(this, arguments)
                    }
                },
                !se);
            var fe = function() {
                var t = {};
                return n.splice.call(t, 0, 0, 1),
                1 === t.length
            } ();
            P(n, {
                    splice: function(t, e) {
                        if (0 === arguments.length) return [];
                        var r = arguments;
                        return this.length = w(z.ToInteger(this.length), 0),
                        arguments.length > 0 && "number" != typeof e && (r = H(arguments), r.length < 2 ? K(r, this.length - t) : r[1] = z.ToInteger(e)),
                            p.apply(this, r)
                    }
                },
                !fe);
            var le = function() {
                    var t = new r(1e5);
                    return t[8] = "x",
                        t.splice(1, 1),
                    7 === t.indexOf("x")
                } (),
                ce = function() {
                    var t = 256,
                        e = [];
                    return e[t] = "a",
                        e.splice(t + 1, 0, "b"),
                    "a" === e[t]
                } ();
            P(n, {
                    splice: function(t, e) {
                        for (var r, n = z.ToObject(this), o = [], i = z.ToUint32(n.length), a = z.ToInteger(t), u = 0 > a ? w(i + a, 0) : T(a, i), f = T(w(z.ToInteger(e), 0), i - u), l = 0; f > l;) r = s(u + l),
                        Y(n, r) && (o[l] = n[r]),
                            l += 1;
                        var c, h = H(arguments, 2),
                            p = h.length;
                        if (f > p) {
                            l = u;
                            for (var g = i - f; g > l;) r = s(l + f),
                                c = s(l + p),
                                Y(n, r) ? n[c] = n[r] : delete n[c],
                                l += 1;
                            l = i;
                            for (var y = i - f + p; l > y;) delete n[l - 1],
                                l -= 1
                        } else if (p > f) for (l = i - f; l > u;) r = s(l + f - 1),
                            c = s(l + p - 1),
                            Y(n, r) ? n[c] = n[r] : delete n[c],
                            l -= 1;
                        l = u;
                        for (var d = 0; d < h.length; ++d) n[l] = h[d],
                            l += 1;
                        return n.length = i - f + p,
                            o
                    }
                },
                !le || !ce);
            var he, pe = n.join;
            try {
                he = "1,2,3" !== Array.prototype.join.call("123", ",")
            } catch(ge) {
                he = !0
            }
            he && P(n, {
                    join: function(t) {
                        var e = "undefined" == typeof t ? ",": t;
                        return pe.call(N(this) ? X(this, "") : this, e)
                    }
                },
                he);
            var ye = "1,2" !== [1, 2].join(void 0);
            ye && P(n, {
                    join: function(t) {
                        var e = "undefined" == typeof t ? ",": t;
                        return pe.call(this, e)
                    }
                },
                ye);
            var de = function() {
                    for (var t = z.ToObject(this), e = z.ToUint32(t.length), r = 0; r < arguments.length;) t[e + r] = arguments[r],
                        r += 1;
                    return t.length = e + r,
                    e + r
                },
                ve = function() {
                    var t = {},
                        e = Array.prototype.push.call(t, void 0);
                    return 1 !== e || 1 !== t.length || "undefined" != typeof t[0] || !Y(t, 0)
                } ();
            P(n, {
                    push: function() {
                        return _(this) ? g.apply(this, arguments) : de.apply(this, arguments)
                    }
                },
                ve);
            var be = function() {
                var t = [],
                    e = t.push(void 0);
                return 1 !== e || 1 !== t.length || "undefined" != typeof t[0] || !Y(t, 0)
            } ();
            P(n, {
                    push: de
                },
                be),
                P(n, {
                        slice: function() {
                            var t = N(this) ? X(this, "") : this;
                            return W(t, arguments)
                        }
                    },
                    re);
            var me = function() {
                    try {
                        return [1, 2].sort(null),
                            [1, 2].sort({}),
                            !0
                    } catch(t) {}
                    return ! 1
                } (),
                we = function() {
                    try {
                        return [1, 2].sort(/a/),
                            !1
                    } catch(t) {}
                    return ! 0
                } (),
                Te = function() {
                    try {
                        return [1, 2].sort(void 0),
                            !0
                    } catch(t) {}
                    return ! 1
                } ();
            P(n, {
                    sort: function(e) {
                        if ("undefined" == typeof e) return V(this);
                        if (!t(e)) throw new TypeError("Array.prototype.sort callback must be a function");
                        return V(this, e)
                    }
                },
                me || !Te || !we);
            var De = !{
                    toString: null
                }.propertyIsEnumerable("toString"),
                xe = function() {}.propertyIsEnumerable("prototype"),
                Se = !Y("x", "0"),
                Oe = function(t) {
                    var e = t.constructor;
                    return e && e.prototype === t
                },
                je = {
                    $window: !0,
                    $console: !0,
                    $parent: !0,
                    $self: !0,
                    $frame: !0,
                    $frames: !0,
                    $frameElement: !0,
                    $webkitIndexedDB: !0,
                    $webkitStorageInfo: !0,
                    $external: !0
                },
                Ee = function() {
                    if ("undefined" == typeof window) return ! 1;
                    for (var t in window) try { ! je["$" + t] && Y(window, t) && null !== window[t] && "object" == typeof window[t] && Oe(window[t])
                    } catch(e) {
                        return ! 0
                    }
                    return ! 1
                } (),
                Me = function(t) {
                    if ("undefined" == typeof window || !Ee) return Oe(t);
                    try {
                        return Oe(t)
                    } catch(e) {
                        return ! 1
                    }
                },
                Ie = ["toString", "toLocaleString", "valueOf", "hasOwnProperty", "isPrototypeOf", "propertyIsEnumerable", "constructor"],
                Ue = Ie.length,
                Fe = function(t) {
                    return "[object Arguments]" === B(t)
                },
                ke = function(e) {
                    return null !== e && "object" == typeof e && "number" == typeof e.length && e.length >= 0 && !_(e) && t(e.callee)
                },
                Ne = Fe(arguments) ? Fe: ke;
            P(o, {
                keys: function(e) {
                    var r = t(e),
                        n = Ne(e),
                        o = null !== e && "object" == typeof e,
                        i = o && N(e);
                    if (!o && !r && !n) throw new TypeError("Object.keys called on a non-object");
                    var a = [],
                        u = xe && r;
                    if (i && Se || n) for (var f = 0; f < e.length; ++f) K(a, s(f));
                    if (!n) for (var l in e) u && "prototype" === l || !Y(e, l) || K(a, s(l));
                    if (De) for (var c = Me(e), h = 0; Ue > h; h++) {
                        var p = Ie[h];
                        c && "constructor" === p || !Y(e, p) || K(a, p)
                    }
                    return a
                }
            });
            var Ce = o.keys &&
                    function() {
                        return 2 === o.keys(arguments).length
                    } (1, 2),
                Re = o.keys &&
                    function() {
                        var t = o.keys(arguments);
                        return 1 !== arguments.length || 1 !== t.length || 1 !== t[0]
                    } (1),
                Ae = o.keys;
            P(o, {
                    keys: function(t) {
                        return Ae(Ne(t) ? H(t) : t)
                    }
                },
                !Ce || Re);
            var $e, Pe, Je = 0 !== new Date( - 0xc782b5b342b24).getUTCMonth(),
                Ze = new Date( - 0x55d318d56a724),
                ze = new Date(14496624e5),
                Ge = "Mon, 01 Jan -45875 11:59:59 GMT" !== Ze.toUTCString(),
                Ye = Ze.getTimezoneOffset(); - 720 > Ye ? ($e = "Tue Jan 02 -45875" !== Ze.toDateString(), Pe = !/^Thu Dec 10 2015 \d\d:\d\d:\d\d GMT[-\+]\d\d\d\d(?: |$)/.test(ze.toString())) : ($e = "Mon Jan 01 -45875" !== Ze.toDateString(), Pe = !/^Wed Dec 09 2015 \d\d:\d\d:\d\d GMT[-\+]\d\d\d\d(?: |$)/.test(ze.toString()));
            var Be = b.bind(Date.prototype.getFullYear),
                He = b.bind(Date.prototype.getMonth),
                We = b.bind(Date.prototype.getDate),
                Le = b.bind(Date.prototype.getUTCFullYear),
                Xe = b.bind(Date.prototype.getUTCMonth),
                qe = b.bind(Date.prototype.getUTCDate),
                Ke = b.bind(Date.prototype.getUTCDay),
                Qe = b.bind(Date.prototype.getUTCHours),
                Ve = b.bind(Date.prototype.getUTCMinutes),
                _e = b.bind(Date.prototype.getUTCSeconds),
                tr = b.bind(Date.prototype.getUTCMilliseconds),
                er = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
                rr = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                nr = function(t, e) {
                    return We(new Date(e, t, 0))
                };
            P(Date.prototype, {
                    getFullYear: function() {
                        if (! (this && this instanceof Date)) throw new TypeError("this is not a Date object.");
                        var t = Be(this);
                        return 0 > t && He(this) > 11 ? t + 1 : t
                    },
                    getMonth: function() {
                        if (! (this && this instanceof Date)) throw new TypeError("this is not a Date object.");
                        var t = Be(this),
                            e = He(this);
                        return 0 > t && e > 11 ? 0 : e
                    },
                    getDate: function() {
                        if (! (this && this instanceof Date)) throw new TypeError("this is not a Date object.");
                        var t = Be(this),
                            e = He(this),
                            r = We(this);
                        if (0 > t && e > 11) {
                            if (12 === e) return r;
                            var n = nr(0, t + 1);
                            return n - r + 1
                        }
                        return r
                    },
                    getUTCFullYear: function() {
                        if (! (this && this instanceof Date)) throw new TypeError("this is not a Date object.");
                        var t = Le(this);
                        return 0 > t && Xe(this) > 11 ? t + 1 : t
                    },
                    getUTCMonth: function() {
                        if (! (this && this instanceof Date)) throw new TypeError("this is not a Date object.");
                        var t = Le(this),
                            e = Xe(this);
                        return 0 > t && e > 11 ? 0 : e
                    },
                    getUTCDate: function() {
                        if (! (this && this instanceof Date)) throw new TypeError("this is not a Date object.");
                        var t = Le(this),
                            e = Xe(this),
                            r = qe(this);
                        if (0 > t && e > 11) {
                            if (12 === e) return r;
                            var n = nr(0, t + 1);
                            return n - r + 1
                        }
                        return r
                    }
                },
                Je),
                P(Date.prototype, {
                        toUTCString: function() {
                            if (! (this && this instanceof Date)) throw new TypeError("this is not a Date object.");
                            var t = Ke(this),
                                e = qe(this),
                                r = Xe(this),
                                n = Le(this),
                                o = Qe(this),
                                i = Ve(this),
                                a = _e(this);
                            return er[t] + ", " + (10 > e ? "0" + e: e) + " " + rr[r] + " " + n + " " + (10 > o ? "0" + o: o) + ":" + (10 > i ? "0" + i: i) + ":" + (10 > a ? "0" + a: a) + " GMT"
                        }
                    },
                    Je || Ge),
                P(Date.prototype, {
                        toDateString: function() {
                            if (! (this && this instanceof Date)) throw new TypeError("this is not a Date object.");
                            var t = this.getDay(),
                                e = this.getDate(),
                                r = this.getMonth(),
                                n = this.getFullYear();
                            return er[t] + " " + rr[r] + " " + (10 > e ? "0" + e: e) + " " + n
                        }
                    },
                    Je || $e),
            (Je || Pe) && (Date.prototype.toString = function() {
                if (! (this && this instanceof Date)) throw new TypeError("this is not a Date object.");
                var t = this.getDay(),
                    e = this.getDate(),
                    r = this.getMonth(),
                    n = this.getFullYear(),
                    o = this.getHours(),
                    i = this.getMinutes(),
                    a = this.getSeconds(),
                    u = this.getTimezoneOffset(),
                    s = Math.floor(Math.abs(u) / 60),
                    f = Math.floor(Math.abs(u) % 60);
                return er[t] + " " + rr[r] + " " + (10 > e ? "0" + e: e) + " " + n + " " + (10 > o ? "0" + o: o) + ":" + (10 > i ? "0" + i: i) + ":" + (10 > a ? "0" + a: a) + " GMT" + (u > 0 ? "-": "+") + (10 > s ? "0" + s: s) + (10 > f ? "0" + f: f)
            },
            $ && o.defineProperty(Date.prototype, "toString", {
                configurable: !0,
                enumerable: !1,
                writable: !0
            }));
            var or = -621987552e5,
                ir = "-000001",
                ar = Date.prototype.toISOString && -1 === new Date(or).toISOString().indexOf(ir),
                ur = Date.prototype.toISOString && "1969-12-31T23:59:59.999Z" !== new Date( - 1).toISOString(),
                sr = b.bind(Date.prototype.getTime);
            P(Date.prototype, {
                    toISOString: function() {
                        if (!isFinite(this) || !isFinite(sr(this))) throw new RangeError("Date.prototype.toISOString called on non-finite value.");
                        var t = Le(this),
                            e = Xe(this);
                        t += Math.floor(e / 12),
                            e = (e % 12 + 12) % 12;
                        var r = [e + 1, qe(this), Qe(this), Ve(this), _e(this)];
                        t = (0 > t ? "-": t > 9999 ? "+": "") + L("00000" + Math.abs(t), t >= 0 && 9999 >= t ? -4 : -6);
                        for (var n = 0; n < r.length; ++n) r[n] = L("00" + r[n], -2);
                        return t + "-" + H(r, 0, 2).join("-") + "T" + H(r, 2).join(":") + "." + L("000" + tr(this), -3) + "Z"
                    }
                },
                ar || ur);
            var fr = function() {
                try {
                    return Date.prototype.toJSON && null === new Date(0 / 0).toJSON() && -1 !== new Date(or).toJSON().indexOf(ir) && Date.prototype.toJSON.call({
                            toISOString: function() {
                                return ! 0
                            }
                        })
                } catch(t) {
                    return ! 1
                }
            } ();
            fr || (Date.prototype.toJSON = function() {
                var e = o(this),
                    r = z.ToPrimitive(e);
                if ("number" == typeof r && !isFinite(r)) return null;
                var n = e.toISOString;
                if (!t(n)) throw new TypeError("toISOString property is not callable");
                return n.call(e)
            });
            var lr = 1e15 === Date.parse("+033658-09-27T01:46:40.000Z"),
                cr = !isNaN(Date.parse("2012-04-04T24:00:00.500Z")) || !isNaN(Date.parse("2012-11-31T23:59:59.000Z")) || !isNaN(Date.parse("2012-12-31T23:59:60.000Z")),
                hr = isNaN(Date.parse("2000-01-01T00:00:00.000Z"));
            if (hr || cr || !lr) {
                var pr = Math.pow(2, 31) - 1,
                    gr = Z(new Date(1970, 0, 1, 0, 0, 0, pr + 1).getTime());
                Date = function(t) {
                    var e = function(r, n, o, i, a, u, f) {
                            var l, c = arguments.length;
                            if (this instanceof t) {
                                var h = u,
                                    p = f;
                                if (gr && c >= 7 && f > pr) {
                                    var g = Math.floor(f / pr) * pr,
                                        y = Math.floor(g / 1e3);
                                    h += y,
                                        p -= 1e3 * y
                                }
                                l = 1 === c && s(r) === r ? new t(e.parse(r)) : c >= 7 ? new t(r, n, o, i, a, h, p) : c >= 6 ? new t(r, n, o, i, a, h) : c >= 5 ? new t(r, n, o, i, a) : c >= 4 ? new t(r, n, o, i) : c >= 3 ? new t(r, n, o) : c >= 2 ? new t(r, n) : c >= 1 ? new t(r instanceof t ? +r: r) : new t
                            } else l = t.apply(this, arguments);
                            return J(l) || P(l, {
                                    constructor: e
                                },
                                !0),
                                l
                        },
                        r = new RegExp("^(\\d{4}|[+-]\\d{6})(?:-(\\d{2})(?:-(\\d{2})(?:T(\\d{2}):(\\d{2})(?::(\\d{2})(?:(\\.\\d{1,}))?)?(Z|(?:([-+])(\\d{2}):(\\d{2})))?)?)?)?$"),
                        n = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365],
                        o = function(t, e) {
                            var r = e > 1 ? 1 : 0;
                            return n[e] + Math.floor((t - 1969 + r) / 4) - Math.floor((t - 1901 + r) / 100) + Math.floor((t - 1601 + r) / 400) + 365 * (t - 1970)
                        },
                        i = function(e) {
                            var r = 0,
                                n = e;
                            if (gr && n > pr) {
                                var o = Math.floor(n / pr) * pr,
                                    i = Math.floor(o / 1e3);
                                r += i,
                                    n -= 1e3 * i
                            }
                            return l(new t(1970, 0, 1, 0, 0, r, n))
                        };
                    for (var a in t) Y(t, a) && (e[a] = t[a]);
                    P(e, {
                            now: t.now,
                            UTC: t.UTC
                        },
                        !0),
                        e.prototype = t.prototype,
                        P(e.prototype, {
                                constructor: e
                            },
                            !0);
                    var u = function(e) {
                        var n = r.exec(e);
                        if (n) {
                            var a, u = l(n[1]),
                                s = l(n[2] || 1) - 1,
                                f = l(n[3] || 1) - 1,
                                c = l(n[4] || 0),
                                h = l(n[5] || 0),
                                p = l(n[6] || 0),
                                g = Math.floor(1e3 * l(n[7] || 0)),
                                y = Boolean(n[4] && !n[8]),
                                d = "-" === n[9] ? 1 : -1,
                                v = l(n[10] || 0),
                                b = l(n[11] || 0),
                                m = h > 0 || p > 0 || g > 0;
                            return (m ? 24 : 25) > c && 60 > h && 60 > p && 1e3 > g && s > -1 && 12 > s && 24 > v && 60 > b && f > -1 && f < o(u, s + 1) - o(u, s) && (a = 60 * (24 * (o(u, s) + f) + c + v * d), a = 1e3 * (60 * (a + h + b * d) + p) + g, y && (a = i(a)), a >= -864e13 && 864e13 >= a) ? a: 0 / 0
                        }
                        return t.parse.apply(this, arguments)
                    };
                    return P(e, {
                        parse: u
                    }),
                        e
                } (Date)
            }
            Date.now || (Date.now = function() {
                return (new Date).getTime()
            });
            var yr = c.toFixed && ("0.000" !== 8e-5.toFixed(3) || "1" !== .9.toFixed(0) || "1.25" !== 1.255.toFixed(2) || "1000000000000000128" !== 0xde0b6b3a7640080.toFixed(0)),
                dr = {
                    base: 1e7,
                    size: 6,
                    data: [0, 0, 0, 0, 0, 0],
                    multiply: function(t, e) {
                        for (var r = -1,
                                 n = e; ++r < dr.size;) n += t * dr.data[r],
                            dr.data[r] = n % dr.base,
                            n = Math.floor(n / dr.base)
                    },
                    divide: function(t) {
                        for (var e = dr.size,
                                 r = 0; --e >= 0;) r += dr.data[e],
                            dr.data[e] = Math.floor(r / t),
                            r = r % t * dr.base
                    },
                    numToString: function() {
                        for (var t = dr.size,
                                 e = ""; --t >= 0;) if ("" !== e || 0 === t || 0 !== dr.data[t]) {
                            var r = s(dr.data[t]);
                            "" === e ? e = r: e += L("0000000", 0, 7 - r.length) + r
                        }
                        return e
                    },
                    pow: function Ar(t, e, r) {
                        return 0 === e ? r: e % 2 === 1 ? Ar(t, e - 1, r * t) : Ar(t * t, e / 2, r)
                    },
                    log: function(t) {
                        for (var e = 0,
                                 r = t; r >= 4096;) e += 12,
                            r /= 4096;
                        for (; r >= 2;) e += 1,
                            r /= 2;
                        return e
                    }
                },
                vr = function(t) {
                    var e, r, n, o, i, a, u, f;
                    if (e = l(t), e = Z(e) ? 0 : Math.floor(e), 0 > e || e > 20) throw new RangeError("Number.toFixed called with invalid number of decimals");
                    if (r = l(this), Z(r)) return "NaN";
                    if ( - 1e21 >= r || r >= 1e21) return s(r);
                    if (n = "", 0 > r && (n = "-", r = -r), o = "0", r > 1e-21) if (i = dr.log(r * dr.pow(2, 69, 1)) - 69, a = 0 > i ? r * dr.pow(2, -i, 1) : r / dr.pow(2, i, 1), a *= 4503599627370496, i = 52 - i, i > 0) {
                        for (dr.multiply(0, a), u = e; u >= 7;) dr.multiply(1e7, 0),
                            u -= 7;
                        for (dr.multiply(dr.pow(10, u, 1), 0), u = i - 1; u >= 23;) dr.divide(1 << 23),
                            u -= 23;
                        dr.divide(1 << u),
                            dr.multiply(1, 1),
                            dr.divide(2),
                            o = dr.numToString()
                    } else dr.multiply(0, a),
                        dr.multiply(1 << -i, 0),
                        o = dr.numToString() + L("0.00000000000000000000", 2, 2 + e);
                    return e > 0 ? (f = o.length, o = e >= f ? n + L("0.0000000000000000000", 0, e - f + 2) + o: n + L(o, 0, f - e) + "." + L(o, f - e)) : o = n + o,
                        o
                };
            P(c, {
                    toFixed: vr
                },
                yr);
            var br = function() {
                    try {
                        return "1" === 1..toPrecision(void 0)
                    } catch(t) {
                        return ! 0
                    }
                } (),
                mr = c.toPrecision;
            P(c, {
                    toPrecision: function(t) {
                        return "undefined" == typeof t ? mr.call(this) : mr.call(this, t)
                    }
                },
                br),
                2 !== "ab".split(/(?:ab)*/).length || 4 !== ".".split(/(.?)(.?)/).length || "t" === "tesst".split(/(s)*/)[1] || 4 !== "test".split(/(?:)/, -1).length || "".split(/.?/).length || ".".split(/()()/).length > 1 ? !
                        function() {
                            var t = "undefined" == typeof / () ? ?/.exec("")[1],r=Math.pow(2,32)-1;f.split=function(n,o){var i=String(this);if("undefined"==typeof n&&0===o)return[];if(!e(n))return X(this,n,o);var a,u,s,f,l=[],c=(n.ignoreCase?"i":"")+(n.multiline?"m":"")+(n.unicode?"u":"")+(n.sticky?"y":""),h=0,p=new RegExp(n.source,c+"g");t||(a=new RegExp("^"+p.source+"$(?!\\s)",c));var y="undefined"==typeof o?r:z.ToUint32(o);for(u=p.exec(i);u&&(s=u.index+u[0].length,!(s>h&&(K(l,L(i,h,u.index)),!t&&u.length>1&&u[0].replace(a,function(){for(var t=1;t<arguments.length-2;t++)"undefined"==typeof arguments[t]&&(u[t]=void 0)}),u.length>1&&u.index<i.length&&g.apply(l,H(u,1)),f=u[0].length,h=s,l.length>=y)));)p.lastIndex===u.index&&p.lastIndex++,u=p.exec(i);return h===i.length?(f||!p.test(""))&&K(l,""):K(l,L(i,h)),l.length>y?H(l,0,y):l}}():"0".split(void 0,0).length&&(f.split=function(t,e){return"undefined"==typeof t&&0===e?[]:X(this,t,e)});var wr=f.replace,Tr=function(){var t=[];return"x".replace(/x(.) ? /g,function(e,r){K(t,r)}),1===t.length&&"undefined"==typeof t[0]}();Tr||(f.replace=function(r,n){var o=t(n),i=e(r)&&/\)[ * ?] / .test(r.source);
                if (o && i) {
                    var a = function(t) {
                        var e = arguments.length,
                            o = r.lastIndex;
                        r.lastIndex = 0;
                        var i = r.exec(t) || [];
                        return r.lastIndex = o,
                            K(i, arguments[e - 2], arguments[e - 1]),
                            n.apply(this, i)
                    };
                    return wr.call(this, r, a)
                }
                return wr.call(this, r, n)
            });
            var Dr = f.substr,
                xr = "".substr && "b" !== "0b".substr( - 1);
            P(f, {
                    substr: function(t, e) {
                        var r = t;
                        return 0 > t && (r = w(this.length + t, 0)),
                            Dr.call(this, r, e)
                    }
                },
                xr);
            var Sr = "	\n\f\r   ᠎             　\u2028\u2029﻿",
                Or = "​",
                jr = "[" + Sr + "]",
                Er = new RegExp("^" + jr + jr + "*"),
                Mr = new RegExp(jr + jr + "*$"),
                Ir = f.trim && (Sr.trim() || !Or.trim());
            P(f, {
                    trim: function() {
                        if ("undefined" == typeof this || null === this) throw new TypeError("can't convert " + this + " to object");
                        return s(this).replace(Er, "").replace(Mr, "")
                    }
                },
                Ir);
            var Ur = b.bind(String.prototype.trim),
                Fr = f.lastIndexOf && -1 !== "abcあい".lastIndexOf("あい", 2);
            P(f, {
                    lastIndexOf: function(t) {
                        if ("undefined" == typeof this || null === this) throw new TypeError("can't convert " + this + " to object");
                        for (var e = s(this), r = s(t), n = arguments.length > 1 ? l(arguments[1]) : 0 / 0, o = Z(n) ? 1 / 0 : z.ToInteger(n), i = T(w(o, 0), e.length), a = r.length, u = i + a; u > 0;) {
                            u = w(0, u - a);
                            var f = q(L(e, u, i + a), r);
                            if ( - 1 !== f) return u + f
                        }
                        return - 1
                    }
                },
                Fr);
            var kr = f.lastIndexOf;
            if (P(f, {
                        lastIndexOf: function() {
                            return kr.apply(this, arguments)
                        }
                    },
                    1 !== f.lastIndexOf.length), (8 !== parseInt(Sr + "08") || 22 !== parseInt(Sr + "0x16")) && (parseInt = function(t) {
                    var e = /^[\-+]?0[xX]/;
                    return function(r, n) {
                        var o = Ur(r),
                            i = l(n) || (e.test(o) ? 16 : 10);
                        return t(o, i)
                    }
                } (parseInt)), 1 / parseFloat("-0") !== -1 / 0 && (parseFloat = function(t) {
                    return function(e) {
                        var r = Ur(e),
                            n = t(r);
                        return 0 === n && "-" === L(r, 0, 1) ? -0 : n
                    }
                } (parseFloat)), "RangeError: test" !== String(new RangeError("test"))) {
                var Nr = function() {
                    if ("undefined" == typeof this || null === this) throw new TypeError("can't convert " + this + " to object");
                    var t = this.name;
                    "undefined" == typeof t ? t = "Error": "string" != typeof t && (t = s(t));
                    var e = this.message;
                    return "undefined" == typeof e ? e = "": "string" != typeof e && (e = s(e)),
                        t ? e ? t + ": " + e: t: e
                };
                Error.prototype.toString = Nr
            }
            if ($) {
                var Cr = function(t, e) {
                    if (Q(t, e)) {
                        var r = Object.getOwnPropertyDescriptor(t, e);
                        r.enumerable = !1,
                            Object.defineProperty(t, e, r)
                    }
                };
                Cr(Error.prototype, "message"),
                "" !== Error.prototype.message && (Error.prototype.message = ""),
                    Cr(Error.prototype, "name")
            }
            if ("/a/gim" !== String(/a/gim)) {
                var Rr = function() {
                    var t = "/" + this.source + "/";
                    return this.global && (t += "g"),
                    this.ignoreCase && (t += "i"),
                    this.multiline && (t += "m"),
                        t
                };
                RegExp.prototype.toString = Rr
            }
        });