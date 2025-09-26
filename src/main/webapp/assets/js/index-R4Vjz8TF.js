function om(l, a) {
  for (var s = 0; s < a.length; s++) {
    const c = a[s];
    if (typeof c != "string" && !Array.isArray(c)) {
      for (const d in c)
        if (d !== "default" && !(d in l)) {
          const m = Object.getOwnPropertyDescriptor(c, d);
          m &&
            Object.defineProperty(
              l,
              d,
              m.get ? m : { enumerable: !0, get: () => c[d] }
            );
        }
    }
  }
  return Object.freeze(
    Object.defineProperty(l, Symbol.toStringTag, { value: "Module" })
  );
}
(function () {
  const a = document.createElement("link").relList;
  if (a && a.supports && a.supports("modulepreload")) return;
  for (const d of document.querySelectorAll('link[rel="modulepreload"]')) c(d);
  new MutationObserver((d) => {
    for (const m of d)
      if (m.type === "childList")
        for (const w of m.addedNodes)
          w.tagName === "LINK" && w.rel === "modulepreload" && c(w);
  }).observe(document, { childList: !0, subtree: !0 });
  function s(d) {
    const m = {};
    return (
      d.integrity && (m.integrity = d.integrity),
      d.referrerPolicy && (m.referrerPolicy = d.referrerPolicy),
      d.crossOrigin === "use-credentials"
        ? (m.credentials = "include")
        : d.crossOrigin === "anonymous"
        ? (m.credentials = "omit")
        : (m.credentials = "same-origin"),
      m
    );
  }
  function c(d) {
    if (d.ep) return;
    d.ep = !0;
    const m = s(d);
    fetch(d.href, m);
  }
})();
function ad(l) {
  return l && l.__esModule && Object.prototype.hasOwnProperty.call(l, "default")
    ? l.default
    : l;
}
var fs = { exports: {} },
  Br = {},
  ps = { exports: {} },
  ae = {};
/**
 * @license React
 * react.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ var Rc;
function lm() {
  if (Rc) return ae;
  Rc = 1;
  var l = Symbol.for("react.element"),
    a = Symbol.for("react.portal"),
    s = Symbol.for("react.fragment"),
    c = Symbol.for("react.strict_mode"),
    d = Symbol.for("react.profiler"),
    m = Symbol.for("react.provider"),
    w = Symbol.for("react.context"),
    v = Symbol.for("react.forward_ref"),
    E = Symbol.for("react.suspense"),
    j = Symbol.for("react.memo"),
    z = Symbol.for("react.lazy"),
    R = Symbol.iterator;
  function O(y) {
    return y === null || typeof y != "object"
      ? null
      : ((y = (R && y[R]) || y["@@iterator"]),
        typeof y == "function" ? y : null);
  }
  var L = {
      isMounted: function () {
        return !1;
      },
      enqueueForceUpdate: function () {},
      enqueueReplaceState: function () {},
      enqueueSetState: function () {},
    },
    Y = Object.assign,
    _ = {};
  function D(y, b, X) {
    (this.props = y),
      (this.context = b),
      (this.refs = _),
      (this.updater = X || L);
  }
  (D.prototype.isReactComponent = {}),
    (D.prototype.setState = function (y, b) {
      if (typeof y != "object" && typeof y != "function" && y != null)
        throw Error(
          "setState(...): takes an object of state variables to update or a function which returns an object of state variables."
        );
      this.updater.enqueueSetState(this, y, b, "setState");
    }),
    (D.prototype.forceUpdate = function (y) {
      this.updater.enqueueForceUpdate(this, y, "forceUpdate");
    });
  function q() {}
  q.prototype = D.prototype;
  function le(y, b, X) {
    (this.props = y),
      (this.context = b),
      (this.refs = _),
      (this.updater = X || L);
  }
  var oe = (le.prototype = new q());
  (oe.constructor = le), Y(oe, D.prototype), (oe.isPureReactComponent = !0);
  var te = Array.isArray,
    se = Object.prototype.hasOwnProperty,
    de = { current: null },
    ee = { key: !0, ref: !0, __self: !0, __source: !0 };
  function U(y, b, X) {
    var J,
      ue = {},
      ce = null,
      re = null;
    if (b != null)
      for (J in (b.ref !== void 0 && (re = b.ref),
      b.key !== void 0 && (ce = "" + b.key),
      b))
        se.call(b, J) && !ee.hasOwnProperty(J) && (ue[J] = b[J]);
    var pe = arguments.length - 2;
    if (pe === 1) ue.children = X;
    else if (1 < pe) {
      for (var ge = Array(pe), Ie = 0; Ie < pe; Ie++)
        ge[Ie] = arguments[Ie + 2];
      ue.children = ge;
    }
    if (y && y.defaultProps)
      for (J in ((pe = y.defaultProps), pe))
        ue[J] === void 0 && (ue[J] = pe[J]);
    return {
      $$typeof: l,
      type: y,
      key: ce,
      ref: re,
      props: ue,
      _owner: de.current,
    };
  }
  function ke(y, b) {
    return {
      $$typeof: l,
      type: y.type,
      key: b,
      ref: y.ref,
      props: y.props,
      _owner: y._owner,
    };
  }
  function Ue(y) {
    return typeof y == "object" && y !== null && y.$$typeof === l;
  }
  function Nt(y) {
    var b = { "=": "=0", ":": "=2" };
    return (
      "$" +
      y.replace(/[=:]/g, function (X) {
        return b[X];
      })
    );
  }
  var Xe = /\/+/g;
  function We(y, b) {
    return typeof y == "object" && y !== null && y.key != null
      ? Nt("" + y.key)
      : b.toString(36);
  }
  function Ye(y, b, X, J, ue) {
    var ce = typeof y;
    (ce === "undefined" || ce === "boolean") && (y = null);
    var re = !1;
    if (y === null) re = !0;
    else
      switch (ce) {
        case "string":
        case "number":
          re = !0;
          break;
        case "object":
          switch (y.$$typeof) {
            case l:
            case a:
              re = !0;
          }
      }
    if (re)
      return (
        (re = y),
        (ue = ue(re)),
        (y = J === "" ? "." + We(re, 0) : J),
        te(ue)
          ? ((X = ""),
            y != null && (X = y.replace(Xe, "$&/") + "/"),
            Ye(ue, b, X, "", function (Ie) {
              return Ie;
            }))
          : ue != null &&
            (Ue(ue) &&
              (ue = ke(
                ue,
                X +
                  (!ue.key || (re && re.key === ue.key)
                    ? ""
                    : ("" + ue.key).replace(Xe, "$&/") + "/") +
                  y
              )),
            b.push(ue)),
        1
      );
    if (((re = 0), (J = J === "" ? "." : J + ":"), te(y)))
      for (var pe = 0; pe < y.length; pe++) {
        ce = y[pe];
        var ge = J + We(ce, pe);
        re += Ye(ce, b, X, ge, ue);
      }
    else if (((ge = O(y)), typeof ge == "function"))
      for (y = ge.call(y), pe = 0; !(ce = y.next()).done; )
        (ce = ce.value), (ge = J + We(ce, pe++)), (re += Ye(ce, b, X, ge, ue));
    else if (ce === "object")
      throw (
        ((b = String(y)),
        Error(
          "Objects are not valid as a React child (found: " +
            (b === "[object Object]"
              ? "object with keys {" + Object.keys(y).join(", ") + "}"
              : b) +
            "). If you meant to render a collection of children, use an array instead."
        ))
      );
    return re;
  }
  function Ae(y, b, X) {
    if (y == null) return y;
    var J = [],
      ue = 0;
    return (
      Ye(y, J, "", "", function (ce) {
        return b.call(X, ce, ue++);
      }),
      J
    );
  }
  function Ne(y) {
    if (y._status === -1) {
      var b = y._result;
      (b = b()),
        b.then(
          function (X) {
            (y._status === 0 || y._status === -1) &&
              ((y._status = 1), (y._result = X));
          },
          function (X) {
            (y._status === 0 || y._status === -1) &&
              ((y._status = 2), (y._result = X));
          }
        ),
        y._status === -1 && ((y._status = 0), (y._result = b));
    }
    if (y._status === 1) return y._result.default;
    throw y._result;
  }
  var he = { current: null },
    C = { transition: null },
    Q = {
      ReactCurrentDispatcher: he,
      ReactCurrentBatchConfig: C,
      ReactCurrentOwner: de,
    };
  function F() {
    throw Error("act(...) is not supported in production builds of React.");
  }
  return (
    (ae.Children = {
      map: Ae,
      forEach: function (y, b, X) {
        Ae(
          y,
          function () {
            b.apply(this, arguments);
          },
          X
        );
      },
      count: function (y) {
        var b = 0;
        return (
          Ae(y, function () {
            b++;
          }),
          b
        );
      },
      toArray: function (y) {
        return (
          Ae(y, function (b) {
            return b;
          }) || []
        );
      },
      only: function (y) {
        if (!Ue(y))
          throw Error(
            "React.Children.only expected to receive a single React element child."
          );
        return y;
      },
    }),
    (ae.Component = D),
    (ae.Fragment = s),
    (ae.Profiler = d),
    (ae.PureComponent = le),
    (ae.StrictMode = c),
    (ae.Suspense = E),
    (ae.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = Q),
    (ae.act = F),
    (ae.cloneElement = function (y, b, X) {
      if (y == null)
        throw Error(
          "React.cloneElement(...): The argument must be a React element, but you passed " +
            y +
            "."
        );
      var J = Y({}, y.props),
        ue = y.key,
        ce = y.ref,
        re = y._owner;
      if (b != null) {
        if (
          (b.ref !== void 0 && ((ce = b.ref), (re = de.current)),
          b.key !== void 0 && (ue = "" + b.key),
          y.type && y.type.defaultProps)
        )
          var pe = y.type.defaultProps;
        for (ge in b)
          se.call(b, ge) &&
            !ee.hasOwnProperty(ge) &&
            (J[ge] = b[ge] === void 0 && pe !== void 0 ? pe[ge] : b[ge]);
      }
      var ge = arguments.length - 2;
      if (ge === 1) J.children = X;
      else if (1 < ge) {
        pe = Array(ge);
        for (var Ie = 0; Ie < ge; Ie++) pe[Ie] = arguments[Ie + 2];
        J.children = pe;
      }
      return {
        $$typeof: l,
        type: y.type,
        key: ue,
        ref: ce,
        props: J,
        _owner: re,
      };
    }),
    (ae.createContext = function (y) {
      return (
        (y = {
          $$typeof: w,
          _currentValue: y,
          _currentValue2: y,
          _threadCount: 0,
          Provider: null,
          Consumer: null,
          _defaultValue: null,
          _globalName: null,
        }),
        (y.Provider = { $$typeof: m, _context: y }),
        (y.Consumer = y)
      );
    }),
    (ae.createElement = U),
    (ae.createFactory = function (y) {
      var b = U.bind(null, y);
      return (b.type = y), b;
    }),
    (ae.createRef = function () {
      return { current: null };
    }),
    (ae.forwardRef = function (y) {
      return { $$typeof: v, render: y };
    }),
    (ae.isValidElement = Ue),
    (ae.lazy = function (y) {
      return { $$typeof: z, _payload: { _status: -1, _result: y }, _init: Ne };
    }),
    (ae.memo = function (y, b) {
      return { $$typeof: j, type: y, compare: b === void 0 ? null : b };
    }),
    (ae.startTransition = function (y) {
      var b = C.transition;
      C.transition = {};
      try {
        y();
      } finally {
        C.transition = b;
      }
    }),
    (ae.unstable_act = F),
    (ae.useCallback = function (y, b) {
      return he.current.useCallback(y, b);
    }),
    (ae.useContext = function (y) {
      return he.current.useContext(y);
    }),
    (ae.useDebugValue = function () {}),
    (ae.useDeferredValue = function (y) {
      return he.current.useDeferredValue(y);
    }),
    (ae.useEffect = function (y, b) {
      return he.current.useEffect(y, b);
    }),
    (ae.useId = function () {
      return he.current.useId();
    }),
    (ae.useImperativeHandle = function (y, b, X) {
      return he.current.useImperativeHandle(y, b, X);
    }),
    (ae.useInsertionEffect = function (y, b) {
      return he.current.useInsertionEffect(y, b);
    }),
    (ae.useLayoutEffect = function (y, b) {
      return he.current.useLayoutEffect(y, b);
    }),
    (ae.useMemo = function (y, b) {
      return he.current.useMemo(y, b);
    }),
    (ae.useReducer = function (y, b, X) {
      return he.current.useReducer(y, b, X);
    }),
    (ae.useRef = function (y) {
      return he.current.useRef(y);
    }),
    (ae.useState = function (y) {
      return he.current.useState(y);
    }),
    (ae.useSyncExternalStore = function (y, b, X) {
      return he.current.useSyncExternalStore(y, b, X);
    }),
    (ae.useTransition = function () {
      return he.current.useTransition();
    }),
    (ae.version = "18.3.1"),
    ae
  );
}
var Tc;
function Ts() {
  return Tc || ((Tc = 1), (ps.exports = lm())), ps.exports;
}
/**
 * @license React
 * react-jsx-runtime.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ var Ic;
function im() {
  if (Ic) return Br;
  Ic = 1;
  var l = Ts(),
    a = Symbol.for("react.element"),
    s = Symbol.for("react.fragment"),
    c = Object.prototype.hasOwnProperty,
    d = l.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED.ReactCurrentOwner,
    m = { key: !0, ref: !0, __self: !0, __source: !0 };
  function w(v, E, j) {
    var z,
      R = {},
      O = null,
      L = null;
    j !== void 0 && (O = "" + j),
      E.key !== void 0 && (O = "" + E.key),
      E.ref !== void 0 && (L = E.ref);
    for (z in E) c.call(E, z) && !m.hasOwnProperty(z) && (R[z] = E[z]);
    if (v && v.defaultProps)
      for (z in ((E = v.defaultProps), E)) R[z] === void 0 && (R[z] = E[z]);
    return {
      $$typeof: a,
      type: v,
      key: O,
      ref: L,
      props: R,
      _owner: d.current,
    };
  }
  return (Br.Fragment = s), (Br.jsx = w), (Br.jsxs = w), Br;
}
var Oc;
function sm() {
  return Oc || ((Oc = 1), (fs.exports = im())), fs.exports;
}
var f = sm(),
  ol = {},
  ms = { exports: {} },
  nt = {},
  hs = { exports: {} },
  gs = {};
/**
 * @license React
 * scheduler.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ var Dc;
function am() {
  return (
    Dc ||
      ((Dc = 1),
      (function (l) {
        function a(C, Q) {
          var F = C.length;
          C.push(Q);
          e: for (; 0 < F; ) {
            var y = (F - 1) >>> 1,
              b = C[y];
            if (0 < d(b, Q)) (C[y] = Q), (C[F] = b), (F = y);
            else break e;
          }
        }
        function s(C) {
          return C.length === 0 ? null : C[0];
        }
        function c(C) {
          if (C.length === 0) return null;
          var Q = C[0],
            F = C.pop();
          if (F !== Q) {
            C[0] = F;
            e: for (var y = 0, b = C.length, X = b >>> 1; y < X; ) {
              var J = 2 * (y + 1) - 1,
                ue = C[J],
                ce = J + 1,
                re = C[ce];
              if (0 > d(ue, F))
                ce < b && 0 > d(re, ue)
                  ? ((C[y] = re), (C[ce] = F), (y = ce))
                  : ((C[y] = ue), (C[J] = F), (y = J));
              else if (ce < b && 0 > d(re, F))
                (C[y] = re), (C[ce] = F), (y = ce);
              else break e;
            }
          }
          return Q;
        }
        function d(C, Q) {
          var F = C.sortIndex - Q.sortIndex;
          return F !== 0 ? F : C.id - Q.id;
        }
        if (
          typeof performance == "object" &&
          typeof performance.now == "function"
        ) {
          var m = performance;
          l.unstable_now = function () {
            return m.now();
          };
        } else {
          var w = Date,
            v = w.now();
          l.unstable_now = function () {
            return w.now() - v;
          };
        }
        var E = [],
          j = [],
          z = 1,
          R = null,
          O = 3,
          L = !1,
          Y = !1,
          _ = !1,
          D = typeof setTimeout == "function" ? setTimeout : null,
          q = typeof clearTimeout == "function" ? clearTimeout : null,
          le = typeof setImmediate < "u" ? setImmediate : null;
        typeof navigator < "u" &&
          navigator.scheduling !== void 0 &&
          navigator.scheduling.isInputPending !== void 0 &&
          navigator.scheduling.isInputPending.bind(navigator.scheduling);
        function oe(C) {
          for (var Q = s(j); Q !== null; ) {
            if (Q.callback === null) c(j);
            else if (Q.startTime <= C)
              c(j), (Q.sortIndex = Q.expirationTime), a(E, Q);
            else break;
            Q = s(j);
          }
        }
        function te(C) {
          if (((_ = !1), oe(C), !Y))
            if (s(E) !== null) (Y = !0), Ne(se);
            else {
              var Q = s(j);
              Q !== null && he(te, Q.startTime - C);
            }
        }
        function se(C, Q) {
          (Y = !1), _ && ((_ = !1), q(U), (U = -1)), (L = !0);
          var F = O;
          try {
            for (
              oe(Q), R = s(E);
              R !== null && (!(R.expirationTime > Q) || (C && !Nt()));

            ) {
              var y = R.callback;
              if (typeof y == "function") {
                (R.callback = null), (O = R.priorityLevel);
                var b = y(R.expirationTime <= Q);
                (Q = l.unstable_now()),
                  typeof b == "function"
                    ? (R.callback = b)
                    : R === s(E) && c(E),
                  oe(Q);
              } else c(E);
              R = s(E);
            }
            if (R !== null) var X = !0;
            else {
              var J = s(j);
              J !== null && he(te, J.startTime - Q), (X = !1);
            }
            return X;
          } finally {
            (R = null), (O = F), (L = !1);
          }
        }
        var de = !1,
          ee = null,
          U = -1,
          ke = 5,
          Ue = -1;
        function Nt() {
          return !(l.unstable_now() - Ue < ke);
        }
        function Xe() {
          if (ee !== null) {
            var C = l.unstable_now();
            Ue = C;
            var Q = !0;
            try {
              Q = ee(!0, C);
            } finally {
              Q ? We() : ((de = !1), (ee = null));
            }
          } else de = !1;
        }
        var We;
        if (typeof le == "function")
          We = function () {
            le(Xe);
          };
        else if (typeof MessageChannel < "u") {
          var Ye = new MessageChannel(),
            Ae = Ye.port2;
          (Ye.port1.onmessage = Xe),
            (We = function () {
              Ae.postMessage(null);
            });
        } else
          We = function () {
            D(Xe, 0);
          };
        function Ne(C) {
          (ee = C), de || ((de = !0), We());
        }
        function he(C, Q) {
          U = D(function () {
            C(l.unstable_now());
          }, Q);
        }
        (l.unstable_IdlePriority = 5),
          (l.unstable_ImmediatePriority = 1),
          (l.unstable_LowPriority = 4),
          (l.unstable_NormalPriority = 3),
          (l.unstable_Profiling = null),
          (l.unstable_UserBlockingPriority = 2),
          (l.unstable_cancelCallback = function (C) {
            C.callback = null;
          }),
          (l.unstable_continueExecution = function () {
            Y || L || ((Y = !0), Ne(se));
          }),
          (l.unstable_forceFrameRate = function (C) {
            0 > C || 125 < C
              ? console.error(
                  "forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported"
                )
              : (ke = 0 < C ? Math.floor(1e3 / C) : 5);
          }),
          (l.unstable_getCurrentPriorityLevel = function () {
            return O;
          }),
          (l.unstable_getFirstCallbackNode = function () {
            return s(E);
          }),
          (l.unstable_next = function (C) {
            switch (O) {
              case 1:
              case 2:
              case 3:
                var Q = 3;
                break;
              default:
                Q = O;
            }
            var F = O;
            O = Q;
            try {
              return C();
            } finally {
              O = F;
            }
          }),
          (l.unstable_pauseExecution = function () {}),
          (l.unstable_requestPaint = function () {}),
          (l.unstable_runWithPriority = function (C, Q) {
            switch (C) {
              case 1:
              case 2:
              case 3:
              case 4:
              case 5:
                break;
              default:
                C = 3;
            }
            var F = O;
            O = C;
            try {
              return Q();
            } finally {
              O = F;
            }
          }),
          (l.unstable_scheduleCallback = function (C, Q, F) {
            var y = l.unstable_now();
            switch (
              (typeof F == "object" && F !== null
                ? ((F = F.delay),
                  (F = typeof F == "number" && 0 < F ? y + F : y))
                : (F = y),
              C)
            ) {
              case 1:
                var b = -1;
                break;
              case 2:
                b = 250;
                break;
              case 5:
                b = 1073741823;
                break;
              case 4:
                b = 1e4;
                break;
              default:
                b = 5e3;
            }
            return (
              (b = F + b),
              (C = {
                id: z++,
                callback: Q,
                priorityLevel: C,
                startTime: F,
                expirationTime: b,
                sortIndex: -1,
              }),
              F > y
                ? ((C.sortIndex = F),
                  a(j, C),
                  s(E) === null &&
                    C === s(j) &&
                    (_ ? (q(U), (U = -1)) : (_ = !0), he(te, F - y)))
                : ((C.sortIndex = b), a(E, C), Y || L || ((Y = !0), Ne(se))),
              C
            );
          }),
          (l.unstable_shouldYield = Nt),
          (l.unstable_wrapCallback = function (C) {
            var Q = O;
            return function () {
              var F = O;
              O = Q;
              try {
                return C.apply(this, arguments);
              } finally {
                O = F;
              }
            };
          });
      })(gs)),
    gs
  );
}
var Lc;
function um() {
  return Lc || ((Lc = 1), (hs.exports = am())), hs.exports;
}
/**
 * @license React
 * react-dom.production.min.js
 *
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ var Ac;
function cm() {
  if (Ac) return nt;
  Ac = 1;
  var l = Ts(),
    a = um();
  function s(e) {
    for (
      var t = "https://reactjs.org/docs/error-decoder.html?invariant=" + e,
        n = 1;
      n < arguments.length;
      n++
    )
      t += "&args[]=" + encodeURIComponent(arguments[n]);
    return (
      "Minified React error #" +
      e +
      "; visit " +
      t +
      " for the full message or use the non-minified dev environment for full errors and additional helpful warnings."
    );
  }
  var c = new Set(),
    d = {};
  function m(e, t) {
    w(e, t), w(e + "Capture", t);
  }
  function w(e, t) {
    for (d[e] = t, e = 0; e < t.length; e++) c.add(t[e]);
  }
  var v = !(
      typeof window > "u" ||
      typeof window.document > "u" ||
      typeof window.document.createElement > "u"
    ),
    E = Object.prototype.hasOwnProperty,
    j =
      /^[:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD][:A-Z_a-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u02FF\u0370-\u037D\u037F-\u1FFF\u200C-\u200D\u2070-\u218F\u2C00-\u2FEF\u3001-\uD7FF\uF900-\uFDCF\uFDF0-\uFFFD\-.0-9\u00B7\u0300-\u036F\u203F-\u2040]*$/,
    z = {},
    R = {};
  function O(e) {
    return E.call(R, e)
      ? !0
      : E.call(z, e)
      ? !1
      : j.test(e)
      ? (R[e] = !0)
      : ((z[e] = !0), !1);
  }
  function L(e, t, n, r) {
    if (n !== null && n.type === 0) return !1;
    switch (typeof t) {
      case "function":
      case "symbol":
        return !0;
      case "boolean":
        return r
          ? !1
          : n !== null
          ? !n.acceptsBooleans
          : ((e = e.toLowerCase().slice(0, 5)), e !== "data-" && e !== "aria-");
      default:
        return !1;
    }
  }
  function Y(e, t, n, r) {
    if (t === null || typeof t > "u" || L(e, t, n, r)) return !0;
    if (r) return !1;
    if (n !== null)
      switch (n.type) {
        case 3:
          return !t;
        case 4:
          return t === !1;
        case 5:
          return isNaN(t);
        case 6:
          return isNaN(t) || 1 > t;
      }
    return !1;
  }
  function _(e, t, n, r, o, i, u) {
    (this.acceptsBooleans = t === 2 || t === 3 || t === 4),
      (this.attributeName = r),
      (this.attributeNamespace = o),
      (this.mustUseProperty = n),
      (this.propertyName = e),
      (this.type = t),
      (this.sanitizeURL = i),
      (this.removeEmptyString = u);
  }
  var D = {};
  "children dangerouslySetInnerHTML defaultValue defaultChecked innerHTML suppressContentEditableWarning suppressHydrationWarning style"
    .split(" ")
    .forEach(function (e) {
      D[e] = new _(e, 0, !1, e, null, !1, !1);
    }),
    [
      ["acceptCharset", "accept-charset"],
      ["className", "class"],
      ["htmlFor", "for"],
      ["httpEquiv", "http-equiv"],
    ].forEach(function (e) {
      var t = e[0];
      D[t] = new _(t, 1, !1, e[1], null, !1, !1);
    }),
    ["contentEditable", "draggable", "spellCheck", "value"].forEach(function (
      e
    ) {
      D[e] = new _(e, 2, !1, e.toLowerCase(), null, !1, !1);
    }),
    [
      "autoReverse",
      "externalResourcesRequired",
      "focusable",
      "preserveAlpha",
    ].forEach(function (e) {
      D[e] = new _(e, 2, !1, e, null, !1, !1);
    }),
    "allowFullScreen async autoFocus autoPlay controls default defer disabled disablePictureInPicture disableRemotePlayback formNoValidate hidden loop noModule noValidate open playsInline readOnly required reversed scoped seamless itemScope"
      .split(" ")
      .forEach(function (e) {
        D[e] = new _(e, 3, !1, e.toLowerCase(), null, !1, !1);
      }),
    ["checked", "multiple", "muted", "selected"].forEach(function (e) {
      D[e] = new _(e, 3, !0, e, null, !1, !1);
    }),
    ["capture", "download"].forEach(function (e) {
      D[e] = new _(e, 4, !1, e, null, !1, !1);
    }),
    ["cols", "rows", "size", "span"].forEach(function (e) {
      D[e] = new _(e, 6, !1, e, null, !1, !1);
    }),
    ["rowSpan", "start"].forEach(function (e) {
      D[e] = new _(e, 5, !1, e.toLowerCase(), null, !1, !1);
    });
  var q = /[\-:]([a-z])/g;
  function le(e) {
    return e[1].toUpperCase();
  }
  "accent-height alignment-baseline arabic-form baseline-shift cap-height clip-path clip-rule color-interpolation color-interpolation-filters color-profile color-rendering dominant-baseline enable-background fill-opacity fill-rule flood-color flood-opacity font-family font-size font-size-adjust font-stretch font-style font-variant font-weight glyph-name glyph-orientation-horizontal glyph-orientation-vertical horiz-adv-x horiz-origin-x image-rendering letter-spacing lighting-color marker-end marker-mid marker-start overline-position overline-thickness paint-order panose-1 pointer-events rendering-intent shape-rendering stop-color stop-opacity strikethrough-position strikethrough-thickness stroke-dasharray stroke-dashoffset stroke-linecap stroke-linejoin stroke-miterlimit stroke-opacity stroke-width text-anchor text-decoration text-rendering underline-position underline-thickness unicode-bidi unicode-range units-per-em v-alphabetic v-hanging v-ideographic v-mathematical vector-effect vert-adv-y vert-origin-x vert-origin-y word-spacing writing-mode xmlns:xlink x-height"
    .split(" ")
    .forEach(function (e) {
      var t = e.replace(q, le);
      D[t] = new _(t, 1, !1, e, null, !1, !1);
    }),
    "xlink:actuate xlink:arcrole xlink:role xlink:show xlink:title xlink:type"
      .split(" ")
      .forEach(function (e) {
        var t = e.replace(q, le);
        D[t] = new _(t, 1, !1, e, "http://www.w3.org/1999/xlink", !1, !1);
      }),
    ["xml:base", "xml:lang", "xml:space"].forEach(function (e) {
      var t = e.replace(q, le);
      D[t] = new _(t, 1, !1, e, "http://www.w3.org/XML/1998/namespace", !1, !1);
    }),
    ["tabIndex", "crossOrigin"].forEach(function (e) {
      D[e] = new _(e, 1, !1, e.toLowerCase(), null, !1, !1);
    }),
    (D.xlinkHref = new _(
      "xlinkHref",
      1,
      !1,
      "xlink:href",
      "http://www.w3.org/1999/xlink",
      !0,
      !1
    )),
    ["src", "href", "action", "formAction"].forEach(function (e) {
      D[e] = new _(e, 1, !1, e.toLowerCase(), null, !0, !0);
    });
  function oe(e, t, n, r) {
    var o = D.hasOwnProperty(t) ? D[t] : null;
    (o !== null
      ? o.type !== 0
      : r ||
        !(2 < t.length) ||
        (t[0] !== "o" && t[0] !== "O") ||
        (t[1] !== "n" && t[1] !== "N")) &&
      (Y(t, n, o, r) && (n = null),
      r || o === null
        ? O(t) &&
          (n === null ? e.removeAttribute(t) : e.setAttribute(t, "" + n))
        : o.mustUseProperty
        ? (e[o.propertyName] = n === null ? (o.type === 3 ? !1 : "") : n)
        : ((t = o.attributeName),
          (r = o.attributeNamespace),
          n === null
            ? e.removeAttribute(t)
            : ((o = o.type),
              (n = o === 3 || (o === 4 && n === !0) ? "" : "" + n),
              r ? e.setAttributeNS(r, t, n) : e.setAttribute(t, n))));
  }
  var te = l.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED,
    se = Symbol.for("react.element"),
    de = Symbol.for("react.portal"),
    ee = Symbol.for("react.fragment"),
    U = Symbol.for("react.strict_mode"),
    ke = Symbol.for("react.profiler"),
    Ue = Symbol.for("react.provider"),
    Nt = Symbol.for("react.context"),
    Xe = Symbol.for("react.forward_ref"),
    We = Symbol.for("react.suspense"),
    Ye = Symbol.for("react.suspense_list"),
    Ae = Symbol.for("react.memo"),
    Ne = Symbol.for("react.lazy"),
    he = Symbol.for("react.offscreen"),
    C = Symbol.iterator;
  function Q(e) {
    return e === null || typeof e != "object"
      ? null
      : ((e = (C && e[C]) || e["@@iterator"]),
        typeof e == "function" ? e : null);
  }
  var F = Object.assign,
    y;
  function b(e) {
    if (y === void 0)
      try {
        throw Error();
      } catch (n) {
        var t = n.stack.trim().match(/\n( *(at )?)/);
        y = (t && t[1]) || "";
      }
    return (
      `
` +
      y +
      e
    );
  }
  var X = !1;
  function J(e, t) {
    if (!e || X) return "";
    X = !0;
    var n = Error.prepareStackTrace;
    Error.prepareStackTrace = void 0;
    try {
      if (t)
        if (
          ((t = function () {
            throw Error();
          }),
          Object.defineProperty(t.prototype, "props", {
            set: function () {
              throw Error();
            },
          }),
          typeof Reflect == "object" && Reflect.construct)
        ) {
          try {
            Reflect.construct(t, []);
          } catch (N) {
            var r = N;
          }
          Reflect.construct(e, [], t);
        } else {
          try {
            t.call();
          } catch (N) {
            r = N;
          }
          e.call(t.prototype);
        }
      else {
        try {
          throw Error();
        } catch (N) {
          r = N;
        }
        e();
      }
    } catch (N) {
      if (N && r && typeof N.stack == "string") {
        for (
          var o = N.stack.split(`
`),
            i = r.stack.split(`
`),
            u = o.length - 1,
            p = i.length - 1;
          1 <= u && 0 <= p && o[u] !== i[p];

        )
          p--;
        for (; 1 <= u && 0 <= p; u--, p--)
          if (o[u] !== i[p]) {
            if (u !== 1 || p !== 1)
              do
                if ((u--, p--, 0 > p || o[u] !== i[p])) {
                  var h =
                    `
` + o[u].replace(" at new ", " at ");
                  return (
                    e.displayName &&
                      h.includes("<anonymous>") &&
                      (h = h.replace("<anonymous>", e.displayName)),
                    h
                  );
                }
              while (1 <= u && 0 <= p);
            break;
          }
      }
    } finally {
      (X = !1), (Error.prepareStackTrace = n);
    }
    return (e = e ? e.displayName || e.name : "") ? b(e) : "";
  }
  function ue(e) {
    switch (e.tag) {
      case 5:
        return b(e.type);
      case 16:
        return b("Lazy");
      case 13:
        return b("Suspense");
      case 19:
        return b("SuspenseList");
      case 0:
      case 2:
      case 15:
        return (e = J(e.type, !1)), e;
      case 11:
        return (e = J(e.type.render, !1)), e;
      case 1:
        return (e = J(e.type, !0)), e;
      default:
        return "";
    }
  }
  function ce(e) {
    if (e == null) return null;
    if (typeof e == "function") return e.displayName || e.name || null;
    if (typeof e == "string") return e;
    switch (e) {
      case ee:
        return "Fragment";
      case de:
        return "Portal";
      case ke:
        return "Profiler";
      case U:
        return "StrictMode";
      case We:
        return "Suspense";
      case Ye:
        return "SuspenseList";
    }
    if (typeof e == "object")
      switch (e.$$typeof) {
        case Nt:
          return (e.displayName || "Context") + ".Consumer";
        case Ue:
          return (e._context.displayName || "Context") + ".Provider";
        case Xe:
          var t = e.render;
          return (
            (e = e.displayName),
            e ||
              ((e = t.displayName || t.name || ""),
              (e = e !== "" ? "ForwardRef(" + e + ")" : "ForwardRef")),
            e
          );
        case Ae:
          return (
            (t = e.displayName || null), t !== null ? t : ce(e.type) || "Memo"
          );
        case Ne:
          (t = e._payload), (e = e._init);
          try {
            return ce(e(t));
          } catch {}
      }
    return null;
  }
  function re(e) {
    var t = e.type;
    switch (e.tag) {
      case 24:
        return "Cache";
      case 9:
        return (t.displayName || "Context") + ".Consumer";
      case 10:
        return (t._context.displayName || "Context") + ".Provider";
      case 18:
        return "DehydratedFragment";
      case 11:
        return (
          (e = t.render),
          (e = e.displayName || e.name || ""),
          t.displayName || (e !== "" ? "ForwardRef(" + e + ")" : "ForwardRef")
        );
      case 7:
        return "Fragment";
      case 5:
        return t;
      case 4:
        return "Portal";
      case 3:
        return "Root";
      case 6:
        return "Text";
      case 16:
        return ce(t);
      case 8:
        return t === U ? "StrictMode" : "Mode";
      case 22:
        return "Offscreen";
      case 12:
        return "Profiler";
      case 21:
        return "Scope";
      case 13:
        return "Suspense";
      case 19:
        return "SuspenseList";
      case 25:
        return "TracingMarker";
      case 1:
      case 0:
      case 17:
      case 2:
      case 14:
      case 15:
        if (typeof t == "function") return t.displayName || t.name || null;
        if (typeof t == "string") return t;
    }
    return null;
  }
  function pe(e) {
    switch (typeof e) {
      case "boolean":
      case "number":
      case "string":
      case "undefined":
        return e;
      case "object":
        return e;
      default:
        return "";
    }
  }
  function ge(e) {
    var t = e.type;
    return (
      (e = e.nodeName) &&
      e.toLowerCase() === "input" &&
      (t === "checkbox" || t === "radio")
    );
  }
  function Ie(e) {
    var t = ge(e) ? "checked" : "value",
      n = Object.getOwnPropertyDescriptor(e.constructor.prototype, t),
      r = "" + e[t];
    if (
      !e.hasOwnProperty(t) &&
      typeof n < "u" &&
      typeof n.get == "function" &&
      typeof n.set == "function"
    ) {
      var o = n.get,
        i = n.set;
      return (
        Object.defineProperty(e, t, {
          configurable: !0,
          get: function () {
            return o.call(this);
          },
          set: function (u) {
            (r = "" + u), i.call(this, u);
          },
        }),
        Object.defineProperty(e, t, { enumerable: n.enumerable }),
        {
          getValue: function () {
            return r;
          },
          setValue: function (u) {
            r = "" + u;
          },
          stopTracking: function () {
            (e._valueTracker = null), delete e[t];
          },
        }
      );
    }
  }
  function Ft(e) {
    e._valueTracker || (e._valueTracker = Ie(e));
  }
  function un(e) {
    if (!e) return !1;
    var t = e._valueTracker;
    if (!t) return !0;
    var n = t.getValue(),
      r = "";
    return (
      e && (r = ge(e) ? (e.checked ? "true" : "false") : e.value),
      (e = r),
      e !== n ? (t.setValue(e), !0) : !1
    );
  }
  function Yr(e) {
    if (
      ((e = e || (typeof document < "u" ? document : void 0)), typeof e > "u")
    )
      return null;
    try {
      return e.activeElement || e.body;
    } catch {
      return e.body;
    }
  }
  function xl(e, t) {
    var n = t.checked;
    return F({}, t, {
      defaultChecked: void 0,
      defaultValue: void 0,
      value: void 0,
      checked: n ?? e._wrapperState.initialChecked,
    });
  }
  function Fs(e, t) {
    var n = t.defaultValue == null ? "" : t.defaultValue,
      r = t.checked != null ? t.checked : t.defaultChecked;
    (n = pe(t.value != null ? t.value : n)),
      (e._wrapperState = {
        initialChecked: r,
        initialValue: n,
        controlled:
          t.type === "checkbox" || t.type === "radio"
            ? t.checked != null
            : t.value != null,
      });
  }
  function Hs(e, t) {
    (t = t.checked), t != null && oe(e, "checked", t, !1);
  }
  function wl(e, t) {
    Hs(e, t);
    var n = pe(t.value),
      r = t.type;
    if (n != null)
      r === "number"
        ? ((n === 0 && e.value === "") || e.value != n) && (e.value = "" + n)
        : e.value !== "" + n && (e.value = "" + n);
    else if (r === "submit" || r === "reset") {
      e.removeAttribute("value");
      return;
    }
    t.hasOwnProperty("value")
      ? kl(e, t.type, n)
      : t.hasOwnProperty("defaultValue") && kl(e, t.type, pe(t.defaultValue)),
      t.checked == null &&
        t.defaultChecked != null &&
        (e.defaultChecked = !!t.defaultChecked);
  }
  function Us(e, t, n) {
    if (t.hasOwnProperty("value") || t.hasOwnProperty("defaultValue")) {
      var r = t.type;
      if (
        !(
          (r !== "submit" && r !== "reset") ||
          (t.value !== void 0 && t.value !== null)
        )
      )
        return;
      (t = "" + e._wrapperState.initialValue),
        n || t === e.value || (e.value = t),
        (e.defaultValue = t);
    }
    (n = e.name),
      n !== "" && (e.name = ""),
      (e.defaultChecked = !!e._wrapperState.initialChecked),
      n !== "" && (e.name = n);
  }
  function kl(e, t, n) {
    (t !== "number" || Yr(e.ownerDocument) !== e) &&
      (n == null
        ? (e.defaultValue = "" + e._wrapperState.initialValue)
        : e.defaultValue !== "" + n && (e.defaultValue = "" + n));
  }
  var or = Array.isArray;
  function jn(e, t, n, r) {
    if (((e = e.options), t)) {
      t = {};
      for (var o = 0; o < n.length; o++) t["$" + n[o]] = !0;
      for (n = 0; n < e.length; n++)
        (o = t.hasOwnProperty("$" + e[n].value)),
          e[n].selected !== o && (e[n].selected = o),
          o && r && (e[n].defaultSelected = !0);
    } else {
      for (n = "" + pe(n), t = null, o = 0; o < e.length; o++) {
        if (e[o].value === n) {
          (e[o].selected = !0), r && (e[o].defaultSelected = !0);
          return;
        }
        t !== null || e[o].disabled || (t = e[o]);
      }
      t !== null && (t.selected = !0);
    }
  }
  function Nl(e, t) {
    if (t.dangerouslySetInnerHTML != null) throw Error(s(91));
    return F({}, t, {
      value: void 0,
      defaultValue: void 0,
      children: "" + e._wrapperState.initialValue,
    });
  }
  function Ws(e, t) {
    var n = t.value;
    if (n == null) {
      if (((n = t.children), (t = t.defaultValue), n != null)) {
        if (t != null) throw Error(s(92));
        if (or(n)) {
          if (1 < n.length) throw Error(s(93));
          n = n[0];
        }
        t = n;
      }
      t == null && (t = ""), (n = t);
    }
    e._wrapperState = { initialValue: pe(n) };
  }
  function Bs(e, t) {
    var n = pe(t.value),
      r = pe(t.defaultValue);
    n != null &&
      ((n = "" + n),
      n !== e.value && (e.value = n),
      t.defaultValue == null && e.defaultValue !== n && (e.defaultValue = n)),
      r != null && (e.defaultValue = "" + r);
  }
  function $s(e) {
    var t = e.textContent;
    t === e._wrapperState.initialValue &&
      t !== "" &&
      t !== null &&
      (e.value = t);
  }
  function Vs(e) {
    switch (e) {
      case "svg":
        return "http://www.w3.org/2000/svg";
      case "math":
        return "http://www.w3.org/1998/Math/MathML";
      default:
        return "http://www.w3.org/1999/xhtml";
    }
  }
  function Sl(e, t) {
    return e == null || e === "http://www.w3.org/1999/xhtml"
      ? Vs(t)
      : e === "http://www.w3.org/2000/svg" && t === "foreignObject"
      ? "http://www.w3.org/1999/xhtml"
      : e;
  }
  var Qr,
    Gs = (function (e) {
      return typeof MSApp < "u" && MSApp.execUnsafeLocalFunction
        ? function (t, n, r, o) {
            MSApp.execUnsafeLocalFunction(function () {
              return e(t, n, r, o);
            });
          }
        : e;
    })(function (e, t) {
      if (e.namespaceURI !== "http://www.w3.org/2000/svg" || "innerHTML" in e)
        e.innerHTML = t;
      else {
        for (
          Qr = Qr || document.createElement("div"),
            Qr.innerHTML = "<svg>" + t.valueOf().toString() + "</svg>",
            t = Qr.firstChild;
          e.firstChild;

        )
          e.removeChild(e.firstChild);
        for (; t.firstChild; ) e.appendChild(t.firstChild);
      }
    });
  function lr(e, t) {
    if (t) {
      var n = e.firstChild;
      if (n && n === e.lastChild && n.nodeType === 3) {
        n.nodeValue = t;
        return;
      }
    }
    e.textContent = t;
  }
  var ir = {
      animationIterationCount: !0,
      aspectRatio: !0,
      borderImageOutset: !0,
      borderImageSlice: !0,
      borderImageWidth: !0,
      boxFlex: !0,
      boxFlexGroup: !0,
      boxOrdinalGroup: !0,
      columnCount: !0,
      columns: !0,
      flex: !0,
      flexGrow: !0,
      flexPositive: !0,
      flexShrink: !0,
      flexNegative: !0,
      flexOrder: !0,
      gridArea: !0,
      gridRow: !0,
      gridRowEnd: !0,
      gridRowSpan: !0,
      gridRowStart: !0,
      gridColumn: !0,
      gridColumnEnd: !0,
      gridColumnSpan: !0,
      gridColumnStart: !0,
      fontWeight: !0,
      lineClamp: !0,
      lineHeight: !0,
      opacity: !0,
      order: !0,
      orphans: !0,
      tabSize: !0,
      widows: !0,
      zIndex: !0,
      zoom: !0,
      fillOpacity: !0,
      floodOpacity: !0,
      stopOpacity: !0,
      strokeDasharray: !0,
      strokeDashoffset: !0,
      strokeMiterlimit: !0,
      strokeOpacity: !0,
      strokeWidth: !0,
    },
    af = ["Webkit", "ms", "Moz", "O"];
  Object.keys(ir).forEach(function (e) {
    af.forEach(function (t) {
      (t = t + e.charAt(0).toUpperCase() + e.substring(1)), (ir[t] = ir[e]);
    });
  });
  function Xs(e, t, n) {
    return t == null || typeof t == "boolean" || t === ""
      ? ""
      : n || typeof t != "number" || t === 0 || (ir.hasOwnProperty(e) && ir[e])
      ? ("" + t).trim()
      : t + "px";
  }
  function Ys(e, t) {
    e = e.style;
    for (var n in t)
      if (t.hasOwnProperty(n)) {
        var r = n.indexOf("--") === 0,
          o = Xs(n, t[n], r);
        n === "float" && (n = "cssFloat"), r ? e.setProperty(n, o) : (e[n] = o);
      }
  }
  var uf = F(
    { menuitem: !0 },
    {
      area: !0,
      base: !0,
      br: !0,
      col: !0,
      embed: !0,
      hr: !0,
      img: !0,
      input: !0,
      keygen: !0,
      link: !0,
      meta: !0,
      param: !0,
      source: !0,
      track: !0,
      wbr: !0,
    }
  );
  function El(e, t) {
    if (t) {
      if (uf[e] && (t.children != null || t.dangerouslySetInnerHTML != null))
        throw Error(s(137, e));
      if (t.dangerouslySetInnerHTML != null) {
        if (t.children != null) throw Error(s(60));
        if (
          typeof t.dangerouslySetInnerHTML != "object" ||
          !("__html" in t.dangerouslySetInnerHTML)
        )
          throw Error(s(61));
      }
      if (t.style != null && typeof t.style != "object") throw Error(s(62));
    }
  }
  function Cl(e, t) {
    if (e.indexOf("-") === -1) return typeof t.is == "string";
    switch (e) {
      case "annotation-xml":
      case "color-profile":
      case "font-face":
      case "font-face-src":
      case "font-face-uri":
      case "font-face-format":
      case "font-face-name":
      case "missing-glyph":
        return !1;
      default:
        return !0;
    }
  }
  var jl = null;
  function _l(e) {
    return (
      (e = e.target || e.srcElement || window),
      e.correspondingUseElement && (e = e.correspondingUseElement),
      e.nodeType === 3 ? e.parentNode : e
    );
  }
  var bl = null,
    _n = null,
    bn = null;
  function Qs(e) {
    if ((e = br(e))) {
      if (typeof bl != "function") throw Error(s(280));
      var t = e.stateNode;
      t && ((t = xo(t)), bl(e.stateNode, e.type, t));
    }
  }
  function Zs(e) {
    _n ? (bn ? bn.push(e) : (bn = [e])) : (_n = e);
  }
  function Ks() {
    if (_n) {
      var e = _n,
        t = bn;
      if (((bn = _n = null), Qs(e), t)) for (e = 0; e < t.length; e++) Qs(t[e]);
    }
  }
  function Js(e, t) {
    return e(t);
  }
  function qs() {}
  var Ml = !1;
  function ea(e, t, n) {
    if (Ml) return e(t, n);
    Ml = !0;
    try {
      return Js(e, t, n);
    } finally {
      (Ml = !1), (_n !== null || bn !== null) && (qs(), Ks());
    }
  }
  function sr(e, t) {
    var n = e.stateNode;
    if (n === null) return null;
    var r = xo(n);
    if (r === null) return null;
    n = r[t];
    e: switch (t) {
      case "onClick":
      case "onClickCapture":
      case "onDoubleClick":
      case "onDoubleClickCapture":
      case "onMouseDown":
      case "onMouseDownCapture":
      case "onMouseMove":
      case "onMouseMoveCapture":
      case "onMouseUp":
      case "onMouseUpCapture":
      case "onMouseEnter":
        (r = !r.disabled) ||
          ((e = e.type),
          (r = !(
            e === "button" ||
            e === "input" ||
            e === "select" ||
            e === "textarea"
          ))),
          (e = !r);
        break e;
      default:
        e = !1;
    }
    if (e) return null;
    if (n && typeof n != "function") throw Error(s(231, t, typeof n));
    return n;
  }
  var Pl = !1;
  if (v)
    try {
      var ar = {};
      Object.defineProperty(ar, "passive", {
        get: function () {
          Pl = !0;
        },
      }),
        window.addEventListener("test", ar, ar),
        window.removeEventListener("test", ar, ar);
    } catch {
      Pl = !1;
    }
  function cf(e, t, n, r, o, i, u, p, h) {
    var N = Array.prototype.slice.call(arguments, 3);
    try {
      t.apply(n, N);
    } catch (P) {
      this.onError(P);
    }
  }
  var ur = !1,
    Zr = null,
    Kr = !1,
    zl = null,
    df = {
      onError: function (e) {
        (ur = !0), (Zr = e);
      },
    };
  function ff(e, t, n, r, o, i, u, p, h) {
    (ur = !1), (Zr = null), cf.apply(df, arguments);
  }
  function pf(e, t, n, r, o, i, u, p, h) {
    if ((ff.apply(this, arguments), ur)) {
      if (ur) {
        var N = Zr;
        (ur = !1), (Zr = null);
      } else throw Error(s(198));
      Kr || ((Kr = !0), (zl = N));
    }
  }
  function cn(e) {
    var t = e,
      n = e;
    if (e.alternate) for (; t.return; ) t = t.return;
    else {
      e = t;
      do (t = e), (t.flags & 4098) !== 0 && (n = t.return), (e = t.return);
      while (e);
    }
    return t.tag === 3 ? n : null;
  }
  function ta(e) {
    if (e.tag === 13) {
      var t = e.memoizedState;
      if (
        (t === null && ((e = e.alternate), e !== null && (t = e.memoizedState)),
        t !== null)
      )
        return t.dehydrated;
    }
    return null;
  }
  function na(e) {
    if (cn(e) !== e) throw Error(s(188));
  }
  function mf(e) {
    var t = e.alternate;
    if (!t) {
      if (((t = cn(e)), t === null)) throw Error(s(188));
      return t !== e ? null : e;
    }
    for (var n = e, r = t; ; ) {
      var o = n.return;
      if (o === null) break;
      var i = o.alternate;
      if (i === null) {
        if (((r = o.return), r !== null)) {
          n = r;
          continue;
        }
        break;
      }
      if (o.child === i.child) {
        for (i = o.child; i; ) {
          if (i === n) return na(o), e;
          if (i === r) return na(o), t;
          i = i.sibling;
        }
        throw Error(s(188));
      }
      if (n.return !== r.return) (n = o), (r = i);
      else {
        for (var u = !1, p = o.child; p; ) {
          if (p === n) {
            (u = !0), (n = o), (r = i);
            break;
          }
          if (p === r) {
            (u = !0), (r = o), (n = i);
            break;
          }
          p = p.sibling;
        }
        if (!u) {
          for (p = i.child; p; ) {
            if (p === n) {
              (u = !0), (n = i), (r = o);
              break;
            }
            if (p === r) {
              (u = !0), (r = i), (n = o);
              break;
            }
            p = p.sibling;
          }
          if (!u) throw Error(s(189));
        }
      }
      if (n.alternate !== r) throw Error(s(190));
    }
    if (n.tag !== 3) throw Error(s(188));
    return n.stateNode.current === n ? e : t;
  }
  function ra(e) {
    return (e = mf(e)), e !== null ? oa(e) : null;
  }
  function oa(e) {
    if (e.tag === 5 || e.tag === 6) return e;
    for (e = e.child; e !== null; ) {
      var t = oa(e);
      if (t !== null) return t;
      e = e.sibling;
    }
    return null;
  }
  var la = a.unstable_scheduleCallback,
    ia = a.unstable_cancelCallback,
    hf = a.unstable_shouldYield,
    gf = a.unstable_requestPaint,
    be = a.unstable_now,
    vf = a.unstable_getCurrentPriorityLevel,
    Rl = a.unstable_ImmediatePriority,
    sa = a.unstable_UserBlockingPriority,
    Jr = a.unstable_NormalPriority,
    yf = a.unstable_LowPriority,
    aa = a.unstable_IdlePriority,
    qr = null,
    St = null;
  function xf(e) {
    if (St && typeof St.onCommitFiberRoot == "function")
      try {
        St.onCommitFiberRoot(qr, e, void 0, (e.current.flags & 128) === 128);
      } catch {}
  }
  var mt = Math.clz32 ? Math.clz32 : Nf,
    wf = Math.log,
    kf = Math.LN2;
  function Nf(e) {
    return (e >>>= 0), e === 0 ? 32 : (31 - ((wf(e) / kf) | 0)) | 0;
  }
  var eo = 64,
    to = 4194304;
  function cr(e) {
    switch (e & -e) {
      case 1:
        return 1;
      case 2:
        return 2;
      case 4:
        return 4;
      case 8:
        return 8;
      case 16:
        return 16;
      case 32:
        return 32;
      case 64:
      case 128:
      case 256:
      case 512:
      case 1024:
      case 2048:
      case 4096:
      case 8192:
      case 16384:
      case 32768:
      case 65536:
      case 131072:
      case 262144:
      case 524288:
      case 1048576:
      case 2097152:
        return e & 4194240;
      case 4194304:
      case 8388608:
      case 16777216:
      case 33554432:
      case 67108864:
        return e & 130023424;
      case 134217728:
        return 134217728;
      case 268435456:
        return 268435456;
      case 536870912:
        return 536870912;
      case 1073741824:
        return 1073741824;
      default:
        return e;
    }
  }
  function no(e, t) {
    var n = e.pendingLanes;
    if (n === 0) return 0;
    var r = 0,
      o = e.suspendedLanes,
      i = e.pingedLanes,
      u = n & 268435455;
    if (u !== 0) {
      var p = u & ~o;
      p !== 0 ? (r = cr(p)) : ((i &= u), i !== 0 && (r = cr(i)));
    } else (u = n & ~o), u !== 0 ? (r = cr(u)) : i !== 0 && (r = cr(i));
    if (r === 0) return 0;
    if (
      t !== 0 &&
      t !== r &&
      (t & o) === 0 &&
      ((o = r & -r), (i = t & -t), o >= i || (o === 16 && (i & 4194240) !== 0))
    )
      return t;
    if (((r & 4) !== 0 && (r |= n & 16), (t = e.entangledLanes), t !== 0))
      for (e = e.entanglements, t &= r; 0 < t; )
        (n = 31 - mt(t)), (o = 1 << n), (r |= e[n]), (t &= ~o);
    return r;
  }
  function Sf(e, t) {
    switch (e) {
      case 1:
      case 2:
      case 4:
        return t + 250;
      case 8:
      case 16:
      case 32:
      case 64:
      case 128:
      case 256:
      case 512:
      case 1024:
      case 2048:
      case 4096:
      case 8192:
      case 16384:
      case 32768:
      case 65536:
      case 131072:
      case 262144:
      case 524288:
      case 1048576:
      case 2097152:
        return t + 5e3;
      case 4194304:
      case 8388608:
      case 16777216:
      case 33554432:
      case 67108864:
        return -1;
      case 134217728:
      case 268435456:
      case 536870912:
      case 1073741824:
        return -1;
      default:
        return -1;
    }
  }
  function Ef(e, t) {
    for (
      var n = e.suspendedLanes,
        r = e.pingedLanes,
        o = e.expirationTimes,
        i = e.pendingLanes;
      0 < i;

    ) {
      var u = 31 - mt(i),
        p = 1 << u,
        h = o[u];
      h === -1
        ? ((p & n) === 0 || (p & r) !== 0) && (o[u] = Sf(p, t))
        : h <= t && (e.expiredLanes |= p),
        (i &= ~p);
    }
  }
  function Tl(e) {
    return (
      (e = e.pendingLanes & -1073741825),
      e !== 0 ? e : e & 1073741824 ? 1073741824 : 0
    );
  }
  function ua() {
    var e = eo;
    return (eo <<= 1), (eo & 4194240) === 0 && (eo = 64), e;
  }
  function Il(e) {
    for (var t = [], n = 0; 31 > n; n++) t.push(e);
    return t;
  }
  function dr(e, t, n) {
    (e.pendingLanes |= t),
      t !== 536870912 && ((e.suspendedLanes = 0), (e.pingedLanes = 0)),
      (e = e.eventTimes),
      (t = 31 - mt(t)),
      (e[t] = n);
  }
  function Cf(e, t) {
    var n = e.pendingLanes & ~t;
    (e.pendingLanes = t),
      (e.suspendedLanes = 0),
      (e.pingedLanes = 0),
      (e.expiredLanes &= t),
      (e.mutableReadLanes &= t),
      (e.entangledLanes &= t),
      (t = e.entanglements);
    var r = e.eventTimes;
    for (e = e.expirationTimes; 0 < n; ) {
      var o = 31 - mt(n),
        i = 1 << o;
      (t[o] = 0), (r[o] = -1), (e[o] = -1), (n &= ~i);
    }
  }
  function Ol(e, t) {
    var n = (e.entangledLanes |= t);
    for (e = e.entanglements; n; ) {
      var r = 31 - mt(n),
        o = 1 << r;
      (o & t) | (e[r] & t) && (e[r] |= t), (n &= ~o);
    }
  }
  var ve = 0;
  function ca(e) {
    return (
      (e &= -e),
      1 < e ? (4 < e ? ((e & 268435455) !== 0 ? 16 : 536870912) : 4) : 1
    );
  }
  var da,
    Dl,
    fa,
    pa,
    ma,
    Ll = !1,
    ro = [],
    Ht = null,
    Ut = null,
    Wt = null,
    fr = new Map(),
    pr = new Map(),
    Bt = [],
    jf =
      "mousedown mouseup touchcancel touchend touchstart auxclick dblclick pointercancel pointerdown pointerup dragend dragstart drop compositionend compositionstart keydown keypress keyup input textInput copy cut paste click change contextmenu reset submit".split(
        " "
      );
  function ha(e, t) {
    switch (e) {
      case "focusin":
      case "focusout":
        Ht = null;
        break;
      case "dragenter":
      case "dragleave":
        Ut = null;
        break;
      case "mouseover":
      case "mouseout":
        Wt = null;
        break;
      case "pointerover":
      case "pointerout":
        fr.delete(t.pointerId);
        break;
      case "gotpointercapture":
      case "lostpointercapture":
        pr.delete(t.pointerId);
    }
  }
  function mr(e, t, n, r, o, i) {
    return e === null || e.nativeEvent !== i
      ? ((e = {
          blockedOn: t,
          domEventName: n,
          eventSystemFlags: r,
          nativeEvent: i,
          targetContainers: [o],
        }),
        t !== null && ((t = br(t)), t !== null && Dl(t)),
        e)
      : ((e.eventSystemFlags |= r),
        (t = e.targetContainers),
        o !== null && t.indexOf(o) === -1 && t.push(o),
        e);
  }
  function _f(e, t, n, r, o) {
    switch (t) {
      case "focusin":
        return (Ht = mr(Ht, e, t, n, r, o)), !0;
      case "dragenter":
        return (Ut = mr(Ut, e, t, n, r, o)), !0;
      case "mouseover":
        return (Wt = mr(Wt, e, t, n, r, o)), !0;
      case "pointerover":
        var i = o.pointerId;
        return fr.set(i, mr(fr.get(i) || null, e, t, n, r, o)), !0;
      case "gotpointercapture":
        return (
          (i = o.pointerId), pr.set(i, mr(pr.get(i) || null, e, t, n, r, o)), !0
        );
    }
    return !1;
  }
  function ga(e) {
    var t = dn(e.target);
    if (t !== null) {
      var n = cn(t);
      if (n !== null) {
        if (((t = n.tag), t === 13)) {
          if (((t = ta(n)), t !== null)) {
            (e.blockedOn = t),
              ma(e.priority, function () {
                fa(n);
              });
            return;
          }
        } else if (t === 3 && n.stateNode.current.memoizedState.isDehydrated) {
          e.blockedOn = n.tag === 3 ? n.stateNode.containerInfo : null;
          return;
        }
      }
    }
    e.blockedOn = null;
  }
  function oo(e) {
    if (e.blockedOn !== null) return !1;
    for (var t = e.targetContainers; 0 < t.length; ) {
      var n = Fl(e.domEventName, e.eventSystemFlags, t[0], e.nativeEvent);
      if (n === null) {
        n = e.nativeEvent;
        var r = new n.constructor(n.type, n);
        (jl = r), n.target.dispatchEvent(r), (jl = null);
      } else return (t = br(n)), t !== null && Dl(t), (e.blockedOn = n), !1;
      t.shift();
    }
    return !0;
  }
  function va(e, t, n) {
    oo(e) && n.delete(t);
  }
  function bf() {
    (Ll = !1),
      Ht !== null && oo(Ht) && (Ht = null),
      Ut !== null && oo(Ut) && (Ut = null),
      Wt !== null && oo(Wt) && (Wt = null),
      fr.forEach(va),
      pr.forEach(va);
  }
  function hr(e, t) {
    e.blockedOn === t &&
      ((e.blockedOn = null),
      Ll ||
        ((Ll = !0),
        a.unstable_scheduleCallback(a.unstable_NormalPriority, bf)));
  }
  function gr(e) {
    function t(o) {
      return hr(o, e);
    }
    if (0 < ro.length) {
      hr(ro[0], e);
      for (var n = 1; n < ro.length; n++) {
        var r = ro[n];
        r.blockedOn === e && (r.blockedOn = null);
      }
    }
    for (
      Ht !== null && hr(Ht, e),
        Ut !== null && hr(Ut, e),
        Wt !== null && hr(Wt, e),
        fr.forEach(t),
        pr.forEach(t),
        n = 0;
      n < Bt.length;
      n++
    )
      (r = Bt[n]), r.blockedOn === e && (r.blockedOn = null);
    for (; 0 < Bt.length && ((n = Bt[0]), n.blockedOn === null); )
      ga(n), n.blockedOn === null && Bt.shift();
  }
  var Mn = te.ReactCurrentBatchConfig,
    lo = !0;
  function Mf(e, t, n, r) {
    var o = ve,
      i = Mn.transition;
    Mn.transition = null;
    try {
      (ve = 1), Al(e, t, n, r);
    } finally {
      (ve = o), (Mn.transition = i);
    }
  }
  function Pf(e, t, n, r) {
    var o = ve,
      i = Mn.transition;
    Mn.transition = null;
    try {
      (ve = 4), Al(e, t, n, r);
    } finally {
      (ve = o), (Mn.transition = i);
    }
  }
  function Al(e, t, n, r) {
    if (lo) {
      var o = Fl(e, t, n, r);
      if (o === null) ni(e, t, r, io, n), ha(e, r);
      else if (_f(o, e, t, n, r)) r.stopPropagation();
      else if ((ha(e, r), t & 4 && -1 < jf.indexOf(e))) {
        for (; o !== null; ) {
          var i = br(o);
          if (
            (i !== null && da(i),
            (i = Fl(e, t, n, r)),
            i === null && ni(e, t, r, io, n),
            i === o)
          )
            break;
          o = i;
        }
        o !== null && r.stopPropagation();
      } else ni(e, t, r, null, n);
    }
  }
  var io = null;
  function Fl(e, t, n, r) {
    if (((io = null), (e = _l(r)), (e = dn(e)), e !== null))
      if (((t = cn(e)), t === null)) e = null;
      else if (((n = t.tag), n === 13)) {
        if (((e = ta(t)), e !== null)) return e;
        e = null;
      } else if (n === 3) {
        if (t.stateNode.current.memoizedState.isDehydrated)
          return t.tag === 3 ? t.stateNode.containerInfo : null;
        e = null;
      } else t !== e && (e = null);
    return (io = e), null;
  }
  function ya(e) {
    switch (e) {
      case "cancel":
      case "click":
      case "close":
      case "contextmenu":
      case "copy":
      case "cut":
      case "auxclick":
      case "dblclick":
      case "dragend":
      case "dragstart":
      case "drop":
      case "focusin":
      case "focusout":
      case "input":
      case "invalid":
      case "keydown":
      case "keypress":
      case "keyup":
      case "mousedown":
      case "mouseup":
      case "paste":
      case "pause":
      case "play":
      case "pointercancel":
      case "pointerdown":
      case "pointerup":
      case "ratechange":
      case "reset":
      case "resize":
      case "seeked":
      case "submit":
      case "touchcancel":
      case "touchend":
      case "touchstart":
      case "volumechange":
      case "change":
      case "selectionchange":
      case "textInput":
      case "compositionstart":
      case "compositionend":
      case "compositionupdate":
      case "beforeblur":
      case "afterblur":
      case "beforeinput":
      case "blur":
      case "fullscreenchange":
      case "focus":
      case "hashchange":
      case "popstate":
      case "select":
      case "selectstart":
        return 1;
      case "drag":
      case "dragenter":
      case "dragexit":
      case "dragleave":
      case "dragover":
      case "mousemove":
      case "mouseout":
      case "mouseover":
      case "pointermove":
      case "pointerout":
      case "pointerover":
      case "scroll":
      case "toggle":
      case "touchmove":
      case "wheel":
      case "mouseenter":
      case "mouseleave":
      case "pointerenter":
      case "pointerleave":
        return 4;
      case "message":
        switch (vf()) {
          case Rl:
            return 1;
          case sa:
            return 4;
          case Jr:
          case yf:
            return 16;
          case aa:
            return 536870912;
          default:
            return 16;
        }
      default:
        return 16;
    }
  }
  var $t = null,
    Hl = null,
    so = null;
  function xa() {
    if (so) return so;
    var e,
      t = Hl,
      n = t.length,
      r,
      o = "value" in $t ? $t.value : $t.textContent,
      i = o.length;
    for (e = 0; e < n && t[e] === o[e]; e++);
    var u = n - e;
    for (r = 1; r <= u && t[n - r] === o[i - r]; r++);
    return (so = o.slice(e, 1 < r ? 1 - r : void 0));
  }
  function ao(e) {
    var t = e.keyCode;
    return (
      "charCode" in e
        ? ((e = e.charCode), e === 0 && t === 13 && (e = 13))
        : (e = t),
      e === 10 && (e = 13),
      32 <= e || e === 13 ? e : 0
    );
  }
  function uo() {
    return !0;
  }
  function wa() {
    return !1;
  }
  function rt(e) {
    function t(n, r, o, i, u) {
      (this._reactName = n),
        (this._targetInst = o),
        (this.type = r),
        (this.nativeEvent = i),
        (this.target = u),
        (this.currentTarget = null);
      for (var p in e)
        e.hasOwnProperty(p) && ((n = e[p]), (this[p] = n ? n(i) : i[p]));
      return (
        (this.isDefaultPrevented = (
          i.defaultPrevented != null ? i.defaultPrevented : i.returnValue === !1
        )
          ? uo
          : wa),
        (this.isPropagationStopped = wa),
        this
      );
    }
    return (
      F(t.prototype, {
        preventDefault: function () {
          this.defaultPrevented = !0;
          var n = this.nativeEvent;
          n &&
            (n.preventDefault
              ? n.preventDefault()
              : typeof n.returnValue != "unknown" && (n.returnValue = !1),
            (this.isDefaultPrevented = uo));
        },
        stopPropagation: function () {
          var n = this.nativeEvent;
          n &&
            (n.stopPropagation
              ? n.stopPropagation()
              : typeof n.cancelBubble != "unknown" && (n.cancelBubble = !0),
            (this.isPropagationStopped = uo));
        },
        persist: function () {},
        isPersistent: uo,
      }),
      t
    );
  }
  var Pn = {
      eventPhase: 0,
      bubbles: 0,
      cancelable: 0,
      timeStamp: function (e) {
        return e.timeStamp || Date.now();
      },
      defaultPrevented: 0,
      isTrusted: 0,
    },
    Ul = rt(Pn),
    vr = F({}, Pn, { view: 0, detail: 0 }),
    zf = rt(vr),
    Wl,
    Bl,
    yr,
    co = F({}, vr, {
      screenX: 0,
      screenY: 0,
      clientX: 0,
      clientY: 0,
      pageX: 0,
      pageY: 0,
      ctrlKey: 0,
      shiftKey: 0,
      altKey: 0,
      metaKey: 0,
      getModifierState: Vl,
      button: 0,
      buttons: 0,
      relatedTarget: function (e) {
        return e.relatedTarget === void 0
          ? e.fromElement === e.srcElement
            ? e.toElement
            : e.fromElement
          : e.relatedTarget;
      },
      movementX: function (e) {
        return "movementX" in e
          ? e.movementX
          : (e !== yr &&
              (yr && e.type === "mousemove"
                ? ((Wl = e.screenX - yr.screenX), (Bl = e.screenY - yr.screenY))
                : (Bl = Wl = 0),
              (yr = e)),
            Wl);
      },
      movementY: function (e) {
        return "movementY" in e ? e.movementY : Bl;
      },
    }),
    ka = rt(co),
    Rf = F({}, co, { dataTransfer: 0 }),
    Tf = rt(Rf),
    If = F({}, vr, { relatedTarget: 0 }),
    $l = rt(If),
    Of = F({}, Pn, { animationName: 0, elapsedTime: 0, pseudoElement: 0 }),
    Df = rt(Of),
    Lf = F({}, Pn, {
      clipboardData: function (e) {
        return "clipboardData" in e ? e.clipboardData : window.clipboardData;
      },
    }),
    Af = rt(Lf),
    Ff = F({}, Pn, { data: 0 }),
    Na = rt(Ff),
    Hf = {
      Esc: "Escape",
      Spacebar: " ",
      Left: "ArrowLeft",
      Up: "ArrowUp",
      Right: "ArrowRight",
      Down: "ArrowDown",
      Del: "Delete",
      Win: "OS",
      Menu: "ContextMenu",
      Apps: "ContextMenu",
      Scroll: "ScrollLock",
      MozPrintableKey: "Unidentified",
    },
    Uf = {
      8: "Backspace",
      9: "Tab",
      12: "Clear",
      13: "Enter",
      16: "Shift",
      17: "Control",
      18: "Alt",
      19: "Pause",
      20: "CapsLock",
      27: "Escape",
      32: " ",
      33: "PageUp",
      34: "PageDown",
      35: "End",
      36: "Home",
      37: "ArrowLeft",
      38: "ArrowUp",
      39: "ArrowRight",
      40: "ArrowDown",
      45: "Insert",
      46: "Delete",
      112: "F1",
      113: "F2",
      114: "F3",
      115: "F4",
      116: "F5",
      117: "F6",
      118: "F7",
      119: "F8",
      120: "F9",
      121: "F10",
      122: "F11",
      123: "F12",
      144: "NumLock",
      145: "ScrollLock",
      224: "Meta",
    },
    Wf = {
      Alt: "altKey",
      Control: "ctrlKey",
      Meta: "metaKey",
      Shift: "shiftKey",
    };
  function Bf(e) {
    var t = this.nativeEvent;
    return t.getModifierState
      ? t.getModifierState(e)
      : (e = Wf[e])
      ? !!t[e]
      : !1;
  }
  function Vl() {
    return Bf;
  }
  var $f = F({}, vr, {
      key: function (e) {
        if (e.key) {
          var t = Hf[e.key] || e.key;
          if (t !== "Unidentified") return t;
        }
        return e.type === "keypress"
          ? ((e = ao(e)), e === 13 ? "Enter" : String.fromCharCode(e))
          : e.type === "keydown" || e.type === "keyup"
          ? Uf[e.keyCode] || "Unidentified"
          : "";
      },
      code: 0,
      location: 0,
      ctrlKey: 0,
      shiftKey: 0,
      altKey: 0,
      metaKey: 0,
      repeat: 0,
      locale: 0,
      getModifierState: Vl,
      charCode: function (e) {
        return e.type === "keypress" ? ao(e) : 0;
      },
      keyCode: function (e) {
        return e.type === "keydown" || e.type === "keyup" ? e.keyCode : 0;
      },
      which: function (e) {
        return e.type === "keypress"
          ? ao(e)
          : e.type === "keydown" || e.type === "keyup"
          ? e.keyCode
          : 0;
      },
    }),
    Vf = rt($f),
    Gf = F({}, co, {
      pointerId: 0,
      width: 0,
      height: 0,
      pressure: 0,
      tangentialPressure: 0,
      tiltX: 0,
      tiltY: 0,
      twist: 0,
      pointerType: 0,
      isPrimary: 0,
    }),
    Sa = rt(Gf),
    Xf = F({}, vr, {
      touches: 0,
      targetTouches: 0,
      changedTouches: 0,
      altKey: 0,
      metaKey: 0,
      ctrlKey: 0,
      shiftKey: 0,
      getModifierState: Vl,
    }),
    Yf = rt(Xf),
    Qf = F({}, Pn, { propertyName: 0, elapsedTime: 0, pseudoElement: 0 }),
    Zf = rt(Qf),
    Kf = F({}, co, {
      deltaX: function (e) {
        return "deltaX" in e
          ? e.deltaX
          : "wheelDeltaX" in e
          ? -e.wheelDeltaX
          : 0;
      },
      deltaY: function (e) {
        return "deltaY" in e
          ? e.deltaY
          : "wheelDeltaY" in e
          ? -e.wheelDeltaY
          : "wheelDelta" in e
          ? -e.wheelDelta
          : 0;
      },
      deltaZ: 0,
      deltaMode: 0,
    }),
    Jf = rt(Kf),
    qf = [9, 13, 27, 32],
    Gl = v && "CompositionEvent" in window,
    xr = null;
  v && "documentMode" in document && (xr = document.documentMode);
  var ep = v && "TextEvent" in window && !xr,
    Ea = v && (!Gl || (xr && 8 < xr && 11 >= xr)),
    Ca = " ",
    ja = !1;
  function _a(e, t) {
    switch (e) {
      case "keyup":
        return qf.indexOf(t.keyCode) !== -1;
      case "keydown":
        return t.keyCode !== 229;
      case "keypress":
      case "mousedown":
      case "focusout":
        return !0;
      default:
        return !1;
    }
  }
  function ba(e) {
    return (e = e.detail), typeof e == "object" && "data" in e ? e.data : null;
  }
  var zn = !1;
  function tp(e, t) {
    switch (e) {
      case "compositionend":
        return ba(t);
      case "keypress":
        return t.which !== 32 ? null : ((ja = !0), Ca);
      case "textInput":
        return (e = t.data), e === Ca && ja ? null : e;
      default:
        return null;
    }
  }
  function np(e, t) {
    if (zn)
      return e === "compositionend" || (!Gl && _a(e, t))
        ? ((e = xa()), (so = Hl = $t = null), (zn = !1), e)
        : null;
    switch (e) {
      case "paste":
        return null;
      case "keypress":
        if (!(t.ctrlKey || t.altKey || t.metaKey) || (t.ctrlKey && t.altKey)) {
          if (t.char && 1 < t.char.length) return t.char;
          if (t.which) return String.fromCharCode(t.which);
        }
        return null;
      case "compositionend":
        return Ea && t.locale !== "ko" ? null : t.data;
      default:
        return null;
    }
  }
  var rp = {
    color: !0,
    date: !0,
    datetime: !0,
    "datetime-local": !0,
    email: !0,
    month: !0,
    number: !0,
    password: !0,
    range: !0,
    search: !0,
    tel: !0,
    text: !0,
    time: !0,
    url: !0,
    week: !0,
  };
  function Ma(e) {
    var t = e && e.nodeName && e.nodeName.toLowerCase();
    return t === "input" ? !!rp[e.type] : t === "textarea";
  }
  function Pa(e, t, n, r) {
    Zs(r),
      (t = go(t, "onChange")),
      0 < t.length &&
        ((n = new Ul("onChange", "change", null, n, r)),
        e.push({ event: n, listeners: t }));
  }
  var wr = null,
    kr = null;
  function op(e) {
    Ya(e, 0);
  }
  function fo(e) {
    var t = Dn(e);
    if (un(t)) return e;
  }
  function lp(e, t) {
    if (e === "change") return t;
  }
  var za = !1;
  if (v) {
    var Xl;
    if (v) {
      var Yl = "oninput" in document;
      if (!Yl) {
        var Ra = document.createElement("div");
        Ra.setAttribute("oninput", "return;"),
          (Yl = typeof Ra.oninput == "function");
      }
      Xl = Yl;
    } else Xl = !1;
    za = Xl && (!document.documentMode || 9 < document.documentMode);
  }
  function Ta() {
    wr && (wr.detachEvent("onpropertychange", Ia), (kr = wr = null));
  }
  function Ia(e) {
    if (e.propertyName === "value" && fo(kr)) {
      var t = [];
      Pa(t, kr, e, _l(e)), ea(op, t);
    }
  }
  function ip(e, t, n) {
    e === "focusin"
      ? (Ta(), (wr = t), (kr = n), wr.attachEvent("onpropertychange", Ia))
      : e === "focusout" && Ta();
  }
  function sp(e) {
    if (e === "selectionchange" || e === "keyup" || e === "keydown")
      return fo(kr);
  }
  function ap(e, t) {
    if (e === "click") return fo(t);
  }
  function up(e, t) {
    if (e === "input" || e === "change") return fo(t);
  }
  function cp(e, t) {
    return (e === t && (e !== 0 || 1 / e === 1 / t)) || (e !== e && t !== t);
  }
  var ht = typeof Object.is == "function" ? Object.is : cp;
  function Nr(e, t) {
    if (ht(e, t)) return !0;
    if (
      typeof e != "object" ||
      e === null ||
      typeof t != "object" ||
      t === null
    )
      return !1;
    var n = Object.keys(e),
      r = Object.keys(t);
    if (n.length !== r.length) return !1;
    for (r = 0; r < n.length; r++) {
      var o = n[r];
      if (!E.call(t, o) || !ht(e[o], t[o])) return !1;
    }
    return !0;
  }
  function Oa(e) {
    for (; e && e.firstChild; ) e = e.firstChild;
    return e;
  }
  function Da(e, t) {
    var n = Oa(e);
    e = 0;
    for (var r; n; ) {
      if (n.nodeType === 3) {
        if (((r = e + n.textContent.length), e <= t && r >= t))
          return { node: n, offset: t - e };
        e = r;
      }
      e: {
        for (; n; ) {
          if (n.nextSibling) {
            n = n.nextSibling;
            break e;
          }
          n = n.parentNode;
        }
        n = void 0;
      }
      n = Oa(n);
    }
  }
  function La(e, t) {
    return e && t
      ? e === t
        ? !0
        : e && e.nodeType === 3
        ? !1
        : t && t.nodeType === 3
        ? La(e, t.parentNode)
        : "contains" in e
        ? e.contains(t)
        : e.compareDocumentPosition
        ? !!(e.compareDocumentPosition(t) & 16)
        : !1
      : !1;
  }
  function Aa() {
    for (var e = window, t = Yr(); t instanceof e.HTMLIFrameElement; ) {
      try {
        var n = typeof t.contentWindow.location.href == "string";
      } catch {
        n = !1;
      }
      if (n) e = t.contentWindow;
      else break;
      t = Yr(e.document);
    }
    return t;
  }
  function Ql(e) {
    var t = e && e.nodeName && e.nodeName.toLowerCase();
    return (
      t &&
      ((t === "input" &&
        (e.type === "text" ||
          e.type === "search" ||
          e.type === "tel" ||
          e.type === "url" ||
          e.type === "password")) ||
        t === "textarea" ||
        e.contentEditable === "true")
    );
  }
  function dp(e) {
    var t = Aa(),
      n = e.focusedElem,
      r = e.selectionRange;
    if (
      t !== n &&
      n &&
      n.ownerDocument &&
      La(n.ownerDocument.documentElement, n)
    ) {
      if (r !== null && Ql(n)) {
        if (
          ((t = r.start),
          (e = r.end),
          e === void 0 && (e = t),
          "selectionStart" in n)
        )
          (n.selectionStart = t),
            (n.selectionEnd = Math.min(e, n.value.length));
        else if (
          ((e = ((t = n.ownerDocument || document) && t.defaultView) || window),
          e.getSelection)
        ) {
          e = e.getSelection();
          var o = n.textContent.length,
            i = Math.min(r.start, o);
          (r = r.end === void 0 ? i : Math.min(r.end, o)),
            !e.extend && i > r && ((o = r), (r = i), (i = o)),
            (o = Da(n, i));
          var u = Da(n, r);
          o &&
            u &&
            (e.rangeCount !== 1 ||
              e.anchorNode !== o.node ||
              e.anchorOffset !== o.offset ||
              e.focusNode !== u.node ||
              e.focusOffset !== u.offset) &&
            ((t = t.createRange()),
            t.setStart(o.node, o.offset),
            e.removeAllRanges(),
            i > r
              ? (e.addRange(t), e.extend(u.node, u.offset))
              : (t.setEnd(u.node, u.offset), e.addRange(t)));
        }
      }
      for (t = [], e = n; (e = e.parentNode); )
        e.nodeType === 1 &&
          t.push({ element: e, left: e.scrollLeft, top: e.scrollTop });
      for (typeof n.focus == "function" && n.focus(), n = 0; n < t.length; n++)
        (e = t[n]),
          (e.element.scrollLeft = e.left),
          (e.element.scrollTop = e.top);
    }
  }
  var fp = v && "documentMode" in document && 11 >= document.documentMode,
    Rn = null,
    Zl = null,
    Sr = null,
    Kl = !1;
  function Fa(e, t, n) {
    var r =
      n.window === n ? n.document : n.nodeType === 9 ? n : n.ownerDocument;
    Kl ||
      Rn == null ||
      Rn !== Yr(r) ||
      ((r = Rn),
      "selectionStart" in r && Ql(r)
        ? (r = { start: r.selectionStart, end: r.selectionEnd })
        : ((r = (
            (r.ownerDocument && r.ownerDocument.defaultView) ||
            window
          ).getSelection()),
          (r = {
            anchorNode: r.anchorNode,
            anchorOffset: r.anchorOffset,
            focusNode: r.focusNode,
            focusOffset: r.focusOffset,
          })),
      (Sr && Nr(Sr, r)) ||
        ((Sr = r),
        (r = go(Zl, "onSelect")),
        0 < r.length &&
          ((t = new Ul("onSelect", "select", null, t, n)),
          e.push({ event: t, listeners: r }),
          (t.target = Rn))));
  }
  function po(e, t) {
    var n = {};
    return (
      (n[e.toLowerCase()] = t.toLowerCase()),
      (n["Webkit" + e] = "webkit" + t),
      (n["Moz" + e] = "moz" + t),
      n
    );
  }
  var Tn = {
      animationend: po("Animation", "AnimationEnd"),
      animationiteration: po("Animation", "AnimationIteration"),
      animationstart: po("Animation", "AnimationStart"),
      transitionend: po("Transition", "TransitionEnd"),
    },
    Jl = {},
    Ha = {};
  v &&
    ((Ha = document.createElement("div").style),
    "AnimationEvent" in window ||
      (delete Tn.animationend.animation,
      delete Tn.animationiteration.animation,
      delete Tn.animationstart.animation),
    "TransitionEvent" in window || delete Tn.transitionend.transition);
  function mo(e) {
    if (Jl[e]) return Jl[e];
    if (!Tn[e]) return e;
    var t = Tn[e],
      n;
    for (n in t) if (t.hasOwnProperty(n) && n in Ha) return (Jl[e] = t[n]);
    return e;
  }
  var Ua = mo("animationend"),
    Wa = mo("animationiteration"),
    Ba = mo("animationstart"),
    $a = mo("transitionend"),
    Va = new Map(),
    Ga =
      "abort auxClick cancel canPlay canPlayThrough click close contextMenu copy cut drag dragEnd dragEnter dragExit dragLeave dragOver dragStart drop durationChange emptied encrypted ended error gotPointerCapture input invalid keyDown keyPress keyUp load loadedData loadedMetadata loadStart lostPointerCapture mouseDown mouseMove mouseOut mouseOver mouseUp paste pause play playing pointerCancel pointerDown pointerMove pointerOut pointerOver pointerUp progress rateChange reset resize seeked seeking stalled submit suspend timeUpdate touchCancel touchEnd touchStart volumeChange scroll toggle touchMove waiting wheel".split(
        " "
      );
  function Vt(e, t) {
    Va.set(e, t), m(t, [e]);
  }
  for (var ql = 0; ql < Ga.length; ql++) {
    var ei = Ga[ql],
      pp = ei.toLowerCase(),
      mp = ei[0].toUpperCase() + ei.slice(1);
    Vt(pp, "on" + mp);
  }
  Vt(Ua, "onAnimationEnd"),
    Vt(Wa, "onAnimationIteration"),
    Vt(Ba, "onAnimationStart"),
    Vt("dblclick", "onDoubleClick"),
    Vt("focusin", "onFocus"),
    Vt("focusout", "onBlur"),
    Vt($a, "onTransitionEnd"),
    w("onMouseEnter", ["mouseout", "mouseover"]),
    w("onMouseLeave", ["mouseout", "mouseover"]),
    w("onPointerEnter", ["pointerout", "pointerover"]),
    w("onPointerLeave", ["pointerout", "pointerover"]),
    m(
      "onChange",
      "change click focusin focusout input keydown keyup selectionchange".split(
        " "
      )
    ),
    m(
      "onSelect",
      "focusout contextmenu dragend focusin keydown keyup mousedown mouseup selectionchange".split(
        " "
      )
    ),
    m("onBeforeInput", ["compositionend", "keypress", "textInput", "paste"]),
    m(
      "onCompositionEnd",
      "compositionend focusout keydown keypress keyup mousedown".split(" ")
    ),
    m(
      "onCompositionStart",
      "compositionstart focusout keydown keypress keyup mousedown".split(" ")
    ),
    m(
      "onCompositionUpdate",
      "compositionupdate focusout keydown keypress keyup mousedown".split(" ")
    );
  var Er =
      "abort canplay canplaythrough durationchange emptied encrypted ended error loadeddata loadedmetadata loadstart pause play playing progress ratechange resize seeked seeking stalled suspend timeupdate volumechange waiting".split(
        " "
      ),
    hp = new Set(
      "cancel close invalid load scroll toggle".split(" ").concat(Er)
    );
  function Xa(e, t, n) {
    var r = e.type || "unknown-event";
    (e.currentTarget = n), pf(r, t, void 0, e), (e.currentTarget = null);
  }
  function Ya(e, t) {
    t = (t & 4) !== 0;
    for (var n = 0; n < e.length; n++) {
      var r = e[n],
        o = r.event;
      r = r.listeners;
      e: {
        var i = void 0;
        if (t)
          for (var u = r.length - 1; 0 <= u; u--) {
            var p = r[u],
              h = p.instance,
              N = p.currentTarget;
            if (((p = p.listener), h !== i && o.isPropagationStopped()))
              break e;
            Xa(o, p, N), (i = h);
          }
        else
          for (u = 0; u < r.length; u++) {
            if (
              ((p = r[u]),
              (h = p.instance),
              (N = p.currentTarget),
              (p = p.listener),
              h !== i && o.isPropagationStopped())
            )
              break e;
            Xa(o, p, N), (i = h);
          }
      }
    }
    if (Kr) throw ((e = zl), (Kr = !1), (zl = null), e);
  }
  function xe(e, t) {
    var n = t[ai];
    n === void 0 && (n = t[ai] = new Set());
    var r = e + "__bubble";
    n.has(r) || (Qa(t, e, 2, !1), n.add(r));
  }
  function ti(e, t, n) {
    var r = 0;
    t && (r |= 4), Qa(n, e, r, t);
  }
  var ho = "_reactListening" + Math.random().toString(36).slice(2);
  function Cr(e) {
    if (!e[ho]) {
      (e[ho] = !0),
        c.forEach(function (n) {
          n !== "selectionchange" && (hp.has(n) || ti(n, !1, e), ti(n, !0, e));
        });
      var t = e.nodeType === 9 ? e : e.ownerDocument;
      t === null || t[ho] || ((t[ho] = !0), ti("selectionchange", !1, t));
    }
  }
  function Qa(e, t, n, r) {
    switch (ya(t)) {
      case 1:
        var o = Mf;
        break;
      case 4:
        o = Pf;
        break;
      default:
        o = Al;
    }
    (n = o.bind(null, t, n, e)),
      (o = void 0),
      !Pl ||
        (t !== "touchstart" && t !== "touchmove" && t !== "wheel") ||
        (o = !0),
      r
        ? o !== void 0
          ? e.addEventListener(t, n, { capture: !0, passive: o })
          : e.addEventListener(t, n, !0)
        : o !== void 0
        ? e.addEventListener(t, n, { passive: o })
        : e.addEventListener(t, n, !1);
  }
  function ni(e, t, n, r, o) {
    var i = r;
    if ((t & 1) === 0 && (t & 2) === 0 && r !== null)
      e: for (;;) {
        if (r === null) return;
        var u = r.tag;
        if (u === 3 || u === 4) {
          var p = r.stateNode.containerInfo;
          if (p === o || (p.nodeType === 8 && p.parentNode === o)) break;
          if (u === 4)
            for (u = r.return; u !== null; ) {
              var h = u.tag;
              if (
                (h === 3 || h === 4) &&
                ((h = u.stateNode.containerInfo),
                h === o || (h.nodeType === 8 && h.parentNode === o))
              )
                return;
              u = u.return;
            }
          for (; p !== null; ) {
            if (((u = dn(p)), u === null)) return;
            if (((h = u.tag), h === 5 || h === 6)) {
              r = i = u;
              continue e;
            }
            p = p.parentNode;
          }
        }
        r = r.return;
      }
    ea(function () {
      var N = i,
        P = _l(n),
        T = [];
      e: {
        var M = Va.get(e);
        if (M !== void 0) {
          var A = Ul,
            W = e;
          switch (e) {
            case "keypress":
              if (ao(n) === 0) break e;
            case "keydown":
            case "keyup":
              A = Vf;
              break;
            case "focusin":
              (W = "focus"), (A = $l);
              break;
            case "focusout":
              (W = "blur"), (A = $l);
              break;
            case "beforeblur":
            case "afterblur":
              A = $l;
              break;
            case "click":
              if (n.button === 2) break e;
            case "auxclick":
            case "dblclick":
            case "mousedown":
            case "mousemove":
            case "mouseup":
            case "mouseout":
            case "mouseover":
            case "contextmenu":
              A = ka;
              break;
            case "drag":
            case "dragend":
            case "dragenter":
            case "dragexit":
            case "dragleave":
            case "dragover":
            case "dragstart":
            case "drop":
              A = Tf;
              break;
            case "touchcancel":
            case "touchend":
            case "touchmove":
            case "touchstart":
              A = Yf;
              break;
            case Ua:
            case Wa:
            case Ba:
              A = Df;
              break;
            case $a:
              A = Zf;
              break;
            case "scroll":
              A = zf;
              break;
            case "wheel":
              A = Jf;
              break;
            case "copy":
            case "cut":
            case "paste":
              A = Af;
              break;
            case "gotpointercapture":
            case "lostpointercapture":
            case "pointercancel":
            case "pointerdown":
            case "pointermove":
            case "pointerout":
            case "pointerover":
            case "pointerup":
              A = Sa;
          }
          var V = (t & 4) !== 0,
            Me = !V && e === "scroll",
            x = V ? (M !== null ? M + "Capture" : null) : M;
          V = [];
          for (var g = N, k; g !== null; ) {
            k = g;
            var I = k.stateNode;
            if (
              (k.tag === 5 &&
                I !== null &&
                ((k = I),
                x !== null &&
                  ((I = sr(g, x)), I != null && V.push(jr(g, I, k)))),
              Me)
            )
              break;
            g = g.return;
          }
          0 < V.length &&
            ((M = new A(M, W, null, n, P)), T.push({ event: M, listeners: V }));
        }
      }
      if ((t & 7) === 0) {
        e: {
          if (
            ((M = e === "mouseover" || e === "pointerover"),
            (A = e === "mouseout" || e === "pointerout"),
            M &&
              n !== jl &&
              (W = n.relatedTarget || n.fromElement) &&
              (dn(W) || W[Mt]))
          )
            break e;
          if (
            (A || M) &&
            ((M =
              P.window === P
                ? P
                : (M = P.ownerDocument)
                ? M.defaultView || M.parentWindow
                : window),
            A
              ? ((W = n.relatedTarget || n.toElement),
                (A = N),
                (W = W ? dn(W) : null),
                W !== null &&
                  ((Me = cn(W)), W !== Me || (W.tag !== 5 && W.tag !== 6)) &&
                  (W = null))
              : ((A = null), (W = N)),
            A !== W)
          ) {
            if (
              ((V = ka),
              (I = "onMouseLeave"),
              (x = "onMouseEnter"),
              (g = "mouse"),
              (e === "pointerout" || e === "pointerover") &&
                ((V = Sa),
                (I = "onPointerLeave"),
                (x = "onPointerEnter"),
                (g = "pointer")),
              (Me = A == null ? M : Dn(A)),
              (k = W == null ? M : Dn(W)),
              (M = new V(I, g + "leave", A, n, P)),
              (M.target = Me),
              (M.relatedTarget = k),
              (I = null),
              dn(P) === N &&
                ((V = new V(x, g + "enter", W, n, P)),
                (V.target = k),
                (V.relatedTarget = Me),
                (I = V)),
              (Me = I),
              A && W)
            )
              t: {
                for (V = A, x = W, g = 0, k = V; k; k = In(k)) g++;
                for (k = 0, I = x; I; I = In(I)) k++;
                for (; 0 < g - k; ) (V = In(V)), g--;
                for (; 0 < k - g; ) (x = In(x)), k--;
                for (; g--; ) {
                  if (V === x || (x !== null && V === x.alternate)) break t;
                  (V = In(V)), (x = In(x));
                }
                V = null;
              }
            else V = null;
            A !== null && Za(T, M, A, V, !1),
              W !== null && Me !== null && Za(T, Me, W, V, !0);
          }
        }
        e: {
          if (
            ((M = N ? Dn(N) : window),
            (A = M.nodeName && M.nodeName.toLowerCase()),
            A === "select" || (A === "input" && M.type === "file"))
          )
            var G = lp;
          else if (Ma(M))
            if (za) G = up;
            else {
              G = sp;
              var Z = ip;
            }
          else
            (A = M.nodeName) &&
              A.toLowerCase() === "input" &&
              (M.type === "checkbox" || M.type === "radio") &&
              (G = ap);
          if (G && (G = G(e, N))) {
            Pa(T, G, n, P);
            break e;
          }
          Z && Z(e, M, N),
            e === "focusout" &&
              (Z = M._wrapperState) &&
              Z.controlled &&
              M.type === "number" &&
              kl(M, "number", M.value);
        }
        switch (((Z = N ? Dn(N) : window), e)) {
          case "focusin":
            (Ma(Z) || Z.contentEditable === "true") &&
              ((Rn = Z), (Zl = N), (Sr = null));
            break;
          case "focusout":
            Sr = Zl = Rn = null;
            break;
          case "mousedown":
            Kl = !0;
            break;
          case "contextmenu":
          case "mouseup":
          case "dragend":
            (Kl = !1), Fa(T, n, P);
            break;
          case "selectionchange":
            if (fp) break;
          case "keydown":
          case "keyup":
            Fa(T, n, P);
        }
        var K;
        if (Gl)
          e: {
            switch (e) {
              case "compositionstart":
                var ne = "onCompositionStart";
                break e;
              case "compositionend":
                ne = "onCompositionEnd";
                break e;
              case "compositionupdate":
                ne = "onCompositionUpdate";
                break e;
            }
            ne = void 0;
          }
        else
          zn
            ? _a(e, n) && (ne = "onCompositionEnd")
            : e === "keydown" &&
              n.keyCode === 229 &&
              (ne = "onCompositionStart");
        ne &&
          (Ea &&
            n.locale !== "ko" &&
            (zn || ne !== "onCompositionStart"
              ? ne === "onCompositionEnd" && zn && (K = xa())
              : (($t = P),
                (Hl = "value" in $t ? $t.value : $t.textContent),
                (zn = !0))),
          (Z = go(N, ne)),
          0 < Z.length &&
            ((ne = new Na(ne, e, null, n, P)),
            T.push({ event: ne, listeners: Z }),
            K ? (ne.data = K) : ((K = ba(n)), K !== null && (ne.data = K)))),
          (K = ep ? tp(e, n) : np(e, n)) &&
            ((N = go(N, "onBeforeInput")),
            0 < N.length &&
              ((P = new Na("onBeforeInput", "beforeinput", null, n, P)),
              T.push({ event: P, listeners: N }),
              (P.data = K)));
      }
      Ya(T, t);
    });
  }
  function jr(e, t, n) {
    return { instance: e, listener: t, currentTarget: n };
  }
  function go(e, t) {
    for (var n = t + "Capture", r = []; e !== null; ) {
      var o = e,
        i = o.stateNode;
      o.tag === 5 &&
        i !== null &&
        ((o = i),
        (i = sr(e, n)),
        i != null && r.unshift(jr(e, i, o)),
        (i = sr(e, t)),
        i != null && r.push(jr(e, i, o))),
        (e = e.return);
    }
    return r;
  }
  function In(e) {
    if (e === null) return null;
    do e = e.return;
    while (e && e.tag !== 5);
    return e || null;
  }
  function Za(e, t, n, r, o) {
    for (var i = t._reactName, u = []; n !== null && n !== r; ) {
      var p = n,
        h = p.alternate,
        N = p.stateNode;
      if (h !== null && h === r) break;
      p.tag === 5 &&
        N !== null &&
        ((p = N),
        o
          ? ((h = sr(n, i)), h != null && u.unshift(jr(n, h, p)))
          : o || ((h = sr(n, i)), h != null && u.push(jr(n, h, p)))),
        (n = n.return);
    }
    u.length !== 0 && e.push({ event: t, listeners: u });
  }
  var gp = /\r\n?/g,
    vp = /\u0000|\uFFFD/g;
  function Ka(e) {
    return (typeof e == "string" ? e : "" + e)
      .replace(
        gp,
        `
`
      )
      .replace(vp, "");
  }
  function vo(e, t, n) {
    if (((t = Ka(t)), Ka(e) !== t && n)) throw Error(s(425));
  }
  function yo() {}
  var ri = null,
    oi = null;
  function li(e, t) {
    return (
      e === "textarea" ||
      e === "noscript" ||
      typeof t.children == "string" ||
      typeof t.children == "number" ||
      (typeof t.dangerouslySetInnerHTML == "object" &&
        t.dangerouslySetInnerHTML !== null &&
        t.dangerouslySetInnerHTML.__html != null)
    );
  }
  var ii = typeof setTimeout == "function" ? setTimeout : void 0,
    yp = typeof clearTimeout == "function" ? clearTimeout : void 0,
    Ja = typeof Promise == "function" ? Promise : void 0,
    xp =
      typeof queueMicrotask == "function"
        ? queueMicrotask
        : typeof Ja < "u"
        ? function (e) {
            return Ja.resolve(null).then(e).catch(wp);
          }
        : ii;
  function wp(e) {
    setTimeout(function () {
      throw e;
    });
  }
  function si(e, t) {
    var n = t,
      r = 0;
    do {
      var o = n.nextSibling;
      if ((e.removeChild(n), o && o.nodeType === 8))
        if (((n = o.data), n === "/$")) {
          if (r === 0) {
            e.removeChild(o), gr(t);
            return;
          }
          r--;
        } else (n !== "$" && n !== "$?" && n !== "$!") || r++;
      n = o;
    } while (n);
    gr(t);
  }
  function Gt(e) {
    for (; e != null; e = e.nextSibling) {
      var t = e.nodeType;
      if (t === 1 || t === 3) break;
      if (t === 8) {
        if (((t = e.data), t === "$" || t === "$!" || t === "$?")) break;
        if (t === "/$") return null;
      }
    }
    return e;
  }
  function qa(e) {
    e = e.previousSibling;
    for (var t = 0; e; ) {
      if (e.nodeType === 8) {
        var n = e.data;
        if (n === "$" || n === "$!" || n === "$?") {
          if (t === 0) return e;
          t--;
        } else n === "/$" && t++;
      }
      e = e.previousSibling;
    }
    return null;
  }
  var On = Math.random().toString(36).slice(2),
    Et = "__reactFiber$" + On,
    _r = "__reactProps$" + On,
    Mt = "__reactContainer$" + On,
    ai = "__reactEvents$" + On,
    kp = "__reactListeners$" + On,
    Np = "__reactHandles$" + On;
  function dn(e) {
    var t = e[Et];
    if (t) return t;
    for (var n = e.parentNode; n; ) {
      if ((t = n[Mt] || n[Et])) {
        if (
          ((n = t.alternate),
          t.child !== null || (n !== null && n.child !== null))
        )
          for (e = qa(e); e !== null; ) {
            if ((n = e[Et])) return n;
            e = qa(e);
          }
        return t;
      }
      (e = n), (n = e.parentNode);
    }
    return null;
  }
  function br(e) {
    return (
      (e = e[Et] || e[Mt]),
      !e || (e.tag !== 5 && e.tag !== 6 && e.tag !== 13 && e.tag !== 3)
        ? null
        : e
    );
  }
  function Dn(e) {
    if (e.tag === 5 || e.tag === 6) return e.stateNode;
    throw Error(s(33));
  }
  function xo(e) {
    return e[_r] || null;
  }
  var ui = [],
    Ln = -1;
  function Xt(e) {
    return { current: e };
  }
  function we(e) {
    0 > Ln || ((e.current = ui[Ln]), (ui[Ln] = null), Ln--);
  }
  function ye(e, t) {
    Ln++, (ui[Ln] = e.current), (e.current = t);
  }
  var Yt = {},
    Be = Xt(Yt),
    Ke = Xt(!1),
    fn = Yt;
  function An(e, t) {
    var n = e.type.contextTypes;
    if (!n) return Yt;
    var r = e.stateNode;
    if (r && r.__reactInternalMemoizedUnmaskedChildContext === t)
      return r.__reactInternalMemoizedMaskedChildContext;
    var o = {},
      i;
    for (i in n) o[i] = t[i];
    return (
      r &&
        ((e = e.stateNode),
        (e.__reactInternalMemoizedUnmaskedChildContext = t),
        (e.__reactInternalMemoizedMaskedChildContext = o)),
      o
    );
  }
  function Je(e) {
    return (e = e.childContextTypes), e != null;
  }
  function wo() {
    we(Ke), we(Be);
  }
  function eu(e, t, n) {
    if (Be.current !== Yt) throw Error(s(168));
    ye(Be, t), ye(Ke, n);
  }
  function tu(e, t, n) {
    var r = e.stateNode;
    if (((t = t.childContextTypes), typeof r.getChildContext != "function"))
      return n;
    r = r.getChildContext();
    for (var o in r) if (!(o in t)) throw Error(s(108, re(e) || "Unknown", o));
    return F({}, n, r);
  }
  function ko(e) {
    return (
      (e =
        ((e = e.stateNode) && e.__reactInternalMemoizedMergedChildContext) ||
        Yt),
      (fn = Be.current),
      ye(Be, e),
      ye(Ke, Ke.current),
      !0
    );
  }
  function nu(e, t, n) {
    var r = e.stateNode;
    if (!r) throw Error(s(169));
    n
      ? ((e = tu(e, t, fn)),
        (r.__reactInternalMemoizedMergedChildContext = e),
        we(Ke),
        we(Be),
        ye(Be, e))
      : we(Ke),
      ye(Ke, n);
  }
  var Pt = null,
    No = !1,
    ci = !1;
  function ru(e) {
    Pt === null ? (Pt = [e]) : Pt.push(e);
  }
  function Sp(e) {
    (No = !0), ru(e);
  }
  function Qt() {
    if (!ci && Pt !== null) {
      ci = !0;
      var e = 0,
        t = ve;
      try {
        var n = Pt;
        for (ve = 1; e < n.length; e++) {
          var r = n[e];
          do r = r(!0);
          while (r !== null);
        }
        (Pt = null), (No = !1);
      } catch (o) {
        throw (Pt !== null && (Pt = Pt.slice(e + 1)), la(Rl, Qt), o);
      } finally {
        (ve = t), (ci = !1);
      }
    }
    return null;
  }
  var Fn = [],
    Hn = 0,
    So = null,
    Eo = 0,
    at = [],
    ut = 0,
    pn = null,
    zt = 1,
    Rt = "";
  function mn(e, t) {
    (Fn[Hn++] = Eo), (Fn[Hn++] = So), (So = e), (Eo = t);
  }
  function ou(e, t, n) {
    (at[ut++] = zt), (at[ut++] = Rt), (at[ut++] = pn), (pn = e);
    var r = zt;
    e = Rt;
    var o = 32 - mt(r) - 1;
    (r &= ~(1 << o)), (n += 1);
    var i = 32 - mt(t) + o;
    if (30 < i) {
      var u = o - (o % 5);
      (i = (r & ((1 << u) - 1)).toString(32)),
        (r >>= u),
        (o -= u),
        (zt = (1 << (32 - mt(t) + o)) | (n << o) | r),
        (Rt = i + e);
    } else (zt = (1 << i) | (n << o) | r), (Rt = e);
  }
  function di(e) {
    e.return !== null && (mn(e, 1), ou(e, 1, 0));
  }
  function fi(e) {
    for (; e === So; )
      (So = Fn[--Hn]), (Fn[Hn] = null), (Eo = Fn[--Hn]), (Fn[Hn] = null);
    for (; e === pn; )
      (pn = at[--ut]),
        (at[ut] = null),
        (Rt = at[--ut]),
        (at[ut] = null),
        (zt = at[--ut]),
        (at[ut] = null);
  }
  var ot = null,
    lt = null,
    Se = !1,
    gt = null;
  function lu(e, t) {
    var n = pt(5, null, null, 0);
    (n.elementType = "DELETED"),
      (n.stateNode = t),
      (n.return = e),
      (t = e.deletions),
      t === null ? ((e.deletions = [n]), (e.flags |= 16)) : t.push(n);
  }
  function iu(e, t) {
    switch (e.tag) {
      case 5:
        var n = e.type;
        return (
          (t =
            t.nodeType !== 1 || n.toLowerCase() !== t.nodeName.toLowerCase()
              ? null
              : t),
          t !== null
            ? ((e.stateNode = t), (ot = e), (lt = Gt(t.firstChild)), !0)
            : !1
        );
      case 6:
        return (
          (t = e.pendingProps === "" || t.nodeType !== 3 ? null : t),
          t !== null ? ((e.stateNode = t), (ot = e), (lt = null), !0) : !1
        );
      case 13:
        return (
          (t = t.nodeType !== 8 ? null : t),
          t !== null
            ? ((n = pn !== null ? { id: zt, overflow: Rt } : null),
              (e.memoizedState = {
                dehydrated: t,
                treeContext: n,
                retryLane: 1073741824,
              }),
              (n = pt(18, null, null, 0)),
              (n.stateNode = t),
              (n.return = e),
              (e.child = n),
              (ot = e),
              (lt = null),
              !0)
            : !1
        );
      default:
        return !1;
    }
  }
  function pi(e) {
    return (e.mode & 1) !== 0 && (e.flags & 128) === 0;
  }
  function mi(e) {
    if (Se) {
      var t = lt;
      if (t) {
        var n = t;
        if (!iu(e, t)) {
          if (pi(e)) throw Error(s(418));
          t = Gt(n.nextSibling);
          var r = ot;
          t && iu(e, t)
            ? lu(r, n)
            : ((e.flags = (e.flags & -4097) | 2), (Se = !1), (ot = e));
        }
      } else {
        if (pi(e)) throw Error(s(418));
        (e.flags = (e.flags & -4097) | 2), (Se = !1), (ot = e);
      }
    }
  }
  function su(e) {
    for (
      e = e.return;
      e !== null && e.tag !== 5 && e.tag !== 3 && e.tag !== 13;

    )
      e = e.return;
    ot = e;
  }
  function Co(e) {
    if (e !== ot) return !1;
    if (!Se) return su(e), (Se = !0), !1;
    var t;
    if (
      ((t = e.tag !== 3) &&
        !(t = e.tag !== 5) &&
        ((t = e.type),
        (t = t !== "head" && t !== "body" && !li(e.type, e.memoizedProps))),
      t && (t = lt))
    ) {
      if (pi(e)) throw (au(), Error(s(418)));
      for (; t; ) lu(e, t), (t = Gt(t.nextSibling));
    }
    if ((su(e), e.tag === 13)) {
      if (((e = e.memoizedState), (e = e !== null ? e.dehydrated : null), !e))
        throw Error(s(317));
      e: {
        for (e = e.nextSibling, t = 0; e; ) {
          if (e.nodeType === 8) {
            var n = e.data;
            if (n === "/$") {
              if (t === 0) {
                lt = Gt(e.nextSibling);
                break e;
              }
              t--;
            } else (n !== "$" && n !== "$!" && n !== "$?") || t++;
          }
          e = e.nextSibling;
        }
        lt = null;
      }
    } else lt = ot ? Gt(e.stateNode.nextSibling) : null;
    return !0;
  }
  function au() {
    for (var e = lt; e; ) e = Gt(e.nextSibling);
  }
  function Un() {
    (lt = ot = null), (Se = !1);
  }
  function hi(e) {
    gt === null ? (gt = [e]) : gt.push(e);
  }
  var Ep = te.ReactCurrentBatchConfig;
  function Mr(e, t, n) {
    if (
      ((e = n.ref),
      e !== null && typeof e != "function" && typeof e != "object")
    ) {
      if (n._owner) {
        if (((n = n._owner), n)) {
          if (n.tag !== 1) throw Error(s(309));
          var r = n.stateNode;
        }
        if (!r) throw Error(s(147, e));
        var o = r,
          i = "" + e;
        return t !== null &&
          t.ref !== null &&
          typeof t.ref == "function" &&
          t.ref._stringRef === i
          ? t.ref
          : ((t = function (u) {
              var p = o.refs;
              u === null ? delete p[i] : (p[i] = u);
            }),
            (t._stringRef = i),
            t);
      }
      if (typeof e != "string") throw Error(s(284));
      if (!n._owner) throw Error(s(290, e));
    }
    return e;
  }
  function jo(e, t) {
    throw (
      ((e = Object.prototype.toString.call(t)),
      Error(
        s(
          31,
          e === "[object Object]"
            ? "object with keys {" + Object.keys(t).join(", ") + "}"
            : e
        )
      ))
    );
  }
  function uu(e) {
    var t = e._init;
    return t(e._payload);
  }
  function cu(e) {
    function t(x, g) {
      if (e) {
        var k = x.deletions;
        k === null ? ((x.deletions = [g]), (x.flags |= 16)) : k.push(g);
      }
    }
    function n(x, g) {
      if (!e) return null;
      for (; g !== null; ) t(x, g), (g = g.sibling);
      return null;
    }
    function r(x, g) {
      for (x = new Map(); g !== null; )
        g.key !== null ? x.set(g.key, g) : x.set(g.index, g), (g = g.sibling);
      return x;
    }
    function o(x, g) {
      return (x = rn(x, g)), (x.index = 0), (x.sibling = null), x;
    }
    function i(x, g, k) {
      return (
        (x.index = k),
        e
          ? ((k = x.alternate),
            k !== null
              ? ((k = k.index), k < g ? ((x.flags |= 2), g) : k)
              : ((x.flags |= 2), g))
          : ((x.flags |= 1048576), g)
      );
    }
    function u(x) {
      return e && x.alternate === null && (x.flags |= 2), x;
    }
    function p(x, g, k, I) {
      return g === null || g.tag !== 6
        ? ((g = is(k, x.mode, I)), (g.return = x), g)
        : ((g = o(g, k)), (g.return = x), g);
    }
    function h(x, g, k, I) {
      var G = k.type;
      return G === ee
        ? P(x, g, k.props.children, I, k.key)
        : g !== null &&
          (g.elementType === G ||
            (typeof G == "object" &&
              G !== null &&
              G.$$typeof === Ne &&
              uu(G) === g.type))
        ? ((I = o(g, k.props)), (I.ref = Mr(x, g, k)), (I.return = x), I)
        : ((I = Zo(k.type, k.key, k.props, null, x.mode, I)),
          (I.ref = Mr(x, g, k)),
          (I.return = x),
          I);
    }
    function N(x, g, k, I) {
      return g === null ||
        g.tag !== 4 ||
        g.stateNode.containerInfo !== k.containerInfo ||
        g.stateNode.implementation !== k.implementation
        ? ((g = ss(k, x.mode, I)), (g.return = x), g)
        : ((g = o(g, k.children || [])), (g.return = x), g);
    }
    function P(x, g, k, I, G) {
      return g === null || g.tag !== 7
        ? ((g = Nn(k, x.mode, I, G)), (g.return = x), g)
        : ((g = o(g, k)), (g.return = x), g);
    }
    function T(x, g, k) {
      if ((typeof g == "string" && g !== "") || typeof g == "number")
        return (g = is("" + g, x.mode, k)), (g.return = x), g;
      if (typeof g == "object" && g !== null) {
        switch (g.$$typeof) {
          case se:
            return (
              (k = Zo(g.type, g.key, g.props, null, x.mode, k)),
              (k.ref = Mr(x, null, g)),
              (k.return = x),
              k
            );
          case de:
            return (g = ss(g, x.mode, k)), (g.return = x), g;
          case Ne:
            var I = g._init;
            return T(x, I(g._payload), k);
        }
        if (or(g) || Q(g))
          return (g = Nn(g, x.mode, k, null)), (g.return = x), g;
        jo(x, g);
      }
      return null;
    }
    function M(x, g, k, I) {
      var G = g !== null ? g.key : null;
      if ((typeof k == "string" && k !== "") || typeof k == "number")
        return G !== null ? null : p(x, g, "" + k, I);
      if (typeof k == "object" && k !== null) {
        switch (k.$$typeof) {
          case se:
            return k.key === G ? h(x, g, k, I) : null;
          case de:
            return k.key === G ? N(x, g, k, I) : null;
          case Ne:
            return (G = k._init), M(x, g, G(k._payload), I);
        }
        if (or(k) || Q(k)) return G !== null ? null : P(x, g, k, I, null);
        jo(x, k);
      }
      return null;
    }
    function A(x, g, k, I, G) {
      if ((typeof I == "string" && I !== "") || typeof I == "number")
        return (x = x.get(k) || null), p(g, x, "" + I, G);
      if (typeof I == "object" && I !== null) {
        switch (I.$$typeof) {
          case se:
            return (
              (x = x.get(I.key === null ? k : I.key) || null), h(g, x, I, G)
            );
          case de:
            return (
              (x = x.get(I.key === null ? k : I.key) || null), N(g, x, I, G)
            );
          case Ne:
            var Z = I._init;
            return A(x, g, k, Z(I._payload), G);
        }
        if (or(I) || Q(I)) return (x = x.get(k) || null), P(g, x, I, G, null);
        jo(g, I);
      }
      return null;
    }
    function W(x, g, k, I) {
      for (
        var G = null, Z = null, K = g, ne = (g = 0), Le = null;
        K !== null && ne < k.length;
        ne++
      ) {
        K.index > ne ? ((Le = K), (K = null)) : (Le = K.sibling);
        var me = M(x, K, k[ne], I);
        if (me === null) {
          K === null && (K = Le);
          break;
        }
        e && K && me.alternate === null && t(x, K),
          (g = i(me, g, ne)),
          Z === null ? (G = me) : (Z.sibling = me),
          (Z = me),
          (K = Le);
      }
      if (ne === k.length) return n(x, K), Se && mn(x, ne), G;
      if (K === null) {
        for (; ne < k.length; ne++)
          (K = T(x, k[ne], I)),
            K !== null &&
              ((g = i(K, g, ne)),
              Z === null ? (G = K) : (Z.sibling = K),
              (Z = K));
        return Se && mn(x, ne), G;
      }
      for (K = r(x, K); ne < k.length; ne++)
        (Le = A(K, x, ne, k[ne], I)),
          Le !== null &&
            (e &&
              Le.alternate !== null &&
              K.delete(Le.key === null ? ne : Le.key),
            (g = i(Le, g, ne)),
            Z === null ? (G = Le) : (Z.sibling = Le),
            (Z = Le));
      return (
        e &&
          K.forEach(function (on) {
            return t(x, on);
          }),
        Se && mn(x, ne),
        G
      );
    }
    function V(x, g, k, I) {
      var G = Q(k);
      if (typeof G != "function") throw Error(s(150));
      if (((k = G.call(k)), k == null)) throw Error(s(151));
      for (
        var Z = (G = null), K = g, ne = (g = 0), Le = null, me = k.next();
        K !== null && !me.done;
        ne++, me = k.next()
      ) {
        K.index > ne ? ((Le = K), (K = null)) : (Le = K.sibling);
        var on = M(x, K, me.value, I);
        if (on === null) {
          K === null && (K = Le);
          break;
        }
        e && K && on.alternate === null && t(x, K),
          (g = i(on, g, ne)),
          Z === null ? (G = on) : (Z.sibling = on),
          (Z = on),
          (K = Le);
      }
      if (me.done) return n(x, K), Se && mn(x, ne), G;
      if (K === null) {
        for (; !me.done; ne++, me = k.next())
          (me = T(x, me.value, I)),
            me !== null &&
              ((g = i(me, g, ne)),
              Z === null ? (G = me) : (Z.sibling = me),
              (Z = me));
        return Se && mn(x, ne), G;
      }
      for (K = r(x, K); !me.done; ne++, me = k.next())
        (me = A(K, x, ne, me.value, I)),
          me !== null &&
            (e &&
              me.alternate !== null &&
              K.delete(me.key === null ? ne : me.key),
            (g = i(me, g, ne)),
            Z === null ? (G = me) : (Z.sibling = me),
            (Z = me));
      return (
        e &&
          K.forEach(function (rm) {
            return t(x, rm);
          }),
        Se && mn(x, ne),
        G
      );
    }
    function Me(x, g, k, I) {
      if (
        (typeof k == "object" &&
          k !== null &&
          k.type === ee &&
          k.key === null &&
          (k = k.props.children),
        typeof k == "object" && k !== null)
      ) {
        switch (k.$$typeof) {
          case se:
            e: {
              for (var G = k.key, Z = g; Z !== null; ) {
                if (Z.key === G) {
                  if (((G = k.type), G === ee)) {
                    if (Z.tag === 7) {
                      n(x, Z.sibling),
                        (g = o(Z, k.props.children)),
                        (g.return = x),
                        (x = g);
                      break e;
                    }
                  } else if (
                    Z.elementType === G ||
                    (typeof G == "object" &&
                      G !== null &&
                      G.$$typeof === Ne &&
                      uu(G) === Z.type)
                  ) {
                    n(x, Z.sibling),
                      (g = o(Z, k.props)),
                      (g.ref = Mr(x, Z, k)),
                      (g.return = x),
                      (x = g);
                    break e;
                  }
                  n(x, Z);
                  break;
                } else t(x, Z);
                Z = Z.sibling;
              }
              k.type === ee
                ? ((g = Nn(k.props.children, x.mode, I, k.key)),
                  (g.return = x),
                  (x = g))
                : ((I = Zo(k.type, k.key, k.props, null, x.mode, I)),
                  (I.ref = Mr(x, g, k)),
                  (I.return = x),
                  (x = I));
            }
            return u(x);
          case de:
            e: {
              for (Z = k.key; g !== null; ) {
                if (g.key === Z)
                  if (
                    g.tag === 4 &&
                    g.stateNode.containerInfo === k.containerInfo &&
                    g.stateNode.implementation === k.implementation
                  ) {
                    n(x, g.sibling),
                      (g = o(g, k.children || [])),
                      (g.return = x),
                      (x = g);
                    break e;
                  } else {
                    n(x, g);
                    break;
                  }
                else t(x, g);
                g = g.sibling;
              }
              (g = ss(k, x.mode, I)), (g.return = x), (x = g);
            }
            return u(x);
          case Ne:
            return (Z = k._init), Me(x, g, Z(k._payload), I);
        }
        if (or(k)) return W(x, g, k, I);
        if (Q(k)) return V(x, g, k, I);
        jo(x, k);
      }
      return (typeof k == "string" && k !== "") || typeof k == "number"
        ? ((k = "" + k),
          g !== null && g.tag === 6
            ? (n(x, g.sibling), (g = o(g, k)), (g.return = x), (x = g))
            : (n(x, g), (g = is(k, x.mode, I)), (g.return = x), (x = g)),
          u(x))
        : n(x, g);
    }
    return Me;
  }
  var Wn = cu(!0),
    du = cu(!1),
    _o = Xt(null),
    bo = null,
    Bn = null,
    gi = null;
  function vi() {
    gi = Bn = bo = null;
  }
  function yi(e) {
    var t = _o.current;
    we(_o), (e._currentValue = t);
  }
  function xi(e, t, n) {
    for (; e !== null; ) {
      var r = e.alternate;
      if (
        ((e.childLanes & t) !== t
          ? ((e.childLanes |= t), r !== null && (r.childLanes |= t))
          : r !== null && (r.childLanes & t) !== t && (r.childLanes |= t),
        e === n)
      )
        break;
      e = e.return;
    }
  }
  function $n(e, t) {
    (bo = e),
      (gi = Bn = null),
      (e = e.dependencies),
      e !== null &&
        e.firstContext !== null &&
        ((e.lanes & t) !== 0 && (qe = !0), (e.firstContext = null));
  }
  function ct(e) {
    var t = e._currentValue;
    if (gi !== e)
      if (((e = { context: e, memoizedValue: t, next: null }), Bn === null)) {
        if (bo === null) throw Error(s(308));
        (Bn = e), (bo.dependencies = { lanes: 0, firstContext: e });
      } else Bn = Bn.next = e;
    return t;
  }
  var hn = null;
  function wi(e) {
    hn === null ? (hn = [e]) : hn.push(e);
  }
  function fu(e, t, n, r) {
    var o = t.interleaved;
    return (
      o === null ? ((n.next = n), wi(t)) : ((n.next = o.next), (o.next = n)),
      (t.interleaved = n),
      Tt(e, r)
    );
  }
  function Tt(e, t) {
    e.lanes |= t;
    var n = e.alternate;
    for (n !== null && (n.lanes |= t), n = e, e = e.return; e !== null; )
      (e.childLanes |= t),
        (n = e.alternate),
        n !== null && (n.childLanes |= t),
        (n = e),
        (e = e.return);
    return n.tag === 3 ? n.stateNode : null;
  }
  var Zt = !1;
  function ki(e) {
    e.updateQueue = {
      baseState: e.memoizedState,
      firstBaseUpdate: null,
      lastBaseUpdate: null,
      shared: { pending: null, interleaved: null, lanes: 0 },
      effects: null,
    };
  }
  function pu(e, t) {
    (e = e.updateQueue),
      t.updateQueue === e &&
        (t.updateQueue = {
          baseState: e.baseState,
          firstBaseUpdate: e.firstBaseUpdate,
          lastBaseUpdate: e.lastBaseUpdate,
          shared: e.shared,
          effects: e.effects,
        });
  }
  function It(e, t) {
    return {
      eventTime: e,
      lane: t,
      tag: 0,
      payload: null,
      callback: null,
      next: null,
    };
  }
  function Kt(e, t, n) {
    var r = e.updateQueue;
    if (r === null) return null;
    if (((r = r.shared), (fe & 2) !== 0)) {
      var o = r.pending;
      return (
        o === null ? (t.next = t) : ((t.next = o.next), (o.next = t)),
        (r.pending = t),
        Tt(e, n)
      );
    }
    return (
      (o = r.interleaved),
      o === null ? ((t.next = t), wi(r)) : ((t.next = o.next), (o.next = t)),
      (r.interleaved = t),
      Tt(e, n)
    );
  }
  function Mo(e, t, n) {
    if (
      ((t = t.updateQueue), t !== null && ((t = t.shared), (n & 4194240) !== 0))
    ) {
      var r = t.lanes;
      (r &= e.pendingLanes), (n |= r), (t.lanes = n), Ol(e, n);
    }
  }
  function mu(e, t) {
    var n = e.updateQueue,
      r = e.alternate;
    if (r !== null && ((r = r.updateQueue), n === r)) {
      var o = null,
        i = null;
      if (((n = n.firstBaseUpdate), n !== null)) {
        do {
          var u = {
            eventTime: n.eventTime,
            lane: n.lane,
            tag: n.tag,
            payload: n.payload,
            callback: n.callback,
            next: null,
          };
          i === null ? (o = i = u) : (i = i.next = u), (n = n.next);
        } while (n !== null);
        i === null ? (o = i = t) : (i = i.next = t);
      } else o = i = t;
      (n = {
        baseState: r.baseState,
        firstBaseUpdate: o,
        lastBaseUpdate: i,
        shared: r.shared,
        effects: r.effects,
      }),
        (e.updateQueue = n);
      return;
    }
    (e = n.lastBaseUpdate),
      e === null ? (n.firstBaseUpdate = t) : (e.next = t),
      (n.lastBaseUpdate = t);
  }
  function Po(e, t, n, r) {
    var o = e.updateQueue;
    Zt = !1;
    var i = o.firstBaseUpdate,
      u = o.lastBaseUpdate,
      p = o.shared.pending;
    if (p !== null) {
      o.shared.pending = null;
      var h = p,
        N = h.next;
      (h.next = null), u === null ? (i = N) : (u.next = N), (u = h);
      var P = e.alternate;
      P !== null &&
        ((P = P.updateQueue),
        (p = P.lastBaseUpdate),
        p !== u &&
          (p === null ? (P.firstBaseUpdate = N) : (p.next = N),
          (P.lastBaseUpdate = h)));
    }
    if (i !== null) {
      var T = o.baseState;
      (u = 0), (P = N = h = null), (p = i);
      do {
        var M = p.lane,
          A = p.eventTime;
        if ((r & M) === M) {
          P !== null &&
            (P = P.next =
              {
                eventTime: A,
                lane: 0,
                tag: p.tag,
                payload: p.payload,
                callback: p.callback,
                next: null,
              });
          e: {
            var W = e,
              V = p;
            switch (((M = t), (A = n), V.tag)) {
              case 1:
                if (((W = V.payload), typeof W == "function")) {
                  T = W.call(A, T, M);
                  break e;
                }
                T = W;
                break e;
              case 3:
                W.flags = (W.flags & -65537) | 128;
              case 0:
                if (
                  ((W = V.payload),
                  (M = typeof W == "function" ? W.call(A, T, M) : W),
                  M == null)
                )
                  break e;
                T = F({}, T, M);
                break e;
              case 2:
                Zt = !0;
            }
          }
          p.callback !== null &&
            p.lane !== 0 &&
            ((e.flags |= 64),
            (M = o.effects),
            M === null ? (o.effects = [p]) : M.push(p));
        } else
          (A = {
            eventTime: A,
            lane: M,
            tag: p.tag,
            payload: p.payload,
            callback: p.callback,
            next: null,
          }),
            P === null ? ((N = P = A), (h = T)) : (P = P.next = A),
            (u |= M);
        if (((p = p.next), p === null)) {
          if (((p = o.shared.pending), p === null)) break;
          (M = p),
            (p = M.next),
            (M.next = null),
            (o.lastBaseUpdate = M),
            (o.shared.pending = null);
        }
      } while (!0);
      if (
        (P === null && (h = T),
        (o.baseState = h),
        (o.firstBaseUpdate = N),
        (o.lastBaseUpdate = P),
        (t = o.shared.interleaved),
        t !== null)
      ) {
        o = t;
        do (u |= o.lane), (o = o.next);
        while (o !== t);
      } else i === null && (o.shared.lanes = 0);
      (yn |= u), (e.lanes = u), (e.memoizedState = T);
    }
  }
  function hu(e, t, n) {
    if (((e = t.effects), (t.effects = null), e !== null))
      for (t = 0; t < e.length; t++) {
        var r = e[t],
          o = r.callback;
        if (o !== null) {
          if (((r.callback = null), (r = n), typeof o != "function"))
            throw Error(s(191, o));
          o.call(r);
        }
      }
  }
  var Pr = {},
    Ct = Xt(Pr),
    zr = Xt(Pr),
    Rr = Xt(Pr);
  function gn(e) {
    if (e === Pr) throw Error(s(174));
    return e;
  }
  function Ni(e, t) {
    switch ((ye(Rr, t), ye(zr, e), ye(Ct, Pr), (e = t.nodeType), e)) {
      case 9:
      case 11:
        t = (t = t.documentElement) ? t.namespaceURI : Sl(null, "");
        break;
      default:
        (e = e === 8 ? t.parentNode : t),
          (t = e.namespaceURI || null),
          (e = e.tagName),
          (t = Sl(t, e));
    }
    we(Ct), ye(Ct, t);
  }
  function Vn() {
    we(Ct), we(zr), we(Rr);
  }
  function gu(e) {
    gn(Rr.current);
    var t = gn(Ct.current),
      n = Sl(t, e.type);
    t !== n && (ye(zr, e), ye(Ct, n));
  }
  function Si(e) {
    zr.current === e && (we(Ct), we(zr));
  }
  var Ce = Xt(0);
  function zo(e) {
    for (var t = e; t !== null; ) {
      if (t.tag === 13) {
        var n = t.memoizedState;
        if (
          n !== null &&
          ((n = n.dehydrated), n === null || n.data === "$?" || n.data === "$!")
        )
          return t;
      } else if (t.tag === 19 && t.memoizedProps.revealOrder !== void 0) {
        if ((t.flags & 128) !== 0) return t;
      } else if (t.child !== null) {
        (t.child.return = t), (t = t.child);
        continue;
      }
      if (t === e) break;
      for (; t.sibling === null; ) {
        if (t.return === null || t.return === e) return null;
        t = t.return;
      }
      (t.sibling.return = t.return), (t = t.sibling);
    }
    return null;
  }
  var Ei = [];
  function Ci() {
    for (var e = 0; e < Ei.length; e++)
      Ei[e]._workInProgressVersionPrimary = null;
    Ei.length = 0;
  }
  var Ro = te.ReactCurrentDispatcher,
    ji = te.ReactCurrentBatchConfig,
    vn = 0,
    je = null,
    ze = null,
    Oe = null,
    To = !1,
    Tr = !1,
    Ir = 0,
    Cp = 0;
  function $e() {
    throw Error(s(321));
  }
  function _i(e, t) {
    if (t === null) return !1;
    for (var n = 0; n < t.length && n < e.length; n++)
      if (!ht(e[n], t[n])) return !1;
    return !0;
  }
  function bi(e, t, n, r, o, i) {
    if (
      ((vn = i),
      (je = t),
      (t.memoizedState = null),
      (t.updateQueue = null),
      (t.lanes = 0),
      (Ro.current = e === null || e.memoizedState === null ? Mp : Pp),
      (e = n(r, o)),
      Tr)
    ) {
      i = 0;
      do {
        if (((Tr = !1), (Ir = 0), 25 <= i)) throw Error(s(301));
        (i += 1),
          (Oe = ze = null),
          (t.updateQueue = null),
          (Ro.current = zp),
          (e = n(r, o));
      } while (Tr);
    }
    if (
      ((Ro.current = Do),
      (t = ze !== null && ze.next !== null),
      (vn = 0),
      (Oe = ze = je = null),
      (To = !1),
      t)
    )
      throw Error(s(300));
    return e;
  }
  function Mi() {
    var e = Ir !== 0;
    return (Ir = 0), e;
  }
  function jt() {
    var e = {
      memoizedState: null,
      baseState: null,
      baseQueue: null,
      queue: null,
      next: null,
    };
    return Oe === null ? (je.memoizedState = Oe = e) : (Oe = Oe.next = e), Oe;
  }
  function dt() {
    if (ze === null) {
      var e = je.alternate;
      e = e !== null ? e.memoizedState : null;
    } else e = ze.next;
    var t = Oe === null ? je.memoizedState : Oe.next;
    if (t !== null) (Oe = t), (ze = e);
    else {
      if (e === null) throw Error(s(310));
      (ze = e),
        (e = {
          memoizedState: ze.memoizedState,
          baseState: ze.baseState,
          baseQueue: ze.baseQueue,
          queue: ze.queue,
          next: null,
        }),
        Oe === null ? (je.memoizedState = Oe = e) : (Oe = Oe.next = e);
    }
    return Oe;
  }
  function Or(e, t) {
    return typeof t == "function" ? t(e) : t;
  }
  function Pi(e) {
    var t = dt(),
      n = t.queue;
    if (n === null) throw Error(s(311));
    n.lastRenderedReducer = e;
    var r = ze,
      o = r.baseQueue,
      i = n.pending;
    if (i !== null) {
      if (o !== null) {
        var u = o.next;
        (o.next = i.next), (i.next = u);
      }
      (r.baseQueue = o = i), (n.pending = null);
    }
    if (o !== null) {
      (i = o.next), (r = r.baseState);
      var p = (u = null),
        h = null,
        N = i;
      do {
        var P = N.lane;
        if ((vn & P) === P)
          h !== null &&
            (h = h.next =
              {
                lane: 0,
                action: N.action,
                hasEagerState: N.hasEagerState,
                eagerState: N.eagerState,
                next: null,
              }),
            (r = N.hasEagerState ? N.eagerState : e(r, N.action));
        else {
          var T = {
            lane: P,
            action: N.action,
            hasEagerState: N.hasEagerState,
            eagerState: N.eagerState,
            next: null,
          };
          h === null ? ((p = h = T), (u = r)) : (h = h.next = T),
            (je.lanes |= P),
            (yn |= P);
        }
        N = N.next;
      } while (N !== null && N !== i);
      h === null ? (u = r) : (h.next = p),
        ht(r, t.memoizedState) || (qe = !0),
        (t.memoizedState = r),
        (t.baseState = u),
        (t.baseQueue = h),
        (n.lastRenderedState = r);
    }
    if (((e = n.interleaved), e !== null)) {
      o = e;
      do (i = o.lane), (je.lanes |= i), (yn |= i), (o = o.next);
      while (o !== e);
    } else o === null && (n.lanes = 0);
    return [t.memoizedState, n.dispatch];
  }
  function zi(e) {
    var t = dt(),
      n = t.queue;
    if (n === null) throw Error(s(311));
    n.lastRenderedReducer = e;
    var r = n.dispatch,
      o = n.pending,
      i = t.memoizedState;
    if (o !== null) {
      n.pending = null;
      var u = (o = o.next);
      do (i = e(i, u.action)), (u = u.next);
      while (u !== o);
      ht(i, t.memoizedState) || (qe = !0),
        (t.memoizedState = i),
        t.baseQueue === null && (t.baseState = i),
        (n.lastRenderedState = i);
    }
    return [i, r];
  }
  function vu() {}
  function yu(e, t) {
    var n = je,
      r = dt(),
      o = t(),
      i = !ht(r.memoizedState, o);
    if (
      (i && ((r.memoizedState = o), (qe = !0)),
      (r = r.queue),
      Ri(ku.bind(null, n, r, e), [e]),
      r.getSnapshot !== t || i || (Oe !== null && Oe.memoizedState.tag & 1))
    ) {
      if (
        ((n.flags |= 2048),
        Dr(9, wu.bind(null, n, r, o, t), void 0, null),
        De === null)
      )
        throw Error(s(349));
      (vn & 30) !== 0 || xu(n, t, o);
    }
    return o;
  }
  function xu(e, t, n) {
    (e.flags |= 16384),
      (e = { getSnapshot: t, value: n }),
      (t = je.updateQueue),
      t === null
        ? ((t = { lastEffect: null, stores: null }),
          (je.updateQueue = t),
          (t.stores = [e]))
        : ((n = t.stores), n === null ? (t.stores = [e]) : n.push(e));
  }
  function wu(e, t, n, r) {
    (t.value = n), (t.getSnapshot = r), Nu(t) && Su(e);
  }
  function ku(e, t, n) {
    return n(function () {
      Nu(t) && Su(e);
    });
  }
  function Nu(e) {
    var t = e.getSnapshot;
    e = e.value;
    try {
      var n = t();
      return !ht(e, n);
    } catch {
      return !0;
    }
  }
  function Su(e) {
    var t = Tt(e, 1);
    t !== null && wt(t, e, 1, -1);
  }
  function Eu(e) {
    var t = jt();
    return (
      typeof e == "function" && (e = e()),
      (t.memoizedState = t.baseState = e),
      (e = {
        pending: null,
        interleaved: null,
        lanes: 0,
        dispatch: null,
        lastRenderedReducer: Or,
        lastRenderedState: e,
      }),
      (t.queue = e),
      (e = e.dispatch = bp.bind(null, je, e)),
      [t.memoizedState, e]
    );
  }
  function Dr(e, t, n, r) {
    return (
      (e = { tag: e, create: t, destroy: n, deps: r, next: null }),
      (t = je.updateQueue),
      t === null
        ? ((t = { lastEffect: null, stores: null }),
          (je.updateQueue = t),
          (t.lastEffect = e.next = e))
        : ((n = t.lastEffect),
          n === null
            ? (t.lastEffect = e.next = e)
            : ((r = n.next), (n.next = e), (e.next = r), (t.lastEffect = e))),
      e
    );
  }
  function Cu() {
    return dt().memoizedState;
  }
  function Io(e, t, n, r) {
    var o = jt();
    (je.flags |= e),
      (o.memoizedState = Dr(1 | t, n, void 0, r === void 0 ? null : r));
  }
  function Oo(e, t, n, r) {
    var o = dt();
    r = r === void 0 ? null : r;
    var i = void 0;
    if (ze !== null) {
      var u = ze.memoizedState;
      if (((i = u.destroy), r !== null && _i(r, u.deps))) {
        o.memoizedState = Dr(t, n, i, r);
        return;
      }
    }
    (je.flags |= e), (o.memoizedState = Dr(1 | t, n, i, r));
  }
  function ju(e, t) {
    return Io(8390656, 8, e, t);
  }
  function Ri(e, t) {
    return Oo(2048, 8, e, t);
  }
  function _u(e, t) {
    return Oo(4, 2, e, t);
  }
  function bu(e, t) {
    return Oo(4, 4, e, t);
  }
  function Mu(e, t) {
    if (typeof t == "function")
      return (
        (e = e()),
        t(e),
        function () {
          t(null);
        }
      );
    if (t != null)
      return (
        (e = e()),
        (t.current = e),
        function () {
          t.current = null;
        }
      );
  }
  function Pu(e, t, n) {
    return (
      (n = n != null ? n.concat([e]) : null), Oo(4, 4, Mu.bind(null, t, e), n)
    );
  }
  function Ti() {}
  function zu(e, t) {
    var n = dt();
    t = t === void 0 ? null : t;
    var r = n.memoizedState;
    return r !== null && t !== null && _i(t, r[1])
      ? r[0]
      : ((n.memoizedState = [e, t]), e);
  }
  function Ru(e, t) {
    var n = dt();
    t = t === void 0 ? null : t;
    var r = n.memoizedState;
    return r !== null && t !== null && _i(t, r[1])
      ? r[0]
      : ((e = e()), (n.memoizedState = [e, t]), e);
  }
  function Tu(e, t, n) {
    return (vn & 21) === 0
      ? (e.baseState && ((e.baseState = !1), (qe = !0)), (e.memoizedState = n))
      : (ht(n, t) ||
          ((n = ua()), (je.lanes |= n), (yn |= n), (e.baseState = !0)),
        t);
  }
  function jp(e, t) {
    var n = ve;
    (ve = n !== 0 && 4 > n ? n : 4), e(!0);
    var r = ji.transition;
    ji.transition = {};
    try {
      e(!1), t();
    } finally {
      (ve = n), (ji.transition = r);
    }
  }
  function Iu() {
    return dt().memoizedState;
  }
  function _p(e, t, n) {
    var r = tn(e);
    if (
      ((n = {
        lane: r,
        action: n,
        hasEagerState: !1,
        eagerState: null,
        next: null,
      }),
      Ou(e))
    )
      Du(t, n);
    else if (((n = fu(e, t, n, r)), n !== null)) {
      var o = Ze();
      wt(n, e, r, o), Lu(n, t, r);
    }
  }
  function bp(e, t, n) {
    var r = tn(e),
      o = {
        lane: r,
        action: n,
        hasEagerState: !1,
        eagerState: null,
        next: null,
      };
    if (Ou(e)) Du(t, o);
    else {
      var i = e.alternate;
      if (
        e.lanes === 0 &&
        (i === null || i.lanes === 0) &&
        ((i = t.lastRenderedReducer), i !== null)
      )
        try {
          var u = t.lastRenderedState,
            p = i(u, n);
          if (((o.hasEagerState = !0), (o.eagerState = p), ht(p, u))) {
            var h = t.interleaved;
            h === null
              ? ((o.next = o), wi(t))
              : ((o.next = h.next), (h.next = o)),
              (t.interleaved = o);
            return;
          }
        } catch {
        } finally {
        }
      (n = fu(e, t, o, r)),
        n !== null && ((o = Ze()), wt(n, e, r, o), Lu(n, t, r));
    }
  }
  function Ou(e) {
    var t = e.alternate;
    return e === je || (t !== null && t === je);
  }
  function Du(e, t) {
    Tr = To = !0;
    var n = e.pending;
    n === null ? (t.next = t) : ((t.next = n.next), (n.next = t)),
      (e.pending = t);
  }
  function Lu(e, t, n) {
    if ((n & 4194240) !== 0) {
      var r = t.lanes;
      (r &= e.pendingLanes), (n |= r), (t.lanes = n), Ol(e, n);
    }
  }
  var Do = {
      readContext: ct,
      useCallback: $e,
      useContext: $e,
      useEffect: $e,
      useImperativeHandle: $e,
      useInsertionEffect: $e,
      useLayoutEffect: $e,
      useMemo: $e,
      useReducer: $e,
      useRef: $e,
      useState: $e,
      useDebugValue: $e,
      useDeferredValue: $e,
      useTransition: $e,
      useMutableSource: $e,
      useSyncExternalStore: $e,
      useId: $e,
      unstable_isNewReconciler: !1,
    },
    Mp = {
      readContext: ct,
      useCallback: function (e, t) {
        return (jt().memoizedState = [e, t === void 0 ? null : t]), e;
      },
      useContext: ct,
      useEffect: ju,
      useImperativeHandle: function (e, t, n) {
        return (
          (n = n != null ? n.concat([e]) : null),
          Io(4194308, 4, Mu.bind(null, t, e), n)
        );
      },
      useLayoutEffect: function (e, t) {
        return Io(4194308, 4, e, t);
      },
      useInsertionEffect: function (e, t) {
        return Io(4, 2, e, t);
      },
      useMemo: function (e, t) {
        var n = jt();
        return (
          (t = t === void 0 ? null : t),
          (e = e()),
          (n.memoizedState = [e, t]),
          e
        );
      },
      useReducer: function (e, t, n) {
        var r = jt();
        return (
          (t = n !== void 0 ? n(t) : t),
          (r.memoizedState = r.baseState = t),
          (e = {
            pending: null,
            interleaved: null,
            lanes: 0,
            dispatch: null,
            lastRenderedReducer: e,
            lastRenderedState: t,
          }),
          (r.queue = e),
          (e = e.dispatch = _p.bind(null, je, e)),
          [r.memoizedState, e]
        );
      },
      useRef: function (e) {
        var t = jt();
        return (e = { current: e }), (t.memoizedState = e);
      },
      useState: Eu,
      useDebugValue: Ti,
      useDeferredValue: function (e) {
        return (jt().memoizedState = e);
      },
      useTransition: function () {
        var e = Eu(!1),
          t = e[0];
        return (e = jp.bind(null, e[1])), (jt().memoizedState = e), [t, e];
      },
      useMutableSource: function () {},
      useSyncExternalStore: function (e, t, n) {
        var r = je,
          o = jt();
        if (Se) {
          if (n === void 0) throw Error(s(407));
          n = n();
        } else {
          if (((n = t()), De === null)) throw Error(s(349));
          (vn & 30) !== 0 || xu(r, t, n);
        }
        o.memoizedState = n;
        var i = { value: n, getSnapshot: t };
        return (
          (o.queue = i),
          ju(ku.bind(null, r, i, e), [e]),
          (r.flags |= 2048),
          Dr(9, wu.bind(null, r, i, n, t), void 0, null),
          n
        );
      },
      useId: function () {
        var e = jt(),
          t = De.identifierPrefix;
        if (Se) {
          var n = Rt,
            r = zt;
          (n = (r & ~(1 << (32 - mt(r) - 1))).toString(32) + n),
            (t = ":" + t + "R" + n),
            (n = Ir++),
            0 < n && (t += "H" + n.toString(32)),
            (t += ":");
        } else (n = Cp++), (t = ":" + t + "r" + n.toString(32) + ":");
        return (e.memoizedState = t);
      },
      unstable_isNewReconciler: !1,
    },
    Pp = {
      readContext: ct,
      useCallback: zu,
      useContext: ct,
      useEffect: Ri,
      useImperativeHandle: Pu,
      useInsertionEffect: _u,
      useLayoutEffect: bu,
      useMemo: Ru,
      useReducer: Pi,
      useRef: Cu,
      useState: function () {
        return Pi(Or);
      },
      useDebugValue: Ti,
      useDeferredValue: function (e) {
        var t = dt();
        return Tu(t, ze.memoizedState, e);
      },
      useTransition: function () {
        var e = Pi(Or)[0],
          t = dt().memoizedState;
        return [e, t];
      },
      useMutableSource: vu,
      useSyncExternalStore: yu,
      useId: Iu,
      unstable_isNewReconciler: !1,
    },
    zp = {
      readContext: ct,
      useCallback: zu,
      useContext: ct,
      useEffect: Ri,
      useImperativeHandle: Pu,
      useInsertionEffect: _u,
      useLayoutEffect: bu,
      useMemo: Ru,
      useReducer: zi,
      useRef: Cu,
      useState: function () {
        return zi(Or);
      },
      useDebugValue: Ti,
      useDeferredValue: function (e) {
        var t = dt();
        return ze === null ? (t.memoizedState = e) : Tu(t, ze.memoizedState, e);
      },
      useTransition: function () {
        var e = zi(Or)[0],
          t = dt().memoizedState;
        return [e, t];
      },
      useMutableSource: vu,
      useSyncExternalStore: yu,
      useId: Iu,
      unstable_isNewReconciler: !1,
    };
  function vt(e, t) {
    if (e && e.defaultProps) {
      (t = F({}, t)), (e = e.defaultProps);
      for (var n in e) t[n] === void 0 && (t[n] = e[n]);
      return t;
    }
    return t;
  }
  function Ii(e, t, n, r) {
    (t = e.memoizedState),
      (n = n(r, t)),
      (n = n == null ? t : F({}, t, n)),
      (e.memoizedState = n),
      e.lanes === 0 && (e.updateQueue.baseState = n);
  }
  var Lo = {
    isMounted: function (e) {
      return (e = e._reactInternals) ? cn(e) === e : !1;
    },
    enqueueSetState: function (e, t, n) {
      e = e._reactInternals;
      var r = Ze(),
        o = tn(e),
        i = It(r, o);
      (i.payload = t),
        n != null && (i.callback = n),
        (t = Kt(e, i, o)),
        t !== null && (wt(t, e, o, r), Mo(t, e, o));
    },
    enqueueReplaceState: function (e, t, n) {
      e = e._reactInternals;
      var r = Ze(),
        o = tn(e),
        i = It(r, o);
      (i.tag = 1),
        (i.payload = t),
        n != null && (i.callback = n),
        (t = Kt(e, i, o)),
        t !== null && (wt(t, e, o, r), Mo(t, e, o));
    },
    enqueueForceUpdate: function (e, t) {
      e = e._reactInternals;
      var n = Ze(),
        r = tn(e),
        o = It(n, r);
      (o.tag = 2),
        t != null && (o.callback = t),
        (t = Kt(e, o, r)),
        t !== null && (wt(t, e, r, n), Mo(t, e, r));
    },
  };
  function Au(e, t, n, r, o, i, u) {
    return (
      (e = e.stateNode),
      typeof e.shouldComponentUpdate == "function"
        ? e.shouldComponentUpdate(r, i, u)
        : t.prototype && t.prototype.isPureReactComponent
        ? !Nr(n, r) || !Nr(o, i)
        : !0
    );
  }
  function Fu(e, t, n) {
    var r = !1,
      o = Yt,
      i = t.contextType;
    return (
      typeof i == "object" && i !== null
        ? (i = ct(i))
        : ((o = Je(t) ? fn : Be.current),
          (r = t.contextTypes),
          (i = (r = r != null) ? An(e, o) : Yt)),
      (t = new t(n, i)),
      (e.memoizedState =
        t.state !== null && t.state !== void 0 ? t.state : null),
      (t.updater = Lo),
      (e.stateNode = t),
      (t._reactInternals = e),
      r &&
        ((e = e.stateNode),
        (e.__reactInternalMemoizedUnmaskedChildContext = o),
        (e.__reactInternalMemoizedMaskedChildContext = i)),
      t
    );
  }
  function Hu(e, t, n, r) {
    (e = t.state),
      typeof t.componentWillReceiveProps == "function" &&
        t.componentWillReceiveProps(n, r),
      typeof t.UNSAFE_componentWillReceiveProps == "function" &&
        t.UNSAFE_componentWillReceiveProps(n, r),
      t.state !== e && Lo.enqueueReplaceState(t, t.state, null);
  }
  function Oi(e, t, n, r) {
    var o = e.stateNode;
    (o.props = n), (o.state = e.memoizedState), (o.refs = {}), ki(e);
    var i = t.contextType;
    typeof i == "object" && i !== null
      ? (o.context = ct(i))
      : ((i = Je(t) ? fn : Be.current), (o.context = An(e, i))),
      (o.state = e.memoizedState),
      (i = t.getDerivedStateFromProps),
      typeof i == "function" && (Ii(e, t, i, n), (o.state = e.memoizedState)),
      typeof t.getDerivedStateFromProps == "function" ||
        typeof o.getSnapshotBeforeUpdate == "function" ||
        (typeof o.UNSAFE_componentWillMount != "function" &&
          typeof o.componentWillMount != "function") ||
        ((t = o.state),
        typeof o.componentWillMount == "function" && o.componentWillMount(),
        typeof o.UNSAFE_componentWillMount == "function" &&
          o.UNSAFE_componentWillMount(),
        t !== o.state && Lo.enqueueReplaceState(o, o.state, null),
        Po(e, n, o, r),
        (o.state = e.memoizedState)),
      typeof o.componentDidMount == "function" && (e.flags |= 4194308);
  }
  function Gn(e, t) {
    try {
      var n = "",
        r = t;
      do (n += ue(r)), (r = r.return);
      while (r);
      var o = n;
    } catch (i) {
      o =
        `
Error generating stack: ` +
        i.message +
        `
` +
        i.stack;
    }
    return { value: e, source: t, stack: o, digest: null };
  }
  function Di(e, t, n) {
    return { value: e, source: null, stack: n ?? null, digest: t ?? null };
  }
  function Li(e, t) {
    try {
      console.error(t.value);
    } catch (n) {
      setTimeout(function () {
        throw n;
      });
    }
  }
  var Rp = typeof WeakMap == "function" ? WeakMap : Map;
  function Uu(e, t, n) {
    (n = It(-1, n)), (n.tag = 3), (n.payload = { element: null });
    var r = t.value;
    return (
      (n.callback = function () {
        $o || (($o = !0), (Ji = r)), Li(e, t);
      }),
      n
    );
  }
  function Wu(e, t, n) {
    (n = It(-1, n)), (n.tag = 3);
    var r = e.type.getDerivedStateFromError;
    if (typeof r == "function") {
      var o = t.value;
      (n.payload = function () {
        return r(o);
      }),
        (n.callback = function () {
          Li(e, t);
        });
    }
    var i = e.stateNode;
    return (
      i !== null &&
        typeof i.componentDidCatch == "function" &&
        (n.callback = function () {
          Li(e, t),
            typeof r != "function" &&
              (qt === null ? (qt = new Set([this])) : qt.add(this));
          var u = t.stack;
          this.componentDidCatch(t.value, {
            componentStack: u !== null ? u : "",
          });
        }),
      n
    );
  }
  function Bu(e, t, n) {
    var r = e.pingCache;
    if (r === null) {
      r = e.pingCache = new Rp();
      var o = new Set();
      r.set(t, o);
    } else (o = r.get(t)), o === void 0 && ((o = new Set()), r.set(t, o));
    o.has(n) || (o.add(n), (e = Gp.bind(null, e, t, n)), t.then(e, e));
  }
  function $u(e) {
    do {
      var t;
      if (
        ((t = e.tag === 13) &&
          ((t = e.memoizedState),
          (t = t !== null ? t.dehydrated !== null : !0)),
        t)
      )
        return e;
      e = e.return;
    } while (e !== null);
    return null;
  }
  function Vu(e, t, n, r, o) {
    return (e.mode & 1) === 0
      ? (e === t
          ? (e.flags |= 65536)
          : ((e.flags |= 128),
            (n.flags |= 131072),
            (n.flags &= -52805),
            n.tag === 1 &&
              (n.alternate === null
                ? (n.tag = 17)
                : ((t = It(-1, 1)), (t.tag = 2), Kt(n, t, 1))),
            (n.lanes |= 1)),
        e)
      : ((e.flags |= 65536), (e.lanes = o), e);
  }
  var Tp = te.ReactCurrentOwner,
    qe = !1;
  function Qe(e, t, n, r) {
    t.child = e === null ? du(t, null, n, r) : Wn(t, e.child, n, r);
  }
  function Gu(e, t, n, r, o) {
    n = n.render;
    var i = t.ref;
    return (
      $n(t, o),
      (r = bi(e, t, n, r, i, o)),
      (n = Mi()),
      e !== null && !qe
        ? ((t.updateQueue = e.updateQueue),
          (t.flags &= -2053),
          (e.lanes &= ~o),
          Ot(e, t, o))
        : (Se && n && di(t), (t.flags |= 1), Qe(e, t, r, o), t.child)
    );
  }
  function Xu(e, t, n, r, o) {
    if (e === null) {
      var i = n.type;
      return typeof i == "function" &&
        !ls(i) &&
        i.defaultProps === void 0 &&
        n.compare === null &&
        n.defaultProps === void 0
        ? ((t.tag = 15), (t.type = i), Yu(e, t, i, r, o))
        : ((e = Zo(n.type, null, r, t, t.mode, o)),
          (e.ref = t.ref),
          (e.return = t),
          (t.child = e));
    }
    if (((i = e.child), (e.lanes & o) === 0)) {
      var u = i.memoizedProps;
      if (
        ((n = n.compare), (n = n !== null ? n : Nr), n(u, r) && e.ref === t.ref)
      )
        return Ot(e, t, o);
    }
    return (
      (t.flags |= 1),
      (e = rn(i, r)),
      (e.ref = t.ref),
      (e.return = t),
      (t.child = e)
    );
  }
  function Yu(e, t, n, r, o) {
    if (e !== null) {
      var i = e.memoizedProps;
      if (Nr(i, r) && e.ref === t.ref)
        if (((qe = !1), (t.pendingProps = r = i), (e.lanes & o) !== 0))
          (e.flags & 131072) !== 0 && (qe = !0);
        else return (t.lanes = e.lanes), Ot(e, t, o);
    }
    return Ai(e, t, n, r, o);
  }
  function Qu(e, t, n) {
    var r = t.pendingProps,
      o = r.children,
      i = e !== null ? e.memoizedState : null;
    if (r.mode === "hidden")
      if ((t.mode & 1) === 0)
        (t.memoizedState = {
          baseLanes: 0,
          cachePool: null,
          transitions: null,
        }),
          ye(Yn, it),
          (it |= n);
      else {
        if ((n & 1073741824) === 0)
          return (
            (e = i !== null ? i.baseLanes | n : n),
            (t.lanes = t.childLanes = 1073741824),
            (t.memoizedState = {
              baseLanes: e,
              cachePool: null,
              transitions: null,
            }),
            (t.updateQueue = null),
            ye(Yn, it),
            (it |= e),
            null
          );
        (t.memoizedState = {
          baseLanes: 0,
          cachePool: null,
          transitions: null,
        }),
          (r = i !== null ? i.baseLanes : n),
          ye(Yn, it),
          (it |= r);
      }
    else
      i !== null ? ((r = i.baseLanes | n), (t.memoizedState = null)) : (r = n),
        ye(Yn, it),
        (it |= r);
    return Qe(e, t, o, n), t.child;
  }
  function Zu(e, t) {
    var n = t.ref;
    ((e === null && n !== null) || (e !== null && e.ref !== n)) &&
      ((t.flags |= 512), (t.flags |= 2097152));
  }
  function Ai(e, t, n, r, o) {
    var i = Je(n) ? fn : Be.current;
    return (
      (i = An(t, i)),
      $n(t, o),
      (n = bi(e, t, n, r, i, o)),
      (r = Mi()),
      e !== null && !qe
        ? ((t.updateQueue = e.updateQueue),
          (t.flags &= -2053),
          (e.lanes &= ~o),
          Ot(e, t, o))
        : (Se && r && di(t), (t.flags |= 1), Qe(e, t, n, o), t.child)
    );
  }
  function Ku(e, t, n, r, o) {
    if (Je(n)) {
      var i = !0;
      ko(t);
    } else i = !1;
    if (($n(t, o), t.stateNode === null))
      Fo(e, t), Fu(t, n, r), Oi(t, n, r, o), (r = !0);
    else if (e === null) {
      var u = t.stateNode,
        p = t.memoizedProps;
      u.props = p;
      var h = u.context,
        N = n.contextType;
      typeof N == "object" && N !== null
        ? (N = ct(N))
        : ((N = Je(n) ? fn : Be.current), (N = An(t, N)));
      var P = n.getDerivedStateFromProps,
        T =
          typeof P == "function" ||
          typeof u.getSnapshotBeforeUpdate == "function";
      T ||
        (typeof u.UNSAFE_componentWillReceiveProps != "function" &&
          typeof u.componentWillReceiveProps != "function") ||
        ((p !== r || h !== N) && Hu(t, u, r, N)),
        (Zt = !1);
      var M = t.memoizedState;
      (u.state = M),
        Po(t, r, u, o),
        (h = t.memoizedState),
        p !== r || M !== h || Ke.current || Zt
          ? (typeof P == "function" && (Ii(t, n, P, r), (h = t.memoizedState)),
            (p = Zt || Au(t, n, p, r, M, h, N))
              ? (T ||
                  (typeof u.UNSAFE_componentWillMount != "function" &&
                    typeof u.componentWillMount != "function") ||
                  (typeof u.componentWillMount == "function" &&
                    u.componentWillMount(),
                  typeof u.UNSAFE_componentWillMount == "function" &&
                    u.UNSAFE_componentWillMount()),
                typeof u.componentDidMount == "function" &&
                  (t.flags |= 4194308))
              : (typeof u.componentDidMount == "function" &&
                  (t.flags |= 4194308),
                (t.memoizedProps = r),
                (t.memoizedState = h)),
            (u.props = r),
            (u.state = h),
            (u.context = N),
            (r = p))
          : (typeof u.componentDidMount == "function" && (t.flags |= 4194308),
            (r = !1));
    } else {
      (u = t.stateNode),
        pu(e, t),
        (p = t.memoizedProps),
        (N = t.type === t.elementType ? p : vt(t.type, p)),
        (u.props = N),
        (T = t.pendingProps),
        (M = u.context),
        (h = n.contextType),
        typeof h == "object" && h !== null
          ? (h = ct(h))
          : ((h = Je(n) ? fn : Be.current), (h = An(t, h)));
      var A = n.getDerivedStateFromProps;
      (P =
        typeof A == "function" ||
        typeof u.getSnapshotBeforeUpdate == "function") ||
        (typeof u.UNSAFE_componentWillReceiveProps != "function" &&
          typeof u.componentWillReceiveProps != "function") ||
        ((p !== T || M !== h) && Hu(t, u, r, h)),
        (Zt = !1),
        (M = t.memoizedState),
        (u.state = M),
        Po(t, r, u, o);
      var W = t.memoizedState;
      p !== T || M !== W || Ke.current || Zt
        ? (typeof A == "function" && (Ii(t, n, A, r), (W = t.memoizedState)),
          (N = Zt || Au(t, n, N, r, M, W, h) || !1)
            ? (P ||
                (typeof u.UNSAFE_componentWillUpdate != "function" &&
                  typeof u.componentWillUpdate != "function") ||
                (typeof u.componentWillUpdate == "function" &&
                  u.componentWillUpdate(r, W, h),
                typeof u.UNSAFE_componentWillUpdate == "function" &&
                  u.UNSAFE_componentWillUpdate(r, W, h)),
              typeof u.componentDidUpdate == "function" && (t.flags |= 4),
              typeof u.getSnapshotBeforeUpdate == "function" &&
                (t.flags |= 1024))
            : (typeof u.componentDidUpdate != "function" ||
                (p === e.memoizedProps && M === e.memoizedState) ||
                (t.flags |= 4),
              typeof u.getSnapshotBeforeUpdate != "function" ||
                (p === e.memoizedProps && M === e.memoizedState) ||
                (t.flags |= 1024),
              (t.memoizedProps = r),
              (t.memoizedState = W)),
          (u.props = r),
          (u.state = W),
          (u.context = h),
          (r = N))
        : (typeof u.componentDidUpdate != "function" ||
            (p === e.memoizedProps && M === e.memoizedState) ||
            (t.flags |= 4),
          typeof u.getSnapshotBeforeUpdate != "function" ||
            (p === e.memoizedProps && M === e.memoizedState) ||
            (t.flags |= 1024),
          (r = !1));
    }
    return Fi(e, t, n, r, i, o);
  }
  function Fi(e, t, n, r, o, i) {
    Zu(e, t);
    var u = (t.flags & 128) !== 0;
    if (!r && !u) return o && nu(t, n, !1), Ot(e, t, i);
    (r = t.stateNode), (Tp.current = t);
    var p =
      u && typeof n.getDerivedStateFromError != "function" ? null : r.render();
    return (
      (t.flags |= 1),
      e !== null && u
        ? ((t.child = Wn(t, e.child, null, i)), (t.child = Wn(t, null, p, i)))
        : Qe(e, t, p, i),
      (t.memoizedState = r.state),
      o && nu(t, n, !0),
      t.child
    );
  }
  function Ju(e) {
    var t = e.stateNode;
    t.pendingContext
      ? eu(e, t.pendingContext, t.pendingContext !== t.context)
      : t.context && eu(e, t.context, !1),
      Ni(e, t.containerInfo);
  }
  function qu(e, t, n, r, o) {
    return Un(), hi(o), (t.flags |= 256), Qe(e, t, n, r), t.child;
  }
  var Hi = { dehydrated: null, treeContext: null, retryLane: 0 };
  function Ui(e) {
    return { baseLanes: e, cachePool: null, transitions: null };
  }
  function ec(e, t, n) {
    var r = t.pendingProps,
      o = Ce.current,
      i = !1,
      u = (t.flags & 128) !== 0,
      p;
    if (
      ((p = u) ||
        (p = e !== null && e.memoizedState === null ? !1 : (o & 2) !== 0),
      p
        ? ((i = !0), (t.flags &= -129))
        : (e === null || e.memoizedState !== null) && (o |= 1),
      ye(Ce, o & 1),
      e === null)
    )
      return (
        mi(t),
        (e = t.memoizedState),
        e !== null && ((e = e.dehydrated), e !== null)
          ? ((t.mode & 1) === 0
              ? (t.lanes = 1)
              : e.data === "$!"
              ? (t.lanes = 8)
              : (t.lanes = 1073741824),
            null)
          : ((u = r.children),
            (e = r.fallback),
            i
              ? ((r = t.mode),
                (i = t.child),
                (u = { mode: "hidden", children: u }),
                (r & 1) === 0 && i !== null
                  ? ((i.childLanes = 0), (i.pendingProps = u))
                  : (i = Ko(u, r, 0, null)),
                (e = Nn(e, r, n, null)),
                (i.return = t),
                (e.return = t),
                (i.sibling = e),
                (t.child = i),
                (t.child.memoizedState = Ui(n)),
                (t.memoizedState = Hi),
                e)
              : Wi(t, u))
      );
    if (((o = e.memoizedState), o !== null && ((p = o.dehydrated), p !== null)))
      return Ip(e, t, u, r, p, o, n);
    if (i) {
      (i = r.fallback), (u = t.mode), (o = e.child), (p = o.sibling);
      var h = { mode: "hidden", children: r.children };
      return (
        (u & 1) === 0 && t.child !== o
          ? ((r = t.child),
            (r.childLanes = 0),
            (r.pendingProps = h),
            (t.deletions = null))
          : ((r = rn(o, h)), (r.subtreeFlags = o.subtreeFlags & 14680064)),
        p !== null ? (i = rn(p, i)) : ((i = Nn(i, u, n, null)), (i.flags |= 2)),
        (i.return = t),
        (r.return = t),
        (r.sibling = i),
        (t.child = r),
        (r = i),
        (i = t.child),
        (u = e.child.memoizedState),
        (u =
          u === null
            ? Ui(n)
            : {
                baseLanes: u.baseLanes | n,
                cachePool: null,
                transitions: u.transitions,
              }),
        (i.memoizedState = u),
        (i.childLanes = e.childLanes & ~n),
        (t.memoizedState = Hi),
        r
      );
    }
    return (
      (i = e.child),
      (e = i.sibling),
      (r = rn(i, { mode: "visible", children: r.children })),
      (t.mode & 1) === 0 && (r.lanes = n),
      (r.return = t),
      (r.sibling = null),
      e !== null &&
        ((n = t.deletions),
        n === null ? ((t.deletions = [e]), (t.flags |= 16)) : n.push(e)),
      (t.child = r),
      (t.memoizedState = null),
      r
    );
  }
  function Wi(e, t) {
    return (
      (t = Ko({ mode: "visible", children: t }, e.mode, 0, null)),
      (t.return = e),
      (e.child = t)
    );
  }
  function Ao(e, t, n, r) {
    return (
      r !== null && hi(r),
      Wn(t, e.child, null, n),
      (e = Wi(t, t.pendingProps.children)),
      (e.flags |= 2),
      (t.memoizedState = null),
      e
    );
  }
  function Ip(e, t, n, r, o, i, u) {
    if (n)
      return t.flags & 256
        ? ((t.flags &= -257), (r = Di(Error(s(422)))), Ao(e, t, u, r))
        : t.memoizedState !== null
        ? ((t.child = e.child), (t.flags |= 128), null)
        : ((i = r.fallback),
          (o = t.mode),
          (r = Ko({ mode: "visible", children: r.children }, o, 0, null)),
          (i = Nn(i, o, u, null)),
          (i.flags |= 2),
          (r.return = t),
          (i.return = t),
          (r.sibling = i),
          (t.child = r),
          (t.mode & 1) !== 0 && Wn(t, e.child, null, u),
          (t.child.memoizedState = Ui(u)),
          (t.memoizedState = Hi),
          i);
    if ((t.mode & 1) === 0) return Ao(e, t, u, null);
    if (o.data === "$!") {
      if (((r = o.nextSibling && o.nextSibling.dataset), r)) var p = r.dgst;
      return (
        (r = p), (i = Error(s(419))), (r = Di(i, r, void 0)), Ao(e, t, u, r)
      );
    }
    if (((p = (u & e.childLanes) !== 0), qe || p)) {
      if (((r = De), r !== null)) {
        switch (u & -u) {
          case 4:
            o = 2;
            break;
          case 16:
            o = 8;
            break;
          case 64:
          case 128:
          case 256:
          case 512:
          case 1024:
          case 2048:
          case 4096:
          case 8192:
          case 16384:
          case 32768:
          case 65536:
          case 131072:
          case 262144:
          case 524288:
          case 1048576:
          case 2097152:
          case 4194304:
          case 8388608:
          case 16777216:
          case 33554432:
          case 67108864:
            o = 32;
            break;
          case 536870912:
            o = 268435456;
            break;
          default:
            o = 0;
        }
        (o = (o & (r.suspendedLanes | u)) !== 0 ? 0 : o),
          o !== 0 &&
            o !== i.retryLane &&
            ((i.retryLane = o), Tt(e, o), wt(r, e, o, -1));
      }
      return os(), (r = Di(Error(s(421)))), Ao(e, t, u, r);
    }
    return o.data === "$?"
      ? ((t.flags |= 128),
        (t.child = e.child),
        (t = Xp.bind(null, e)),
        (o._reactRetry = t),
        null)
      : ((e = i.treeContext),
        (lt = Gt(o.nextSibling)),
        (ot = t),
        (Se = !0),
        (gt = null),
        e !== null &&
          ((at[ut++] = zt),
          (at[ut++] = Rt),
          (at[ut++] = pn),
          (zt = e.id),
          (Rt = e.overflow),
          (pn = t)),
        (t = Wi(t, r.children)),
        (t.flags |= 4096),
        t);
  }
  function tc(e, t, n) {
    e.lanes |= t;
    var r = e.alternate;
    r !== null && (r.lanes |= t), xi(e.return, t, n);
  }
  function Bi(e, t, n, r, o) {
    var i = e.memoizedState;
    i === null
      ? (e.memoizedState = {
          isBackwards: t,
          rendering: null,
          renderingStartTime: 0,
          last: r,
          tail: n,
          tailMode: o,
        })
      : ((i.isBackwards = t),
        (i.rendering = null),
        (i.renderingStartTime = 0),
        (i.last = r),
        (i.tail = n),
        (i.tailMode = o));
  }
  function nc(e, t, n) {
    var r = t.pendingProps,
      o = r.revealOrder,
      i = r.tail;
    if ((Qe(e, t, r.children, n), (r = Ce.current), (r & 2) !== 0))
      (r = (r & 1) | 2), (t.flags |= 128);
    else {
      if (e !== null && (e.flags & 128) !== 0)
        e: for (e = t.child; e !== null; ) {
          if (e.tag === 13) e.memoizedState !== null && tc(e, n, t);
          else if (e.tag === 19) tc(e, n, t);
          else if (e.child !== null) {
            (e.child.return = e), (e = e.child);
            continue;
          }
          if (e === t) break e;
          for (; e.sibling === null; ) {
            if (e.return === null || e.return === t) break e;
            e = e.return;
          }
          (e.sibling.return = e.return), (e = e.sibling);
        }
      r &= 1;
    }
    if ((ye(Ce, r), (t.mode & 1) === 0)) t.memoizedState = null;
    else
      switch (o) {
        case "forwards":
          for (n = t.child, o = null; n !== null; )
            (e = n.alternate),
              e !== null && zo(e) === null && (o = n),
              (n = n.sibling);
          (n = o),
            n === null
              ? ((o = t.child), (t.child = null))
              : ((o = n.sibling), (n.sibling = null)),
            Bi(t, !1, o, n, i);
          break;
        case "backwards":
          for (n = null, o = t.child, t.child = null; o !== null; ) {
            if (((e = o.alternate), e !== null && zo(e) === null)) {
              t.child = o;
              break;
            }
            (e = o.sibling), (o.sibling = n), (n = o), (o = e);
          }
          Bi(t, !0, n, null, i);
          break;
        case "together":
          Bi(t, !1, null, null, void 0);
          break;
        default:
          t.memoizedState = null;
      }
    return t.child;
  }
  function Fo(e, t) {
    (t.mode & 1) === 0 &&
      e !== null &&
      ((e.alternate = null), (t.alternate = null), (t.flags |= 2));
  }
  function Ot(e, t, n) {
    if (
      (e !== null && (t.dependencies = e.dependencies),
      (yn |= t.lanes),
      (n & t.childLanes) === 0)
    )
      return null;
    if (e !== null && t.child !== e.child) throw Error(s(153));
    if (t.child !== null) {
      for (
        e = t.child, n = rn(e, e.pendingProps), t.child = n, n.return = t;
        e.sibling !== null;

      )
        (e = e.sibling),
          (n = n.sibling = rn(e, e.pendingProps)),
          (n.return = t);
      n.sibling = null;
    }
    return t.child;
  }
  function Op(e, t, n) {
    switch (t.tag) {
      case 3:
        Ju(t), Un();
        break;
      case 5:
        gu(t);
        break;
      case 1:
        Je(t.type) && ko(t);
        break;
      case 4:
        Ni(t, t.stateNode.containerInfo);
        break;
      case 10:
        var r = t.type._context,
          o = t.memoizedProps.value;
        ye(_o, r._currentValue), (r._currentValue = o);
        break;
      case 13:
        if (((r = t.memoizedState), r !== null))
          return r.dehydrated !== null
            ? (ye(Ce, Ce.current & 1), (t.flags |= 128), null)
            : (n & t.child.childLanes) !== 0
            ? ec(e, t, n)
            : (ye(Ce, Ce.current & 1),
              (e = Ot(e, t, n)),
              e !== null ? e.sibling : null);
        ye(Ce, Ce.current & 1);
        break;
      case 19:
        if (((r = (n & t.childLanes) !== 0), (e.flags & 128) !== 0)) {
          if (r) return nc(e, t, n);
          t.flags |= 128;
        }
        if (
          ((o = t.memoizedState),
          o !== null &&
            ((o.rendering = null), (o.tail = null), (o.lastEffect = null)),
          ye(Ce, Ce.current),
          r)
        )
          break;
        return null;
      case 22:
      case 23:
        return (t.lanes = 0), Qu(e, t, n);
    }
    return Ot(e, t, n);
  }
  var rc, $i, oc, lc;
  (rc = function (e, t) {
    for (var n = t.child; n !== null; ) {
      if (n.tag === 5 || n.tag === 6) e.appendChild(n.stateNode);
      else if (n.tag !== 4 && n.child !== null) {
        (n.child.return = n), (n = n.child);
        continue;
      }
      if (n === t) break;
      for (; n.sibling === null; ) {
        if (n.return === null || n.return === t) return;
        n = n.return;
      }
      (n.sibling.return = n.return), (n = n.sibling);
    }
  }),
    ($i = function () {}),
    (oc = function (e, t, n, r) {
      var o = e.memoizedProps;
      if (o !== r) {
        (e = t.stateNode), gn(Ct.current);
        var i = null;
        switch (n) {
          case "input":
            (o = xl(e, o)), (r = xl(e, r)), (i = []);
            break;
          case "select":
            (o = F({}, o, { value: void 0 })),
              (r = F({}, r, { value: void 0 })),
              (i = []);
            break;
          case "textarea":
            (o = Nl(e, o)), (r = Nl(e, r)), (i = []);
            break;
          default:
            typeof o.onClick != "function" &&
              typeof r.onClick == "function" &&
              (e.onclick = yo);
        }
        El(n, r);
        var u;
        n = null;
        for (N in o)
          if (!r.hasOwnProperty(N) && o.hasOwnProperty(N) && o[N] != null)
            if (N === "style") {
              var p = o[N];
              for (u in p) p.hasOwnProperty(u) && (n || (n = {}), (n[u] = ""));
            } else
              N !== "dangerouslySetInnerHTML" &&
                N !== "children" &&
                N !== "suppressContentEditableWarning" &&
                N !== "suppressHydrationWarning" &&
                N !== "autoFocus" &&
                (d.hasOwnProperty(N)
                  ? i || (i = [])
                  : (i = i || []).push(N, null));
        for (N in r) {
          var h = r[N];
          if (
            ((p = o?.[N]),
            r.hasOwnProperty(N) && h !== p && (h != null || p != null))
          )
            if (N === "style")
              if (p) {
                for (u in p)
                  !p.hasOwnProperty(u) ||
                    (h && h.hasOwnProperty(u)) ||
                    (n || (n = {}), (n[u] = ""));
                for (u in h)
                  h.hasOwnProperty(u) &&
                    p[u] !== h[u] &&
                    (n || (n = {}), (n[u] = h[u]));
              } else n || (i || (i = []), i.push(N, n)), (n = h);
            else
              N === "dangerouslySetInnerHTML"
                ? ((h = h ? h.__html : void 0),
                  (p = p ? p.__html : void 0),
                  h != null && p !== h && (i = i || []).push(N, h))
                : N === "children"
                ? (typeof h != "string" && typeof h != "number") ||
                  (i = i || []).push(N, "" + h)
                : N !== "suppressContentEditableWarning" &&
                  N !== "suppressHydrationWarning" &&
                  (d.hasOwnProperty(N)
                    ? (h != null && N === "onScroll" && xe("scroll", e),
                      i || p === h || (i = []))
                    : (i = i || []).push(N, h));
        }
        n && (i = i || []).push("style", n);
        var N = i;
        (t.updateQueue = N) && (t.flags |= 4);
      }
    }),
    (lc = function (e, t, n, r) {
      n !== r && (t.flags |= 4);
    });
  function Lr(e, t) {
    if (!Se)
      switch (e.tailMode) {
        case "hidden":
          t = e.tail;
          for (var n = null; t !== null; )
            t.alternate !== null && (n = t), (t = t.sibling);
          n === null ? (e.tail = null) : (n.sibling = null);
          break;
        case "collapsed":
          n = e.tail;
          for (var r = null; n !== null; )
            n.alternate !== null && (r = n), (n = n.sibling);
          r === null
            ? t || e.tail === null
              ? (e.tail = null)
              : (e.tail.sibling = null)
            : (r.sibling = null);
      }
  }
  function Ve(e) {
    var t = e.alternate !== null && e.alternate.child === e.child,
      n = 0,
      r = 0;
    if (t)
      for (var o = e.child; o !== null; )
        (n |= o.lanes | o.childLanes),
          (r |= o.subtreeFlags & 14680064),
          (r |= o.flags & 14680064),
          (o.return = e),
          (o = o.sibling);
    else
      for (o = e.child; o !== null; )
        (n |= o.lanes | o.childLanes),
          (r |= o.subtreeFlags),
          (r |= o.flags),
          (o.return = e),
          (o = o.sibling);
    return (e.subtreeFlags |= r), (e.childLanes = n), t;
  }
  function Dp(e, t, n) {
    var r = t.pendingProps;
    switch ((fi(t), t.tag)) {
      case 2:
      case 16:
      case 15:
      case 0:
      case 11:
      case 7:
      case 8:
      case 12:
      case 9:
      case 14:
        return Ve(t), null;
      case 1:
        return Je(t.type) && wo(), Ve(t), null;
      case 3:
        return (
          (r = t.stateNode),
          Vn(),
          we(Ke),
          we(Be),
          Ci(),
          r.pendingContext &&
            ((r.context = r.pendingContext), (r.pendingContext = null)),
          (e === null || e.child === null) &&
            (Co(t)
              ? (t.flags |= 4)
              : e === null ||
                (e.memoizedState.isDehydrated && (t.flags & 256) === 0) ||
                ((t.flags |= 1024), gt !== null && (ts(gt), (gt = null)))),
          $i(e, t),
          Ve(t),
          null
        );
      case 5:
        Si(t);
        var o = gn(Rr.current);
        if (((n = t.type), e !== null && t.stateNode != null))
          oc(e, t, n, r, o),
            e.ref !== t.ref && ((t.flags |= 512), (t.flags |= 2097152));
        else {
          if (!r) {
            if (t.stateNode === null) throw Error(s(166));
            return Ve(t), null;
          }
          if (((e = gn(Ct.current)), Co(t))) {
            (r = t.stateNode), (n = t.type);
            var i = t.memoizedProps;
            switch (((r[Et] = t), (r[_r] = i), (e = (t.mode & 1) !== 0), n)) {
              case "dialog":
                xe("cancel", r), xe("close", r);
                break;
              case "iframe":
              case "object":
              case "embed":
                xe("load", r);
                break;
              case "video":
              case "audio":
                for (o = 0; o < Er.length; o++) xe(Er[o], r);
                break;
              case "source":
                xe("error", r);
                break;
              case "img":
              case "image":
              case "link":
                xe("error", r), xe("load", r);
                break;
              case "details":
                xe("toggle", r);
                break;
              case "input":
                Fs(r, i), xe("invalid", r);
                break;
              case "select":
                (r._wrapperState = { wasMultiple: !!i.multiple }),
                  xe("invalid", r);
                break;
              case "textarea":
                Ws(r, i), xe("invalid", r);
            }
            El(n, i), (o = null);
            for (var u in i)
              if (i.hasOwnProperty(u)) {
                var p = i[u];
                u === "children"
                  ? typeof p == "string"
                    ? r.textContent !== p &&
                      (i.suppressHydrationWarning !== !0 &&
                        vo(r.textContent, p, e),
                      (o = ["children", p]))
                    : typeof p == "number" &&
                      r.textContent !== "" + p &&
                      (i.suppressHydrationWarning !== !0 &&
                        vo(r.textContent, p, e),
                      (o = ["children", "" + p]))
                  : d.hasOwnProperty(u) &&
                    p != null &&
                    u === "onScroll" &&
                    xe("scroll", r);
              }
            switch (n) {
              case "input":
                Ft(r), Us(r, i, !0);
                break;
              case "textarea":
                Ft(r), $s(r);
                break;
              case "select":
              case "option":
                break;
              default:
                typeof i.onClick == "function" && (r.onclick = yo);
            }
            (r = o), (t.updateQueue = r), r !== null && (t.flags |= 4);
          } else {
            (u = o.nodeType === 9 ? o : o.ownerDocument),
              e === "http://www.w3.org/1999/xhtml" && (e = Vs(n)),
              e === "http://www.w3.org/1999/xhtml"
                ? n === "script"
                  ? ((e = u.createElement("div")),
                    (e.innerHTML = "<script></script>"),
                    (e = e.removeChild(e.firstChild)))
                  : typeof r.is == "string"
                  ? (e = u.createElement(n, { is: r.is }))
                  : ((e = u.createElement(n)),
                    n === "select" &&
                      ((u = e),
                      r.multiple
                        ? (u.multiple = !0)
                        : r.size && (u.size = r.size)))
                : (e = u.createElementNS(e, n)),
              (e[Et] = t),
              (e[_r] = r),
              rc(e, t, !1, !1),
              (t.stateNode = e);
            e: {
              switch (((u = Cl(n, r)), n)) {
                case "dialog":
                  xe("cancel", e), xe("close", e), (o = r);
                  break;
                case "iframe":
                case "object":
                case "embed":
                  xe("load", e), (o = r);
                  break;
                case "video":
                case "audio":
                  for (o = 0; o < Er.length; o++) xe(Er[o], e);
                  o = r;
                  break;
                case "source":
                  xe("error", e), (o = r);
                  break;
                case "img":
                case "image":
                case "link":
                  xe("error", e), xe("load", e), (o = r);
                  break;
                case "details":
                  xe("toggle", e), (o = r);
                  break;
                case "input":
                  Fs(e, r), (o = xl(e, r)), xe("invalid", e);
                  break;
                case "option":
                  o = r;
                  break;
                case "select":
                  (e._wrapperState = { wasMultiple: !!r.multiple }),
                    (o = F({}, r, { value: void 0 })),
                    xe("invalid", e);
                  break;
                case "textarea":
                  Ws(e, r), (o = Nl(e, r)), xe("invalid", e);
                  break;
                default:
                  o = r;
              }
              El(n, o), (p = o);
              for (i in p)
                if (p.hasOwnProperty(i)) {
                  var h = p[i];
                  i === "style"
                    ? Ys(e, h)
                    : i === "dangerouslySetInnerHTML"
                    ? ((h = h ? h.__html : void 0), h != null && Gs(e, h))
                    : i === "children"
                    ? typeof h == "string"
                      ? (n !== "textarea" || h !== "") && lr(e, h)
                      : typeof h == "number" && lr(e, "" + h)
                    : i !== "suppressContentEditableWarning" &&
                      i !== "suppressHydrationWarning" &&
                      i !== "autoFocus" &&
                      (d.hasOwnProperty(i)
                        ? h != null && i === "onScroll" && xe("scroll", e)
                        : h != null && oe(e, i, h, u));
                }
              switch (n) {
                case "input":
                  Ft(e), Us(e, r, !1);
                  break;
                case "textarea":
                  Ft(e), $s(e);
                  break;
                case "option":
                  r.value != null && e.setAttribute("value", "" + pe(r.value));
                  break;
                case "select":
                  (e.multiple = !!r.multiple),
                    (i = r.value),
                    i != null
                      ? jn(e, !!r.multiple, i, !1)
                      : r.defaultValue != null &&
                        jn(e, !!r.multiple, r.defaultValue, !0);
                  break;
                default:
                  typeof o.onClick == "function" && (e.onclick = yo);
              }
              switch (n) {
                case "button":
                case "input":
                case "select":
                case "textarea":
                  r = !!r.autoFocus;
                  break e;
                case "img":
                  r = !0;
                  break e;
                default:
                  r = !1;
              }
            }
            r && (t.flags |= 4);
          }
          t.ref !== null && ((t.flags |= 512), (t.flags |= 2097152));
        }
        return Ve(t), null;
      case 6:
        if (e && t.stateNode != null) lc(e, t, e.memoizedProps, r);
        else {
          if (typeof r != "string" && t.stateNode === null) throw Error(s(166));
          if (((n = gn(Rr.current)), gn(Ct.current), Co(t))) {
            if (
              ((r = t.stateNode),
              (n = t.memoizedProps),
              (r[Et] = t),
              (i = r.nodeValue !== n) && ((e = ot), e !== null))
            )
              switch (e.tag) {
                case 3:
                  vo(r.nodeValue, n, (e.mode & 1) !== 0);
                  break;
                case 5:
                  e.memoizedProps.suppressHydrationWarning !== !0 &&
                    vo(r.nodeValue, n, (e.mode & 1) !== 0);
              }
            i && (t.flags |= 4);
          } else
            (r = (n.nodeType === 9 ? n : n.ownerDocument).createTextNode(r)),
              (r[Et] = t),
              (t.stateNode = r);
        }
        return Ve(t), null;
      case 13:
        if (
          (we(Ce),
          (r = t.memoizedState),
          e === null ||
            (e.memoizedState !== null && e.memoizedState.dehydrated !== null))
        ) {
          if (Se && lt !== null && (t.mode & 1) !== 0 && (t.flags & 128) === 0)
            au(), Un(), (t.flags |= 98560), (i = !1);
          else if (((i = Co(t)), r !== null && r.dehydrated !== null)) {
            if (e === null) {
              if (!i) throw Error(s(318));
              if (
                ((i = t.memoizedState),
                (i = i !== null ? i.dehydrated : null),
                !i)
              )
                throw Error(s(317));
              i[Et] = t;
            } else
              Un(),
                (t.flags & 128) === 0 && (t.memoizedState = null),
                (t.flags |= 4);
            Ve(t), (i = !1);
          } else gt !== null && (ts(gt), (gt = null)), (i = !0);
          if (!i) return t.flags & 65536 ? t : null;
        }
        return (t.flags & 128) !== 0
          ? ((t.lanes = n), t)
          : ((r = r !== null),
            r !== (e !== null && e.memoizedState !== null) &&
              r &&
              ((t.child.flags |= 8192),
              (t.mode & 1) !== 0 &&
                (e === null || (Ce.current & 1) !== 0
                  ? Re === 0 && (Re = 3)
                  : os())),
            t.updateQueue !== null && (t.flags |= 4),
            Ve(t),
            null);
      case 4:
        return (
          Vn(),
          $i(e, t),
          e === null && Cr(t.stateNode.containerInfo),
          Ve(t),
          null
        );
      case 10:
        return yi(t.type._context), Ve(t), null;
      case 17:
        return Je(t.type) && wo(), Ve(t), null;
      case 19:
        if ((we(Ce), (i = t.memoizedState), i === null)) return Ve(t), null;
        if (((r = (t.flags & 128) !== 0), (u = i.rendering), u === null))
          if (r) Lr(i, !1);
          else {
            if (Re !== 0 || (e !== null && (e.flags & 128) !== 0))
              for (e = t.child; e !== null; ) {
                if (((u = zo(e)), u !== null)) {
                  for (
                    t.flags |= 128,
                      Lr(i, !1),
                      r = u.updateQueue,
                      r !== null && ((t.updateQueue = r), (t.flags |= 4)),
                      t.subtreeFlags = 0,
                      r = n,
                      n = t.child;
                    n !== null;

                  )
                    (i = n),
                      (e = r),
                      (i.flags &= 14680066),
                      (u = i.alternate),
                      u === null
                        ? ((i.childLanes = 0),
                          (i.lanes = e),
                          (i.child = null),
                          (i.subtreeFlags = 0),
                          (i.memoizedProps = null),
                          (i.memoizedState = null),
                          (i.updateQueue = null),
                          (i.dependencies = null),
                          (i.stateNode = null))
                        : ((i.childLanes = u.childLanes),
                          (i.lanes = u.lanes),
                          (i.child = u.child),
                          (i.subtreeFlags = 0),
                          (i.deletions = null),
                          (i.memoizedProps = u.memoizedProps),
                          (i.memoizedState = u.memoizedState),
                          (i.updateQueue = u.updateQueue),
                          (i.type = u.type),
                          (e = u.dependencies),
                          (i.dependencies =
                            e === null
                              ? null
                              : {
                                  lanes: e.lanes,
                                  firstContext: e.firstContext,
                                })),
                      (n = n.sibling);
                  return ye(Ce, (Ce.current & 1) | 2), t.child;
                }
                e = e.sibling;
              }
            i.tail !== null &&
              be() > Qn &&
              ((t.flags |= 128), (r = !0), Lr(i, !1), (t.lanes = 4194304));
          }
        else {
          if (!r)
            if (((e = zo(u)), e !== null)) {
              if (
                ((t.flags |= 128),
                (r = !0),
                (n = e.updateQueue),
                n !== null && ((t.updateQueue = n), (t.flags |= 4)),
                Lr(i, !0),
                i.tail === null &&
                  i.tailMode === "hidden" &&
                  !u.alternate &&
                  !Se)
              )
                return Ve(t), null;
            } else
              2 * be() - i.renderingStartTime > Qn &&
                n !== 1073741824 &&
                ((t.flags |= 128), (r = !0), Lr(i, !1), (t.lanes = 4194304));
          i.isBackwards
            ? ((u.sibling = t.child), (t.child = u))
            : ((n = i.last),
              n !== null ? (n.sibling = u) : (t.child = u),
              (i.last = u));
        }
        return i.tail !== null
          ? ((t = i.tail),
            (i.rendering = t),
            (i.tail = t.sibling),
            (i.renderingStartTime = be()),
            (t.sibling = null),
            (n = Ce.current),
            ye(Ce, r ? (n & 1) | 2 : n & 1),
            t)
          : (Ve(t), null);
      case 22:
      case 23:
        return (
          rs(),
          (r = t.memoizedState !== null),
          e !== null && (e.memoizedState !== null) !== r && (t.flags |= 8192),
          r && (t.mode & 1) !== 0
            ? (it & 1073741824) !== 0 &&
              (Ve(t), t.subtreeFlags & 6 && (t.flags |= 8192))
            : Ve(t),
          null
        );
      case 24:
        return null;
      case 25:
        return null;
    }
    throw Error(s(156, t.tag));
  }
  function Lp(e, t) {
    switch ((fi(t), t.tag)) {
      case 1:
        return (
          Je(t.type) && wo(),
          (e = t.flags),
          e & 65536 ? ((t.flags = (e & -65537) | 128), t) : null
        );
      case 3:
        return (
          Vn(),
          we(Ke),
          we(Be),
          Ci(),
          (e = t.flags),
          (e & 65536) !== 0 && (e & 128) === 0
            ? ((t.flags = (e & -65537) | 128), t)
            : null
        );
      case 5:
        return Si(t), null;
      case 13:
        if (
          (we(Ce), (e = t.memoizedState), e !== null && e.dehydrated !== null)
        ) {
          if (t.alternate === null) throw Error(s(340));
          Un();
        }
        return (
          (e = t.flags), e & 65536 ? ((t.flags = (e & -65537) | 128), t) : null
        );
      case 19:
        return we(Ce), null;
      case 4:
        return Vn(), null;
      case 10:
        return yi(t.type._context), null;
      case 22:
      case 23:
        return rs(), null;
      case 24:
        return null;
      default:
        return null;
    }
  }
  var Ho = !1,
    Ge = !1,
    Ap = typeof WeakSet == "function" ? WeakSet : Set,
    H = null;
  function Xn(e, t) {
    var n = e.ref;
    if (n !== null)
      if (typeof n == "function")
        try {
          n(null);
        } catch (r) {
          _e(e, t, r);
        }
      else n.current = null;
  }
  function Vi(e, t, n) {
    try {
      n();
    } catch (r) {
      _e(e, t, r);
    }
  }
  var ic = !1;
  function Fp(e, t) {
    if (((ri = lo), (e = Aa()), Ql(e))) {
      if ("selectionStart" in e)
        var n = { start: e.selectionStart, end: e.selectionEnd };
      else
        e: {
          n = ((n = e.ownerDocument) && n.defaultView) || window;
          var r = n.getSelection && n.getSelection();
          if (r && r.rangeCount !== 0) {
            n = r.anchorNode;
            var o = r.anchorOffset,
              i = r.focusNode;
            r = r.focusOffset;
            try {
              n.nodeType, i.nodeType;
            } catch {
              n = null;
              break e;
            }
            var u = 0,
              p = -1,
              h = -1,
              N = 0,
              P = 0,
              T = e,
              M = null;
            t: for (;;) {
              for (
                var A;
                T !== n || (o !== 0 && T.nodeType !== 3) || (p = u + o),
                  T !== i || (r !== 0 && T.nodeType !== 3) || (h = u + r),
                  T.nodeType === 3 && (u += T.nodeValue.length),
                  (A = T.firstChild) !== null;

              )
                (M = T), (T = A);
              for (;;) {
                if (T === e) break t;
                if (
                  (M === n && ++N === o && (p = u),
                  M === i && ++P === r && (h = u),
                  (A = T.nextSibling) !== null)
                )
                  break;
                (T = M), (M = T.parentNode);
              }
              T = A;
            }
            n = p === -1 || h === -1 ? null : { start: p, end: h };
          } else n = null;
        }
      n = n || { start: 0, end: 0 };
    } else n = null;
    for (
      oi = { focusedElem: e, selectionRange: n }, lo = !1, H = t;
      H !== null;

    )
      if (((t = H), (e = t.child), (t.subtreeFlags & 1028) !== 0 && e !== null))
        (e.return = t), (H = e);
      else
        for (; H !== null; ) {
          t = H;
          try {
            var W = t.alternate;
            if ((t.flags & 1024) !== 0)
              switch (t.tag) {
                case 0:
                case 11:
                case 15:
                  break;
                case 1:
                  if (W !== null) {
                    var V = W.memoizedProps,
                      Me = W.memoizedState,
                      x = t.stateNode,
                      g = x.getSnapshotBeforeUpdate(
                        t.elementType === t.type ? V : vt(t.type, V),
                        Me
                      );
                    x.__reactInternalSnapshotBeforeUpdate = g;
                  }
                  break;
                case 3:
                  var k = t.stateNode.containerInfo;
                  k.nodeType === 1
                    ? (k.textContent = "")
                    : k.nodeType === 9 &&
                      k.documentElement &&
                      k.removeChild(k.documentElement);
                  break;
                case 5:
                case 6:
                case 4:
                case 17:
                  break;
                default:
                  throw Error(s(163));
              }
          } catch (I) {
            _e(t, t.return, I);
          }
          if (((e = t.sibling), e !== null)) {
            (e.return = t.return), (H = e);
            break;
          }
          H = t.return;
        }
    return (W = ic), (ic = !1), W;
  }
  function Ar(e, t, n) {
    var r = t.updateQueue;
    if (((r = r !== null ? r.lastEffect : null), r !== null)) {
      var o = (r = r.next);
      do {
        if ((o.tag & e) === e) {
          var i = o.destroy;
          (o.destroy = void 0), i !== void 0 && Vi(t, n, i);
        }
        o = o.next;
      } while (o !== r);
    }
  }
  function Uo(e, t) {
    if (
      ((t = t.updateQueue), (t = t !== null ? t.lastEffect : null), t !== null)
    ) {
      var n = (t = t.next);
      do {
        if ((n.tag & e) === e) {
          var r = n.create;
          n.destroy = r();
        }
        n = n.next;
      } while (n !== t);
    }
  }
  function Gi(e) {
    var t = e.ref;
    if (t !== null) {
      var n = e.stateNode;
      switch (e.tag) {
        case 5:
          e = n;
          break;
        default:
          e = n;
      }
      typeof t == "function" ? t(e) : (t.current = e);
    }
  }
  function sc(e) {
    var t = e.alternate;
    t !== null && ((e.alternate = null), sc(t)),
      (e.child = null),
      (e.deletions = null),
      (e.sibling = null),
      e.tag === 5 &&
        ((t = e.stateNode),
        t !== null &&
          (delete t[Et],
          delete t[_r],
          delete t[ai],
          delete t[kp],
          delete t[Np])),
      (e.stateNode = null),
      (e.return = null),
      (e.dependencies = null),
      (e.memoizedProps = null),
      (e.memoizedState = null),
      (e.pendingProps = null),
      (e.stateNode = null),
      (e.updateQueue = null);
  }
  function ac(e) {
    return e.tag === 5 || e.tag === 3 || e.tag === 4;
  }
  function uc(e) {
    e: for (;;) {
      for (; e.sibling === null; ) {
        if (e.return === null || ac(e.return)) return null;
        e = e.return;
      }
      for (
        e.sibling.return = e.return, e = e.sibling;
        e.tag !== 5 && e.tag !== 6 && e.tag !== 18;

      ) {
        if (e.flags & 2 || e.child === null || e.tag === 4) continue e;
        (e.child.return = e), (e = e.child);
      }
      if (!(e.flags & 2)) return e.stateNode;
    }
  }
  function Xi(e, t, n) {
    var r = e.tag;
    if (r === 5 || r === 6)
      (e = e.stateNode),
        t
          ? n.nodeType === 8
            ? n.parentNode.insertBefore(e, t)
            : n.insertBefore(e, t)
          : (n.nodeType === 8
              ? ((t = n.parentNode), t.insertBefore(e, n))
              : ((t = n), t.appendChild(e)),
            (n = n._reactRootContainer),
            n != null || t.onclick !== null || (t.onclick = yo));
    else if (r !== 4 && ((e = e.child), e !== null))
      for (Xi(e, t, n), e = e.sibling; e !== null; )
        Xi(e, t, n), (e = e.sibling);
  }
  function Yi(e, t, n) {
    var r = e.tag;
    if (r === 5 || r === 6)
      (e = e.stateNode), t ? n.insertBefore(e, t) : n.appendChild(e);
    else if (r !== 4 && ((e = e.child), e !== null))
      for (Yi(e, t, n), e = e.sibling; e !== null; )
        Yi(e, t, n), (e = e.sibling);
  }
  var Fe = null,
    yt = !1;
  function Jt(e, t, n) {
    for (n = n.child; n !== null; ) cc(e, t, n), (n = n.sibling);
  }
  function cc(e, t, n) {
    if (St && typeof St.onCommitFiberUnmount == "function")
      try {
        St.onCommitFiberUnmount(qr, n);
      } catch {}
    switch (n.tag) {
      case 5:
        Ge || Xn(n, t);
      case 6:
        var r = Fe,
          o = yt;
        (Fe = null),
          Jt(e, t, n),
          (Fe = r),
          (yt = o),
          Fe !== null &&
            (yt
              ? ((e = Fe),
                (n = n.stateNode),
                e.nodeType === 8
                  ? e.parentNode.removeChild(n)
                  : e.removeChild(n))
              : Fe.removeChild(n.stateNode));
        break;
      case 18:
        Fe !== null &&
          (yt
            ? ((e = Fe),
              (n = n.stateNode),
              e.nodeType === 8
                ? si(e.parentNode, n)
                : e.nodeType === 1 && si(e, n),
              gr(e))
            : si(Fe, n.stateNode));
        break;
      case 4:
        (r = Fe),
          (o = yt),
          (Fe = n.stateNode.containerInfo),
          (yt = !0),
          Jt(e, t, n),
          (Fe = r),
          (yt = o);
        break;
      case 0:
      case 11:
      case 14:
      case 15:
        if (
          !Ge &&
          ((r = n.updateQueue), r !== null && ((r = r.lastEffect), r !== null))
        ) {
          o = r = r.next;
          do {
            var i = o,
              u = i.destroy;
            (i = i.tag),
              u !== void 0 && ((i & 2) !== 0 || (i & 4) !== 0) && Vi(n, t, u),
              (o = o.next);
          } while (o !== r);
        }
        Jt(e, t, n);
        break;
      case 1:
        if (
          !Ge &&
          (Xn(n, t),
          (r = n.stateNode),
          typeof r.componentWillUnmount == "function")
        )
          try {
            (r.props = n.memoizedProps),
              (r.state = n.memoizedState),
              r.componentWillUnmount();
          } catch (p) {
            _e(n, t, p);
          }
        Jt(e, t, n);
        break;
      case 21:
        Jt(e, t, n);
        break;
      case 22:
        n.mode & 1
          ? ((Ge = (r = Ge) || n.memoizedState !== null), Jt(e, t, n), (Ge = r))
          : Jt(e, t, n);
        break;
      default:
        Jt(e, t, n);
    }
  }
  function dc(e) {
    var t = e.updateQueue;
    if (t !== null) {
      e.updateQueue = null;
      var n = e.stateNode;
      n === null && (n = e.stateNode = new Ap()),
        t.forEach(function (r) {
          var o = Yp.bind(null, e, r);
          n.has(r) || (n.add(r), r.then(o, o));
        });
    }
  }
  function xt(e, t) {
    var n = t.deletions;
    if (n !== null)
      for (var r = 0; r < n.length; r++) {
        var o = n[r];
        try {
          var i = e,
            u = t,
            p = u;
          e: for (; p !== null; ) {
            switch (p.tag) {
              case 5:
                (Fe = p.stateNode), (yt = !1);
                break e;
              case 3:
                (Fe = p.stateNode.containerInfo), (yt = !0);
                break e;
              case 4:
                (Fe = p.stateNode.containerInfo), (yt = !0);
                break e;
            }
            p = p.return;
          }
          if (Fe === null) throw Error(s(160));
          cc(i, u, o), (Fe = null), (yt = !1);
          var h = o.alternate;
          h !== null && (h.return = null), (o.return = null);
        } catch (N) {
          _e(o, t, N);
        }
      }
    if (t.subtreeFlags & 12854)
      for (t = t.child; t !== null; ) fc(t, e), (t = t.sibling);
  }
  function fc(e, t) {
    var n = e.alternate,
      r = e.flags;
    switch (e.tag) {
      case 0:
      case 11:
      case 14:
      case 15:
        if ((xt(t, e), _t(e), r & 4)) {
          try {
            Ar(3, e, e.return), Uo(3, e);
          } catch (V) {
            _e(e, e.return, V);
          }
          try {
            Ar(5, e, e.return);
          } catch (V) {
            _e(e, e.return, V);
          }
        }
        break;
      case 1:
        xt(t, e), _t(e), r & 512 && n !== null && Xn(n, n.return);
        break;
      case 5:
        if (
          (xt(t, e),
          _t(e),
          r & 512 && n !== null && Xn(n, n.return),
          e.flags & 32)
        ) {
          var o = e.stateNode;
          try {
            lr(o, "");
          } catch (V) {
            _e(e, e.return, V);
          }
        }
        if (r & 4 && ((o = e.stateNode), o != null)) {
          var i = e.memoizedProps,
            u = n !== null ? n.memoizedProps : i,
            p = e.type,
            h = e.updateQueue;
          if (((e.updateQueue = null), h !== null))
            try {
              p === "input" && i.type === "radio" && i.name != null && Hs(o, i),
                Cl(p, u);
              var N = Cl(p, i);
              for (u = 0; u < h.length; u += 2) {
                var P = h[u],
                  T = h[u + 1];
                P === "style"
                  ? Ys(o, T)
                  : P === "dangerouslySetInnerHTML"
                  ? Gs(o, T)
                  : P === "children"
                  ? lr(o, T)
                  : oe(o, P, T, N);
              }
              switch (p) {
                case "input":
                  wl(o, i);
                  break;
                case "textarea":
                  Bs(o, i);
                  break;
                case "select":
                  var M = o._wrapperState.wasMultiple;
                  o._wrapperState.wasMultiple = !!i.multiple;
                  var A = i.value;
                  A != null
                    ? jn(o, !!i.multiple, A, !1)
                    : M !== !!i.multiple &&
                      (i.defaultValue != null
                        ? jn(o, !!i.multiple, i.defaultValue, !0)
                        : jn(o, !!i.multiple, i.multiple ? [] : "", !1));
              }
              o[_r] = i;
            } catch (V) {
              _e(e, e.return, V);
            }
        }
        break;
      case 6:
        if ((xt(t, e), _t(e), r & 4)) {
          if (e.stateNode === null) throw Error(s(162));
          (o = e.stateNode), (i = e.memoizedProps);
          try {
            o.nodeValue = i;
          } catch (V) {
            _e(e, e.return, V);
          }
        }
        break;
      case 3:
        if (
          (xt(t, e), _t(e), r & 4 && n !== null && n.memoizedState.isDehydrated)
        )
          try {
            gr(t.containerInfo);
          } catch (V) {
            _e(e, e.return, V);
          }
        break;
      case 4:
        xt(t, e), _t(e);
        break;
      case 13:
        xt(t, e),
          _t(e),
          (o = e.child),
          o.flags & 8192 &&
            ((i = o.memoizedState !== null),
            (o.stateNode.isHidden = i),
            !i ||
              (o.alternate !== null && o.alternate.memoizedState !== null) ||
              (Ki = be())),
          r & 4 && dc(e);
        break;
      case 22:
        if (
          ((P = n !== null && n.memoizedState !== null),
          e.mode & 1 ? ((Ge = (N = Ge) || P), xt(t, e), (Ge = N)) : xt(t, e),
          _t(e),
          r & 8192)
        ) {
          if (
            ((N = e.memoizedState !== null),
            (e.stateNode.isHidden = N) && !P && (e.mode & 1) !== 0)
          )
            for (H = e, P = e.child; P !== null; ) {
              for (T = H = P; H !== null; ) {
                switch (((M = H), (A = M.child), M.tag)) {
                  case 0:
                  case 11:
                  case 14:
                  case 15:
                    Ar(4, M, M.return);
                    break;
                  case 1:
                    Xn(M, M.return);
                    var W = M.stateNode;
                    if (typeof W.componentWillUnmount == "function") {
                      (r = M), (n = M.return);
                      try {
                        (t = r),
                          (W.props = t.memoizedProps),
                          (W.state = t.memoizedState),
                          W.componentWillUnmount();
                      } catch (V) {
                        _e(r, n, V);
                      }
                    }
                    break;
                  case 5:
                    Xn(M, M.return);
                    break;
                  case 22:
                    if (M.memoizedState !== null) {
                      hc(T);
                      continue;
                    }
                }
                A !== null ? ((A.return = M), (H = A)) : hc(T);
              }
              P = P.sibling;
            }
          e: for (P = null, T = e; ; ) {
            if (T.tag === 5) {
              if (P === null) {
                P = T;
                try {
                  (o = T.stateNode),
                    N
                      ? ((i = o.style),
                        typeof i.setProperty == "function"
                          ? i.setProperty("display", "none", "important")
                          : (i.display = "none"))
                      : ((p = T.stateNode),
                        (h = T.memoizedProps.style),
                        (u =
                          h != null && h.hasOwnProperty("display")
                            ? h.display
                            : null),
                        (p.style.display = Xs("display", u)));
                } catch (V) {
                  _e(e, e.return, V);
                }
              }
            } else if (T.tag === 6) {
              if (P === null)
                try {
                  T.stateNode.nodeValue = N ? "" : T.memoizedProps;
                } catch (V) {
                  _e(e, e.return, V);
                }
            } else if (
              ((T.tag !== 22 && T.tag !== 23) ||
                T.memoizedState === null ||
                T === e) &&
              T.child !== null
            ) {
              (T.child.return = T), (T = T.child);
              continue;
            }
            if (T === e) break e;
            for (; T.sibling === null; ) {
              if (T.return === null || T.return === e) break e;
              P === T && (P = null), (T = T.return);
            }
            P === T && (P = null),
              (T.sibling.return = T.return),
              (T = T.sibling);
          }
        }
        break;
      case 19:
        xt(t, e), _t(e), r & 4 && dc(e);
        break;
      case 21:
        break;
      default:
        xt(t, e), _t(e);
    }
  }
  function _t(e) {
    var t = e.flags;
    if (t & 2) {
      try {
        e: {
          for (var n = e.return; n !== null; ) {
            if (ac(n)) {
              var r = n;
              break e;
            }
            n = n.return;
          }
          throw Error(s(160));
        }
        switch (r.tag) {
          case 5:
            var o = r.stateNode;
            r.flags & 32 && (lr(o, ""), (r.flags &= -33));
            var i = uc(e);
            Yi(e, i, o);
            break;
          case 3:
          case 4:
            var u = r.stateNode.containerInfo,
              p = uc(e);
            Xi(e, p, u);
            break;
          default:
            throw Error(s(161));
        }
      } catch (h) {
        _e(e, e.return, h);
      }
      e.flags &= -3;
    }
    t & 4096 && (e.flags &= -4097);
  }
  function Hp(e, t, n) {
    (H = e), pc(e);
  }
  function pc(e, t, n) {
    for (var r = (e.mode & 1) !== 0; H !== null; ) {
      var o = H,
        i = o.child;
      if (o.tag === 22 && r) {
        var u = o.memoizedState !== null || Ho;
        if (!u) {
          var p = o.alternate,
            h = (p !== null && p.memoizedState !== null) || Ge;
          p = Ho;
          var N = Ge;
          if (((Ho = u), (Ge = h) && !N))
            for (H = o; H !== null; )
              (u = H),
                (h = u.child),
                u.tag === 22 && u.memoizedState !== null
                  ? gc(o)
                  : h !== null
                  ? ((h.return = u), (H = h))
                  : gc(o);
          for (; i !== null; ) (H = i), pc(i), (i = i.sibling);
          (H = o), (Ho = p), (Ge = N);
        }
        mc(e);
      } else
        (o.subtreeFlags & 8772) !== 0 && i !== null
          ? ((i.return = o), (H = i))
          : mc(e);
    }
  }
  function mc(e) {
    for (; H !== null; ) {
      var t = H;
      if ((t.flags & 8772) !== 0) {
        var n = t.alternate;
        try {
          if ((t.flags & 8772) !== 0)
            switch (t.tag) {
              case 0:
              case 11:
              case 15:
                Ge || Uo(5, t);
                break;
              case 1:
                var r = t.stateNode;
                if (t.flags & 4 && !Ge)
                  if (n === null) r.componentDidMount();
                  else {
                    var o =
                      t.elementType === t.type
                        ? n.memoizedProps
                        : vt(t.type, n.memoizedProps);
                    r.componentDidUpdate(
                      o,
                      n.memoizedState,
                      r.__reactInternalSnapshotBeforeUpdate
                    );
                  }
                var i = t.updateQueue;
                i !== null && hu(t, i, r);
                break;
              case 3:
                var u = t.updateQueue;
                if (u !== null) {
                  if (((n = null), t.child !== null))
                    switch (t.child.tag) {
                      case 5:
                        n = t.child.stateNode;
                        break;
                      case 1:
                        n = t.child.stateNode;
                    }
                  hu(t, u, n);
                }
                break;
              case 5:
                var p = t.stateNode;
                if (n === null && t.flags & 4) {
                  n = p;
                  var h = t.memoizedProps;
                  switch (t.type) {
                    case "button":
                    case "input":
                    case "select":
                    case "textarea":
                      h.autoFocus && n.focus();
                      break;
                    case "img":
                      h.src && (n.src = h.src);
                  }
                }
                break;
              case 6:
                break;
              case 4:
                break;
              case 12:
                break;
              case 13:
                if (t.memoizedState === null) {
                  var N = t.alternate;
                  if (N !== null) {
                    var P = N.memoizedState;
                    if (P !== null) {
                      var T = P.dehydrated;
                      T !== null && gr(T);
                    }
                  }
                }
                break;
              case 19:
              case 17:
              case 21:
              case 22:
              case 23:
              case 25:
                break;
              default:
                throw Error(s(163));
            }
          Ge || (t.flags & 512 && Gi(t));
        } catch (M) {
          _e(t, t.return, M);
        }
      }
      if (t === e) {
        H = null;
        break;
      }
      if (((n = t.sibling), n !== null)) {
        (n.return = t.return), (H = n);
        break;
      }
      H = t.return;
    }
  }
  function hc(e) {
    for (; H !== null; ) {
      var t = H;
      if (t === e) {
        H = null;
        break;
      }
      var n = t.sibling;
      if (n !== null) {
        (n.return = t.return), (H = n);
        break;
      }
      H = t.return;
    }
  }
  function gc(e) {
    for (; H !== null; ) {
      var t = H;
      try {
        switch (t.tag) {
          case 0:
          case 11:
          case 15:
            var n = t.return;
            try {
              Uo(4, t);
            } catch (h) {
              _e(t, n, h);
            }
            break;
          case 1:
            var r = t.stateNode;
            if (typeof r.componentDidMount == "function") {
              var o = t.return;
              try {
                r.componentDidMount();
              } catch (h) {
                _e(t, o, h);
              }
            }
            var i = t.return;
            try {
              Gi(t);
            } catch (h) {
              _e(t, i, h);
            }
            break;
          case 5:
            var u = t.return;
            try {
              Gi(t);
            } catch (h) {
              _e(t, u, h);
            }
        }
      } catch (h) {
        _e(t, t.return, h);
      }
      if (t === e) {
        H = null;
        break;
      }
      var p = t.sibling;
      if (p !== null) {
        (p.return = t.return), (H = p);
        break;
      }
      H = t.return;
    }
  }
  var Up = Math.ceil,
    Wo = te.ReactCurrentDispatcher,
    Qi = te.ReactCurrentOwner,
    ft = te.ReactCurrentBatchConfig,
    fe = 0,
    De = null,
    Pe = null,
    He = 0,
    it = 0,
    Yn = Xt(0),
    Re = 0,
    Fr = null,
    yn = 0,
    Bo = 0,
    Zi = 0,
    Hr = null,
    et = null,
    Ki = 0,
    Qn = 1 / 0,
    Dt = null,
    $o = !1,
    Ji = null,
    qt = null,
    Vo = !1,
    en = null,
    Go = 0,
    Ur = 0,
    qi = null,
    Xo = -1,
    Yo = 0;
  function Ze() {
    return (fe & 6) !== 0 ? be() : Xo !== -1 ? Xo : (Xo = be());
  }
  function tn(e) {
    return (e.mode & 1) === 0
      ? 1
      : (fe & 2) !== 0 && He !== 0
      ? He & -He
      : Ep.transition !== null
      ? (Yo === 0 && (Yo = ua()), Yo)
      : ((e = ve),
        e !== 0 || ((e = window.event), (e = e === void 0 ? 16 : ya(e.type))),
        e);
  }
  function wt(e, t, n, r) {
    if (50 < Ur) throw ((Ur = 0), (qi = null), Error(s(185)));
    dr(e, n, r),
      ((fe & 2) === 0 || e !== De) &&
        (e === De && ((fe & 2) === 0 && (Bo |= n), Re === 4 && nn(e, He)),
        tt(e, r),
        n === 1 &&
          fe === 0 &&
          (t.mode & 1) === 0 &&
          ((Qn = be() + 500), No && Qt()));
  }
  function tt(e, t) {
    var n = e.callbackNode;
    Ef(e, t);
    var r = no(e, e === De ? He : 0);
    if (r === 0)
      n !== null && ia(n), (e.callbackNode = null), (e.callbackPriority = 0);
    else if (((t = r & -r), e.callbackPriority !== t)) {
      if ((n != null && ia(n), t === 1))
        e.tag === 0 ? Sp(yc.bind(null, e)) : ru(yc.bind(null, e)),
          xp(function () {
            (fe & 6) === 0 && Qt();
          }),
          (n = null);
      else {
        switch (ca(r)) {
          case 1:
            n = Rl;
            break;
          case 4:
            n = sa;
            break;
          case 16:
            n = Jr;
            break;
          case 536870912:
            n = aa;
            break;
          default:
            n = Jr;
        }
        n = jc(n, vc.bind(null, e));
      }
      (e.callbackPriority = t), (e.callbackNode = n);
    }
  }
  function vc(e, t) {
    if (((Xo = -1), (Yo = 0), (fe & 6) !== 0)) throw Error(s(327));
    var n = e.callbackNode;
    if (Zn() && e.callbackNode !== n) return null;
    var r = no(e, e === De ? He : 0);
    if (r === 0) return null;
    if ((r & 30) !== 0 || (r & e.expiredLanes) !== 0 || t) t = Qo(e, r);
    else {
      t = r;
      var o = fe;
      fe |= 2;
      var i = wc();
      (De !== e || He !== t) && ((Dt = null), (Qn = be() + 500), wn(e, t));
      do
        try {
          $p();
          break;
        } catch (p) {
          xc(e, p);
        }
      while (!0);
      vi(),
        (Wo.current = i),
        (fe = o),
        Pe !== null ? (t = 0) : ((De = null), (He = 0), (t = Re));
    }
    if (t !== 0) {
      if (
        (t === 2 && ((o = Tl(e)), o !== 0 && ((r = o), (t = es(e, o)))),
        t === 1)
      )
        throw ((n = Fr), wn(e, 0), nn(e, r), tt(e, be()), n);
      if (t === 6) nn(e, r);
      else {
        if (
          ((o = e.current.alternate),
          (r & 30) === 0 &&
            !Wp(o) &&
            ((t = Qo(e, r)),
            t === 2 && ((i = Tl(e)), i !== 0 && ((r = i), (t = es(e, i)))),
            t === 1))
        )
          throw ((n = Fr), wn(e, 0), nn(e, r), tt(e, be()), n);
        switch (((e.finishedWork = o), (e.finishedLanes = r), t)) {
          case 0:
          case 1:
            throw Error(s(345));
          case 2:
            kn(e, et, Dt);
            break;
          case 3:
            if (
              (nn(e, r),
              (r & 130023424) === r && ((t = Ki + 500 - be()), 10 < t))
            ) {
              if (no(e, 0) !== 0) break;
              if (((o = e.suspendedLanes), (o & r) !== r)) {
                Ze(), (e.pingedLanes |= e.suspendedLanes & o);
                break;
              }
              e.timeoutHandle = ii(kn.bind(null, e, et, Dt), t);
              break;
            }
            kn(e, et, Dt);
            break;
          case 4:
            if ((nn(e, r), (r & 4194240) === r)) break;
            for (t = e.eventTimes, o = -1; 0 < r; ) {
              var u = 31 - mt(r);
              (i = 1 << u), (u = t[u]), u > o && (o = u), (r &= ~i);
            }
            if (
              ((r = o),
              (r = be() - r),
              (r =
                (120 > r
                  ? 120
                  : 480 > r
                  ? 480
                  : 1080 > r
                  ? 1080
                  : 1920 > r
                  ? 1920
                  : 3e3 > r
                  ? 3e3
                  : 4320 > r
                  ? 4320
                  : 1960 * Up(r / 1960)) - r),
              10 < r)
            ) {
              e.timeoutHandle = ii(kn.bind(null, e, et, Dt), r);
              break;
            }
            kn(e, et, Dt);
            break;
          case 5:
            kn(e, et, Dt);
            break;
          default:
            throw Error(s(329));
        }
      }
    }
    return tt(e, be()), e.callbackNode === n ? vc.bind(null, e) : null;
  }
  function es(e, t) {
    var n = Hr;
    return (
      e.current.memoizedState.isDehydrated && (wn(e, t).flags |= 256),
      (e = Qo(e, t)),
      e !== 2 && ((t = et), (et = n), t !== null && ts(t)),
      e
    );
  }
  function ts(e) {
    et === null ? (et = e) : et.push.apply(et, e);
  }
  function Wp(e) {
    for (var t = e; ; ) {
      if (t.flags & 16384) {
        var n = t.updateQueue;
        if (n !== null && ((n = n.stores), n !== null))
          for (var r = 0; r < n.length; r++) {
            var o = n[r],
              i = o.getSnapshot;
            o = o.value;
            try {
              if (!ht(i(), o)) return !1;
            } catch {
              return !1;
            }
          }
      }
      if (((n = t.child), t.subtreeFlags & 16384 && n !== null))
        (n.return = t), (t = n);
      else {
        if (t === e) break;
        for (; t.sibling === null; ) {
          if (t.return === null || t.return === e) return !0;
          t = t.return;
        }
        (t.sibling.return = t.return), (t = t.sibling);
      }
    }
    return !0;
  }
  function nn(e, t) {
    for (
      t &= ~Zi,
        t &= ~Bo,
        e.suspendedLanes |= t,
        e.pingedLanes &= ~t,
        e = e.expirationTimes;
      0 < t;

    ) {
      var n = 31 - mt(t),
        r = 1 << n;
      (e[n] = -1), (t &= ~r);
    }
  }
  function yc(e) {
    if ((fe & 6) !== 0) throw Error(s(327));
    Zn();
    var t = no(e, 0);
    if ((t & 1) === 0) return tt(e, be()), null;
    var n = Qo(e, t);
    if (e.tag !== 0 && n === 2) {
      var r = Tl(e);
      r !== 0 && ((t = r), (n = es(e, r)));
    }
    if (n === 1) throw ((n = Fr), wn(e, 0), nn(e, t), tt(e, be()), n);
    if (n === 6) throw Error(s(345));
    return (
      (e.finishedWork = e.current.alternate),
      (e.finishedLanes = t),
      kn(e, et, Dt),
      tt(e, be()),
      null
    );
  }
  function ns(e, t) {
    var n = fe;
    fe |= 1;
    try {
      return e(t);
    } finally {
      (fe = n), fe === 0 && ((Qn = be() + 500), No && Qt());
    }
  }
  function xn(e) {
    en !== null && en.tag === 0 && (fe & 6) === 0 && Zn();
    var t = fe;
    fe |= 1;
    var n = ft.transition,
      r = ve;
    try {
      if (((ft.transition = null), (ve = 1), e)) return e();
    } finally {
      (ve = r), (ft.transition = n), (fe = t), (fe & 6) === 0 && Qt();
    }
  }
  function rs() {
    (it = Yn.current), we(Yn);
  }
  function wn(e, t) {
    (e.finishedWork = null), (e.finishedLanes = 0);
    var n = e.timeoutHandle;
    if ((n !== -1 && ((e.timeoutHandle = -1), yp(n)), Pe !== null))
      for (n = Pe.return; n !== null; ) {
        var r = n;
        switch ((fi(r), r.tag)) {
          case 1:
            (r = r.type.childContextTypes), r != null && wo();
            break;
          case 3:
            Vn(), we(Ke), we(Be), Ci();
            break;
          case 5:
            Si(r);
            break;
          case 4:
            Vn();
            break;
          case 13:
            we(Ce);
            break;
          case 19:
            we(Ce);
            break;
          case 10:
            yi(r.type._context);
            break;
          case 22:
          case 23:
            rs();
        }
        n = n.return;
      }
    if (
      ((De = e),
      (Pe = e = rn(e.current, null)),
      (He = it = t),
      (Re = 0),
      (Fr = null),
      (Zi = Bo = yn = 0),
      (et = Hr = null),
      hn !== null)
    ) {
      for (t = 0; t < hn.length; t++)
        if (((n = hn[t]), (r = n.interleaved), r !== null)) {
          n.interleaved = null;
          var o = r.next,
            i = n.pending;
          if (i !== null) {
            var u = i.next;
            (i.next = o), (r.next = u);
          }
          n.pending = r;
        }
      hn = null;
    }
    return e;
  }
  function xc(e, t) {
    do {
      var n = Pe;
      try {
        if ((vi(), (Ro.current = Do), To)) {
          for (var r = je.memoizedState; r !== null; ) {
            var o = r.queue;
            o !== null && (o.pending = null), (r = r.next);
          }
          To = !1;
        }
        if (
          ((vn = 0),
          (Oe = ze = je = null),
          (Tr = !1),
          (Ir = 0),
          (Qi.current = null),
          n === null || n.return === null)
        ) {
          (Re = 1), (Fr = t), (Pe = null);
          break;
        }
        e: {
          var i = e,
            u = n.return,
            p = n,
            h = t;
          if (
            ((t = He),
            (p.flags |= 32768),
            h !== null && typeof h == "object" && typeof h.then == "function")
          ) {
            var N = h,
              P = p,
              T = P.tag;
            if ((P.mode & 1) === 0 && (T === 0 || T === 11 || T === 15)) {
              var M = P.alternate;
              M
                ? ((P.updateQueue = M.updateQueue),
                  (P.memoizedState = M.memoizedState),
                  (P.lanes = M.lanes))
                : ((P.updateQueue = null), (P.memoizedState = null));
            }
            var A = $u(u);
            if (A !== null) {
              (A.flags &= -257),
                Vu(A, u, p, i, t),
                A.mode & 1 && Bu(i, N, t),
                (t = A),
                (h = N);
              var W = t.updateQueue;
              if (W === null) {
                var V = new Set();
                V.add(h), (t.updateQueue = V);
              } else W.add(h);
              break e;
            } else {
              if ((t & 1) === 0) {
                Bu(i, N, t), os();
                break e;
              }
              h = Error(s(426));
            }
          } else if (Se && p.mode & 1) {
            var Me = $u(u);
            if (Me !== null) {
              (Me.flags & 65536) === 0 && (Me.flags |= 256),
                Vu(Me, u, p, i, t),
                hi(Gn(h, p));
              break e;
            }
          }
          (i = h = Gn(h, p)),
            Re !== 4 && (Re = 2),
            Hr === null ? (Hr = [i]) : Hr.push(i),
            (i = u);
          do {
            switch (i.tag) {
              case 3:
                (i.flags |= 65536), (t &= -t), (i.lanes |= t);
                var x = Uu(i, h, t);
                mu(i, x);
                break e;
              case 1:
                p = h;
                var g = i.type,
                  k = i.stateNode;
                if (
                  (i.flags & 128) === 0 &&
                  (typeof g.getDerivedStateFromError == "function" ||
                    (k !== null &&
                      typeof k.componentDidCatch == "function" &&
                      (qt === null || !qt.has(k))))
                ) {
                  (i.flags |= 65536), (t &= -t), (i.lanes |= t);
                  var I = Wu(i, p, t);
                  mu(i, I);
                  break e;
                }
            }
            i = i.return;
          } while (i !== null);
        }
        Nc(n);
      } catch (G) {
        (t = G), Pe === n && n !== null && (Pe = n = n.return);
        continue;
      }
      break;
    } while (!0);
  }
  function wc() {
    var e = Wo.current;
    return (Wo.current = Do), e === null ? Do : e;
  }
  function os() {
    (Re === 0 || Re === 3 || Re === 2) && (Re = 4),
      De === null ||
        ((yn & 268435455) === 0 && (Bo & 268435455) === 0) ||
        nn(De, He);
  }
  function Qo(e, t) {
    var n = fe;
    fe |= 2;
    var r = wc();
    (De !== e || He !== t) && ((Dt = null), wn(e, t));
    do
      try {
        Bp();
        break;
      } catch (o) {
        xc(e, o);
      }
    while (!0);
    if ((vi(), (fe = n), (Wo.current = r), Pe !== null)) throw Error(s(261));
    return (De = null), (He = 0), Re;
  }
  function Bp() {
    for (; Pe !== null; ) kc(Pe);
  }
  function $p() {
    for (; Pe !== null && !hf(); ) kc(Pe);
  }
  function kc(e) {
    var t = Cc(e.alternate, e, it);
    (e.memoizedProps = e.pendingProps),
      t === null ? Nc(e) : (Pe = t),
      (Qi.current = null);
  }
  function Nc(e) {
    var t = e;
    do {
      var n = t.alternate;
      if (((e = t.return), (t.flags & 32768) === 0)) {
        if (((n = Dp(n, t, it)), n !== null)) {
          Pe = n;
          return;
        }
      } else {
        if (((n = Lp(n, t)), n !== null)) {
          (n.flags &= 32767), (Pe = n);
          return;
        }
        if (e !== null)
          (e.flags |= 32768), (e.subtreeFlags = 0), (e.deletions = null);
        else {
          (Re = 6), (Pe = null);
          return;
        }
      }
      if (((t = t.sibling), t !== null)) {
        Pe = t;
        return;
      }
      Pe = t = e;
    } while (t !== null);
    Re === 0 && (Re = 5);
  }
  function kn(e, t, n) {
    var r = ve,
      o = ft.transition;
    try {
      (ft.transition = null), (ve = 1), Vp(e, t, n, r);
    } finally {
      (ft.transition = o), (ve = r);
    }
    return null;
  }
  function Vp(e, t, n, r) {
    do Zn();
    while (en !== null);
    if ((fe & 6) !== 0) throw Error(s(327));
    n = e.finishedWork;
    var o = e.finishedLanes;
    if (n === null) return null;
    if (((e.finishedWork = null), (e.finishedLanes = 0), n === e.current))
      throw Error(s(177));
    (e.callbackNode = null), (e.callbackPriority = 0);
    var i = n.lanes | n.childLanes;
    if (
      (Cf(e, i),
      e === De && ((Pe = De = null), (He = 0)),
      ((n.subtreeFlags & 2064) === 0 && (n.flags & 2064) === 0) ||
        Vo ||
        ((Vo = !0),
        jc(Jr, function () {
          return Zn(), null;
        })),
      (i = (n.flags & 15990) !== 0),
      (n.subtreeFlags & 15990) !== 0 || i)
    ) {
      (i = ft.transition), (ft.transition = null);
      var u = ve;
      ve = 1;
      var p = fe;
      (fe |= 4),
        (Qi.current = null),
        Fp(e, n),
        fc(n, e),
        dp(oi),
        (lo = !!ri),
        (oi = ri = null),
        (e.current = n),
        Hp(n),
        gf(),
        (fe = p),
        (ve = u),
        (ft.transition = i);
    } else e.current = n;
    if (
      (Vo && ((Vo = !1), (en = e), (Go = o)),
      (i = e.pendingLanes),
      i === 0 && (qt = null),
      xf(n.stateNode),
      tt(e, be()),
      t !== null)
    )
      for (r = e.onRecoverableError, n = 0; n < t.length; n++)
        (o = t[n]), r(o.value, { componentStack: o.stack, digest: o.digest });
    if ($o) throw (($o = !1), (e = Ji), (Ji = null), e);
    return (
      (Go & 1) !== 0 && e.tag !== 0 && Zn(),
      (i = e.pendingLanes),
      (i & 1) !== 0 ? (e === qi ? Ur++ : ((Ur = 0), (qi = e))) : (Ur = 0),
      Qt(),
      null
    );
  }
  function Zn() {
    if (en !== null) {
      var e = ca(Go),
        t = ft.transition,
        n = ve;
      try {
        if (((ft.transition = null), (ve = 16 > e ? 16 : e), en === null))
          var r = !1;
        else {
          if (((e = en), (en = null), (Go = 0), (fe & 6) !== 0))
            throw Error(s(331));
          var o = fe;
          for (fe |= 4, H = e.current; H !== null; ) {
            var i = H,
              u = i.child;
            if ((H.flags & 16) !== 0) {
              var p = i.deletions;
              if (p !== null) {
                for (var h = 0; h < p.length; h++) {
                  var N = p[h];
                  for (H = N; H !== null; ) {
                    var P = H;
                    switch (P.tag) {
                      case 0:
                      case 11:
                      case 15:
                        Ar(8, P, i);
                    }
                    var T = P.child;
                    if (T !== null) (T.return = P), (H = T);
                    else
                      for (; H !== null; ) {
                        P = H;
                        var M = P.sibling,
                          A = P.return;
                        if ((sc(P), P === N)) {
                          H = null;
                          break;
                        }
                        if (M !== null) {
                          (M.return = A), (H = M);
                          break;
                        }
                        H = A;
                      }
                  }
                }
                var W = i.alternate;
                if (W !== null) {
                  var V = W.child;
                  if (V !== null) {
                    W.child = null;
                    do {
                      var Me = V.sibling;
                      (V.sibling = null), (V = Me);
                    } while (V !== null);
                  }
                }
                H = i;
              }
            }
            if ((i.subtreeFlags & 2064) !== 0 && u !== null)
              (u.return = i), (H = u);
            else
              e: for (; H !== null; ) {
                if (((i = H), (i.flags & 2048) !== 0))
                  switch (i.tag) {
                    case 0:
                    case 11:
                    case 15:
                      Ar(9, i, i.return);
                  }
                var x = i.sibling;
                if (x !== null) {
                  (x.return = i.return), (H = x);
                  break e;
                }
                H = i.return;
              }
          }
          var g = e.current;
          for (H = g; H !== null; ) {
            u = H;
            var k = u.child;
            if ((u.subtreeFlags & 2064) !== 0 && k !== null)
              (k.return = u), (H = k);
            else
              e: for (u = g; H !== null; ) {
                if (((p = H), (p.flags & 2048) !== 0))
                  try {
                    switch (p.tag) {
                      case 0:
                      case 11:
                      case 15:
                        Uo(9, p);
                    }
                  } catch (G) {
                    _e(p, p.return, G);
                  }
                if (p === u) {
                  H = null;
                  break e;
                }
                var I = p.sibling;
                if (I !== null) {
                  (I.return = p.return), (H = I);
                  break e;
                }
                H = p.return;
              }
          }
          if (
            ((fe = o),
            Qt(),
            St && typeof St.onPostCommitFiberRoot == "function")
          )
            try {
              St.onPostCommitFiberRoot(qr, e);
            } catch {}
          r = !0;
        }
        return r;
      } finally {
        (ve = n), (ft.transition = t);
      }
    }
    return !1;
  }
  function Sc(e, t, n) {
    (t = Gn(n, t)),
      (t = Uu(e, t, 1)),
      (e = Kt(e, t, 1)),
      (t = Ze()),
      e !== null && (dr(e, 1, t), tt(e, t));
  }
  function _e(e, t, n) {
    if (e.tag === 3) Sc(e, e, n);
    else
      for (; t !== null; ) {
        if (t.tag === 3) {
          Sc(t, e, n);
          break;
        } else if (t.tag === 1) {
          var r = t.stateNode;
          if (
            typeof t.type.getDerivedStateFromError == "function" ||
            (typeof r.componentDidCatch == "function" &&
              (qt === null || !qt.has(r)))
          ) {
            (e = Gn(n, e)),
              (e = Wu(t, e, 1)),
              (t = Kt(t, e, 1)),
              (e = Ze()),
              t !== null && (dr(t, 1, e), tt(t, e));
            break;
          }
        }
        t = t.return;
      }
  }
  function Gp(e, t, n) {
    var r = e.pingCache;
    r !== null && r.delete(t),
      (t = Ze()),
      (e.pingedLanes |= e.suspendedLanes & n),
      De === e &&
        (He & n) === n &&
        (Re === 4 || (Re === 3 && (He & 130023424) === He && 500 > be() - Ki)
          ? wn(e, 0)
          : (Zi |= n)),
      tt(e, t);
  }
  function Ec(e, t) {
    t === 0 &&
      ((e.mode & 1) === 0
        ? (t = 1)
        : ((t = to), (to <<= 1), (to & 130023424) === 0 && (to = 4194304)));
    var n = Ze();
    (e = Tt(e, t)), e !== null && (dr(e, t, n), tt(e, n));
  }
  function Xp(e) {
    var t = e.memoizedState,
      n = 0;
    t !== null && (n = t.retryLane), Ec(e, n);
  }
  function Yp(e, t) {
    var n = 0;
    switch (e.tag) {
      case 13:
        var r = e.stateNode,
          o = e.memoizedState;
        o !== null && (n = o.retryLane);
        break;
      case 19:
        r = e.stateNode;
        break;
      default:
        throw Error(s(314));
    }
    r !== null && r.delete(t), Ec(e, n);
  }
  var Cc;
  Cc = function (e, t, n) {
    if (e !== null)
      if (e.memoizedProps !== t.pendingProps || Ke.current) qe = !0;
      else {
        if ((e.lanes & n) === 0 && (t.flags & 128) === 0)
          return (qe = !1), Op(e, t, n);
        qe = (e.flags & 131072) !== 0;
      }
    else (qe = !1), Se && (t.flags & 1048576) !== 0 && ou(t, Eo, t.index);
    switch (((t.lanes = 0), t.tag)) {
      case 2:
        var r = t.type;
        Fo(e, t), (e = t.pendingProps);
        var o = An(t, Be.current);
        $n(t, n), (o = bi(null, t, r, e, o, n));
        var i = Mi();
        return (
          (t.flags |= 1),
          typeof o == "object" &&
          o !== null &&
          typeof o.render == "function" &&
          o.$$typeof === void 0
            ? ((t.tag = 1),
              (t.memoizedState = null),
              (t.updateQueue = null),
              Je(r) ? ((i = !0), ko(t)) : (i = !1),
              (t.memoizedState =
                o.state !== null && o.state !== void 0 ? o.state : null),
              ki(t),
              (o.updater = Lo),
              (t.stateNode = o),
              (o._reactInternals = t),
              Oi(t, r, e, n),
              (t = Fi(null, t, r, !0, i, n)))
            : ((t.tag = 0), Se && i && di(t), Qe(null, t, o, n), (t = t.child)),
          t
        );
      case 16:
        r = t.elementType;
        e: {
          switch (
            (Fo(e, t),
            (e = t.pendingProps),
            (o = r._init),
            (r = o(r._payload)),
            (t.type = r),
            (o = t.tag = Zp(r)),
            (e = vt(r, e)),
            o)
          ) {
            case 0:
              t = Ai(null, t, r, e, n);
              break e;
            case 1:
              t = Ku(null, t, r, e, n);
              break e;
            case 11:
              t = Gu(null, t, r, e, n);
              break e;
            case 14:
              t = Xu(null, t, r, vt(r.type, e), n);
              break e;
          }
          throw Error(s(306, r, ""));
        }
        return t;
      case 0:
        return (
          (r = t.type),
          (o = t.pendingProps),
          (o = t.elementType === r ? o : vt(r, o)),
          Ai(e, t, r, o, n)
        );
      case 1:
        return (
          (r = t.type),
          (o = t.pendingProps),
          (o = t.elementType === r ? o : vt(r, o)),
          Ku(e, t, r, o, n)
        );
      case 3:
        e: {
          if ((Ju(t), e === null)) throw Error(s(387));
          (r = t.pendingProps),
            (i = t.memoizedState),
            (o = i.element),
            pu(e, t),
            Po(t, r, null, n);
          var u = t.memoizedState;
          if (((r = u.element), i.isDehydrated))
            if (
              ((i = {
                element: r,
                isDehydrated: !1,
                cache: u.cache,
                pendingSuspenseBoundaries: u.pendingSuspenseBoundaries,
                transitions: u.transitions,
              }),
              (t.updateQueue.baseState = i),
              (t.memoizedState = i),
              t.flags & 256)
            ) {
              (o = Gn(Error(s(423)), t)), (t = qu(e, t, r, n, o));
              break e;
            } else if (r !== o) {
              (o = Gn(Error(s(424)), t)), (t = qu(e, t, r, n, o));
              break e;
            } else
              for (
                lt = Gt(t.stateNode.containerInfo.firstChild),
                  ot = t,
                  Se = !0,
                  gt = null,
                  n = du(t, null, r, n),
                  t.child = n;
                n;

              )
                (n.flags = (n.flags & -3) | 4096), (n = n.sibling);
          else {
            if ((Un(), r === o)) {
              t = Ot(e, t, n);
              break e;
            }
            Qe(e, t, r, n);
          }
          t = t.child;
        }
        return t;
      case 5:
        return (
          gu(t),
          e === null && mi(t),
          (r = t.type),
          (o = t.pendingProps),
          (i = e !== null ? e.memoizedProps : null),
          (u = o.children),
          li(r, o) ? (u = null) : i !== null && li(r, i) && (t.flags |= 32),
          Zu(e, t),
          Qe(e, t, u, n),
          t.child
        );
      case 6:
        return e === null && mi(t), null;
      case 13:
        return ec(e, t, n);
      case 4:
        return (
          Ni(t, t.stateNode.containerInfo),
          (r = t.pendingProps),
          e === null ? (t.child = Wn(t, null, r, n)) : Qe(e, t, r, n),
          t.child
        );
      case 11:
        return (
          (r = t.type),
          (o = t.pendingProps),
          (o = t.elementType === r ? o : vt(r, o)),
          Gu(e, t, r, o, n)
        );
      case 7:
        return Qe(e, t, t.pendingProps, n), t.child;
      case 8:
        return Qe(e, t, t.pendingProps.children, n), t.child;
      case 12:
        return Qe(e, t, t.pendingProps.children, n), t.child;
      case 10:
        e: {
          if (
            ((r = t.type._context),
            (o = t.pendingProps),
            (i = t.memoizedProps),
            (u = o.value),
            ye(_o, r._currentValue),
            (r._currentValue = u),
            i !== null)
          )
            if (ht(i.value, u)) {
              if (i.children === o.children && !Ke.current) {
                t = Ot(e, t, n);
                break e;
              }
            } else
              for (i = t.child, i !== null && (i.return = t); i !== null; ) {
                var p = i.dependencies;
                if (p !== null) {
                  u = i.child;
                  for (var h = p.firstContext; h !== null; ) {
                    if (h.context === r) {
                      if (i.tag === 1) {
                        (h = It(-1, n & -n)), (h.tag = 2);
                        var N = i.updateQueue;
                        if (N !== null) {
                          N = N.shared;
                          var P = N.pending;
                          P === null
                            ? (h.next = h)
                            : ((h.next = P.next), (P.next = h)),
                            (N.pending = h);
                        }
                      }
                      (i.lanes |= n),
                        (h = i.alternate),
                        h !== null && (h.lanes |= n),
                        xi(i.return, n, t),
                        (p.lanes |= n);
                      break;
                    }
                    h = h.next;
                  }
                } else if (i.tag === 10) u = i.type === t.type ? null : i.child;
                else if (i.tag === 18) {
                  if (((u = i.return), u === null)) throw Error(s(341));
                  (u.lanes |= n),
                    (p = u.alternate),
                    p !== null && (p.lanes |= n),
                    xi(u, n, t),
                    (u = i.sibling);
                } else u = i.child;
                if (u !== null) u.return = i;
                else
                  for (u = i; u !== null; ) {
                    if (u === t) {
                      u = null;
                      break;
                    }
                    if (((i = u.sibling), i !== null)) {
                      (i.return = u.return), (u = i);
                      break;
                    }
                    u = u.return;
                  }
                i = u;
              }
          Qe(e, t, o.children, n), (t = t.child);
        }
        return t;
      case 9:
        return (
          (o = t.type),
          (r = t.pendingProps.children),
          $n(t, n),
          (o = ct(o)),
          (r = r(o)),
          (t.flags |= 1),
          Qe(e, t, r, n),
          t.child
        );
      case 14:
        return (
          (r = t.type),
          (o = vt(r, t.pendingProps)),
          (o = vt(r.type, o)),
          Xu(e, t, r, o, n)
        );
      case 15:
        return Yu(e, t, t.type, t.pendingProps, n);
      case 17:
        return (
          (r = t.type),
          (o = t.pendingProps),
          (o = t.elementType === r ? o : vt(r, o)),
          Fo(e, t),
          (t.tag = 1),
          Je(r) ? ((e = !0), ko(t)) : (e = !1),
          $n(t, n),
          Fu(t, r, o),
          Oi(t, r, o, n),
          Fi(null, t, r, !0, e, n)
        );
      case 19:
        return nc(e, t, n);
      case 22:
        return Qu(e, t, n);
    }
    throw Error(s(156, t.tag));
  };
  function jc(e, t) {
    return la(e, t);
  }
  function Qp(e, t, n, r) {
    (this.tag = e),
      (this.key = n),
      (this.sibling =
        this.child =
        this.return =
        this.stateNode =
        this.type =
        this.elementType =
          null),
      (this.index = 0),
      (this.ref = null),
      (this.pendingProps = t),
      (this.dependencies =
        this.memoizedState =
        this.updateQueue =
        this.memoizedProps =
          null),
      (this.mode = r),
      (this.subtreeFlags = this.flags = 0),
      (this.deletions = null),
      (this.childLanes = this.lanes = 0),
      (this.alternate = null);
  }
  function pt(e, t, n, r) {
    return new Qp(e, t, n, r);
  }
  function ls(e) {
    return (e = e.prototype), !(!e || !e.isReactComponent);
  }
  function Zp(e) {
    if (typeof e == "function") return ls(e) ? 1 : 0;
    if (e != null) {
      if (((e = e.$$typeof), e === Xe)) return 11;
      if (e === Ae) return 14;
    }
    return 2;
  }
  function rn(e, t) {
    var n = e.alternate;
    return (
      n === null
        ? ((n = pt(e.tag, t, e.key, e.mode)),
          (n.elementType = e.elementType),
          (n.type = e.type),
          (n.stateNode = e.stateNode),
          (n.alternate = e),
          (e.alternate = n))
        : ((n.pendingProps = t),
          (n.type = e.type),
          (n.flags = 0),
          (n.subtreeFlags = 0),
          (n.deletions = null)),
      (n.flags = e.flags & 14680064),
      (n.childLanes = e.childLanes),
      (n.lanes = e.lanes),
      (n.child = e.child),
      (n.memoizedProps = e.memoizedProps),
      (n.memoizedState = e.memoizedState),
      (n.updateQueue = e.updateQueue),
      (t = e.dependencies),
      (n.dependencies =
        t === null ? null : { lanes: t.lanes, firstContext: t.firstContext }),
      (n.sibling = e.sibling),
      (n.index = e.index),
      (n.ref = e.ref),
      n
    );
  }
  function Zo(e, t, n, r, o, i) {
    var u = 2;
    if (((r = e), typeof e == "function")) ls(e) && (u = 1);
    else if (typeof e == "string") u = 5;
    else
      e: switch (e) {
        case ee:
          return Nn(n.children, o, i, t);
        case U:
          (u = 8), (o |= 8);
          break;
        case ke:
          return (
            (e = pt(12, n, t, o | 2)), (e.elementType = ke), (e.lanes = i), e
          );
        case We:
          return (e = pt(13, n, t, o)), (e.elementType = We), (e.lanes = i), e;
        case Ye:
          return (e = pt(19, n, t, o)), (e.elementType = Ye), (e.lanes = i), e;
        case he:
          return Ko(n, o, i, t);
        default:
          if (typeof e == "object" && e !== null)
            switch (e.$$typeof) {
              case Ue:
                u = 10;
                break e;
              case Nt:
                u = 9;
                break e;
              case Xe:
                u = 11;
                break e;
              case Ae:
                u = 14;
                break e;
              case Ne:
                (u = 16), (r = null);
                break e;
            }
          throw Error(s(130, e == null ? e : typeof e, ""));
      }
    return (
      (t = pt(u, n, t, o)), (t.elementType = e), (t.type = r), (t.lanes = i), t
    );
  }
  function Nn(e, t, n, r) {
    return (e = pt(7, e, r, t)), (e.lanes = n), e;
  }
  function Ko(e, t, n, r) {
    return (
      (e = pt(22, e, r, t)),
      (e.elementType = he),
      (e.lanes = n),
      (e.stateNode = { isHidden: !1 }),
      e
    );
  }
  function is(e, t, n) {
    return (e = pt(6, e, null, t)), (e.lanes = n), e;
  }
  function ss(e, t, n) {
    return (
      (t = pt(4, e.children !== null ? e.children : [], e.key, t)),
      (t.lanes = n),
      (t.stateNode = {
        containerInfo: e.containerInfo,
        pendingChildren: null,
        implementation: e.implementation,
      }),
      t
    );
  }
  function Kp(e, t, n, r, o) {
    (this.tag = t),
      (this.containerInfo = e),
      (this.finishedWork =
        this.pingCache =
        this.current =
        this.pendingChildren =
          null),
      (this.timeoutHandle = -1),
      (this.callbackNode = this.pendingContext = this.context = null),
      (this.callbackPriority = 0),
      (this.eventTimes = Il(0)),
      (this.expirationTimes = Il(-1)),
      (this.entangledLanes =
        this.finishedLanes =
        this.mutableReadLanes =
        this.expiredLanes =
        this.pingedLanes =
        this.suspendedLanes =
        this.pendingLanes =
          0),
      (this.entanglements = Il(0)),
      (this.identifierPrefix = r),
      (this.onRecoverableError = o),
      (this.mutableSourceEagerHydrationData = null);
  }
  function as(e, t, n, r, o, i, u, p, h) {
    return (
      (e = new Kp(e, t, n, p, h)),
      t === 1 ? ((t = 1), i === !0 && (t |= 8)) : (t = 0),
      (i = pt(3, null, null, t)),
      (e.current = i),
      (i.stateNode = e),
      (i.memoizedState = {
        element: r,
        isDehydrated: n,
        cache: null,
        transitions: null,
        pendingSuspenseBoundaries: null,
      }),
      ki(i),
      e
    );
  }
  function Jp(e, t, n) {
    var r =
      3 < arguments.length && arguments[3] !== void 0 ? arguments[3] : null;
    return {
      $$typeof: de,
      key: r == null ? null : "" + r,
      children: e,
      containerInfo: t,
      implementation: n,
    };
  }
  function _c(e) {
    if (!e) return Yt;
    e = e._reactInternals;
    e: {
      if (cn(e) !== e || e.tag !== 1) throw Error(s(170));
      var t = e;
      do {
        switch (t.tag) {
          case 3:
            t = t.stateNode.context;
            break e;
          case 1:
            if (Je(t.type)) {
              t = t.stateNode.__reactInternalMemoizedMergedChildContext;
              break e;
            }
        }
        t = t.return;
      } while (t !== null);
      throw Error(s(171));
    }
    if (e.tag === 1) {
      var n = e.type;
      if (Je(n)) return tu(e, n, t);
    }
    return t;
  }
  function bc(e, t, n, r, o, i, u, p, h) {
    return (
      (e = as(n, r, !0, e, o, i, u, p, h)),
      (e.context = _c(null)),
      (n = e.current),
      (r = Ze()),
      (o = tn(n)),
      (i = It(r, o)),
      (i.callback = t ?? null),
      Kt(n, i, o),
      (e.current.lanes = o),
      dr(e, o, r),
      tt(e, r),
      e
    );
  }
  function Jo(e, t, n, r) {
    var o = t.current,
      i = Ze(),
      u = tn(o);
    return (
      (n = _c(n)),
      t.context === null ? (t.context = n) : (t.pendingContext = n),
      (t = It(i, u)),
      (t.payload = { element: e }),
      (r = r === void 0 ? null : r),
      r !== null && (t.callback = r),
      (e = Kt(o, t, u)),
      e !== null && (wt(e, o, u, i), Mo(e, o, u)),
      u
    );
  }
  function qo(e) {
    if (((e = e.current), !e.child)) return null;
    switch (e.child.tag) {
      case 5:
        return e.child.stateNode;
      default:
        return e.child.stateNode;
    }
  }
  function Mc(e, t) {
    if (((e = e.memoizedState), e !== null && e.dehydrated !== null)) {
      var n = e.retryLane;
      e.retryLane = n !== 0 && n < t ? n : t;
    }
  }
  function us(e, t) {
    Mc(e, t), (e = e.alternate) && Mc(e, t);
  }
  function qp() {
    return null;
  }
  var Pc =
    typeof reportError == "function"
      ? reportError
      : function (e) {
          console.error(e);
        };
  function cs(e) {
    this._internalRoot = e;
  }
  (el.prototype.render = cs.prototype.render =
    function (e) {
      var t = this._internalRoot;
      if (t === null) throw Error(s(409));
      Jo(e, t, null, null);
    }),
    (el.prototype.unmount = cs.prototype.unmount =
      function () {
        var e = this._internalRoot;
        if (e !== null) {
          this._internalRoot = null;
          var t = e.containerInfo;
          xn(function () {
            Jo(null, e, null, null);
          }),
            (t[Mt] = null);
        }
      });
  function el(e) {
    this._internalRoot = e;
  }
  el.prototype.unstable_scheduleHydration = function (e) {
    if (e) {
      var t = pa();
      e = { blockedOn: null, target: e, priority: t };
      for (var n = 0; n < Bt.length && t !== 0 && t < Bt[n].priority; n++);
      Bt.splice(n, 0, e), n === 0 && ga(e);
    }
  };
  function ds(e) {
    return !(!e || (e.nodeType !== 1 && e.nodeType !== 9 && e.nodeType !== 11));
  }
  function tl(e) {
    return !(
      !e ||
      (e.nodeType !== 1 &&
        e.nodeType !== 9 &&
        e.nodeType !== 11 &&
        (e.nodeType !== 8 || e.nodeValue !== " react-mount-point-unstable "))
    );
  }
  function zc() {}
  function em(e, t, n, r, o) {
    if (o) {
      if (typeof r == "function") {
        var i = r;
        r = function () {
          var N = qo(u);
          i.call(N);
        };
      }
      var u = bc(t, r, e, 0, null, !1, !1, "", zc);
      return (
        (e._reactRootContainer = u),
        (e[Mt] = u.current),
        Cr(e.nodeType === 8 ? e.parentNode : e),
        xn(),
        u
      );
    }
    for (; (o = e.lastChild); ) e.removeChild(o);
    if (typeof r == "function") {
      var p = r;
      r = function () {
        var N = qo(h);
        p.call(N);
      };
    }
    var h = as(e, 0, !1, null, null, !1, !1, "", zc);
    return (
      (e._reactRootContainer = h),
      (e[Mt] = h.current),
      Cr(e.nodeType === 8 ? e.parentNode : e),
      xn(function () {
        Jo(t, h, n, r);
      }),
      h
    );
  }
  function nl(e, t, n, r, o) {
    var i = n._reactRootContainer;
    if (i) {
      var u = i;
      if (typeof o == "function") {
        var p = o;
        o = function () {
          var h = qo(u);
          p.call(h);
        };
      }
      Jo(t, u, e, o);
    } else u = em(n, t, e, o, r);
    return qo(u);
  }
  (da = function (e) {
    switch (e.tag) {
      case 3:
        var t = e.stateNode;
        if (t.current.memoizedState.isDehydrated) {
          var n = cr(t.pendingLanes);
          n !== 0 &&
            (Ol(t, n | 1),
            tt(t, be()),
            (fe & 6) === 0 && ((Qn = be() + 500), Qt()));
        }
        break;
      case 13:
        xn(function () {
          var r = Tt(e, 1);
          if (r !== null) {
            var o = Ze();
            wt(r, e, 1, o);
          }
        }),
          us(e, 1);
    }
  }),
    (Dl = function (e) {
      if (e.tag === 13) {
        var t = Tt(e, 134217728);
        if (t !== null) {
          var n = Ze();
          wt(t, e, 134217728, n);
        }
        us(e, 134217728);
      }
    }),
    (fa = function (e) {
      if (e.tag === 13) {
        var t = tn(e),
          n = Tt(e, t);
        if (n !== null) {
          var r = Ze();
          wt(n, e, t, r);
        }
        us(e, t);
      }
    }),
    (pa = function () {
      return ve;
    }),
    (ma = function (e, t) {
      var n = ve;
      try {
        return (ve = e), t();
      } finally {
        ve = n;
      }
    }),
    (bl = function (e, t, n) {
      switch (t) {
        case "input":
          if ((wl(e, n), (t = n.name), n.type === "radio" && t != null)) {
            for (n = e; n.parentNode; ) n = n.parentNode;
            for (
              n = n.querySelectorAll(
                "input[name=" + JSON.stringify("" + t) + '][type="radio"]'
              ),
                t = 0;
              t < n.length;
              t++
            ) {
              var r = n[t];
              if (r !== e && r.form === e.form) {
                var o = xo(r);
                if (!o) throw Error(s(90));
                un(r), wl(r, o);
              }
            }
          }
          break;
        case "textarea":
          Bs(e, n);
          break;
        case "select":
          (t = n.value), t != null && jn(e, !!n.multiple, t, !1);
      }
    }),
    (Js = ns),
    (qs = xn);
  var tm = { usingClientEntryPoint: !1, Events: [br, Dn, xo, Zs, Ks, ns] },
    Wr = {
      findFiberByHostInstance: dn,
      bundleType: 0,
      version: "18.3.1",
      rendererPackageName: "react-dom",
    },
    nm = {
      bundleType: Wr.bundleType,
      version: Wr.version,
      rendererPackageName: Wr.rendererPackageName,
      rendererConfig: Wr.rendererConfig,
      overrideHookState: null,
      overrideHookStateDeletePath: null,
      overrideHookStateRenamePath: null,
      overrideProps: null,
      overridePropsDeletePath: null,
      overridePropsRenamePath: null,
      setErrorHandler: null,
      setSuspenseHandler: null,
      scheduleUpdate: null,
      currentDispatcherRef: te.ReactCurrentDispatcher,
      findHostInstanceByFiber: function (e) {
        return (e = ra(e)), e === null ? null : e.stateNode;
      },
      findFiberByHostInstance: Wr.findFiberByHostInstance || qp,
      findHostInstancesForRefresh: null,
      scheduleRefresh: null,
      scheduleRoot: null,
      setRefreshHandler: null,
      getCurrentFiber: null,
      reconcilerVersion: "18.3.1-next-f1338f8080-20240426",
    };
  if (typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ < "u") {
    var rl = __REACT_DEVTOOLS_GLOBAL_HOOK__;
    if (!rl.isDisabled && rl.supportsFiber)
      try {
        (qr = rl.inject(nm)), (St = rl);
      } catch {}
  }
  return (
    (nt.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = tm),
    (nt.createPortal = function (e, t) {
      var n =
        2 < arguments.length && arguments[2] !== void 0 ? arguments[2] : null;
      if (!ds(t)) throw Error(s(200));
      return Jp(e, t, null, n);
    }),
    (nt.createRoot = function (e, t) {
      if (!ds(e)) throw Error(s(299));
      var n = !1,
        r = "",
        o = Pc;
      return (
        t != null &&
          (t.unstable_strictMode === !0 && (n = !0),
          t.identifierPrefix !== void 0 && (r = t.identifierPrefix),
          t.onRecoverableError !== void 0 && (o = t.onRecoverableError)),
        (t = as(e, 1, !1, null, null, n, !1, r, o)),
        (e[Mt] = t.current),
        Cr(e.nodeType === 8 ? e.parentNode : e),
        new cs(t)
      );
    }),
    (nt.findDOMNode = function (e) {
      if (e == null) return null;
      if (e.nodeType === 1) return e;
      var t = e._reactInternals;
      if (t === void 0)
        throw typeof e.render == "function"
          ? Error(s(188))
          : ((e = Object.keys(e).join(",")), Error(s(268, e)));
      return (e = ra(t)), (e = e === null ? null : e.stateNode), e;
    }),
    (nt.flushSync = function (e) {
      return xn(e);
    }),
    (nt.hydrate = function (e, t, n) {
      if (!tl(t)) throw Error(s(200));
      return nl(null, e, t, !0, n);
    }),
    (nt.hydrateRoot = function (e, t, n) {
      if (!ds(e)) throw Error(s(405));
      var r = (n != null && n.hydratedSources) || null,
        o = !1,
        i = "",
        u = Pc;
      if (
        (n != null &&
          (n.unstable_strictMode === !0 && (o = !0),
          n.identifierPrefix !== void 0 && (i = n.identifierPrefix),
          n.onRecoverableError !== void 0 && (u = n.onRecoverableError)),
        (t = bc(t, null, e, 1, n ?? null, o, !1, i, u)),
        (e[Mt] = t.current),
        Cr(e),
        r)
      )
        for (e = 0; e < r.length; e++)
          (n = r[e]),
            (o = n._getVersion),
            (o = o(n._source)),
            t.mutableSourceEagerHydrationData == null
              ? (t.mutableSourceEagerHydrationData = [n, o])
              : t.mutableSourceEagerHydrationData.push(n, o);
      return new el(t);
    }),
    (nt.render = function (e, t, n) {
      if (!tl(t)) throw Error(s(200));
      return nl(null, e, t, !1, n);
    }),
    (nt.unmountComponentAtNode = function (e) {
      if (!tl(e)) throw Error(s(40));
      return e._reactRootContainer
        ? (xn(function () {
            nl(null, null, e, !1, function () {
              (e._reactRootContainer = null), (e[Mt] = null);
            });
          }),
          !0)
        : !1;
    }),
    (nt.unstable_batchedUpdates = ns),
    (nt.unstable_renderSubtreeIntoContainer = function (e, t, n, r) {
      if (!tl(n)) throw Error(s(200));
      if (e == null || e._reactInternals === void 0) throw Error(s(38));
      return nl(e, t, n, !1, r);
    }),
    (nt.version = "18.3.1-next-f1338f8080-20240426"),
    nt
  );
}
var Fc;
function ud() {
  if (Fc) return ms.exports;
  Fc = 1;
  function l() {
    if (
      !(
        typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ > "u" ||
        typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE != "function"
      )
    )
      try {
        __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(l);
      } catch (a) {
        console.error(a);
      }
  }
  return l(), (ms.exports = cm()), ms.exports;
}
var Hc;
function dm() {
  if (Hc) return ol;
  Hc = 1;
  var l = ud();
  return (ol.createRoot = l.createRoot), (ol.hydrateRoot = l.hydrateRoot), ol;
}
var fm = dm(),
  S = Ts();
const pm = ad(S),
  cd = om({ __proto__: null, default: pm }, [S]);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const mm = (l) => l.replace(/([a-z0-9])([A-Z])/g, "$1-$2").toLowerCase(),
  hm = (l) =>
    l.replace(/^([A-Z])|[\s-_]+(\w)/g, (a, s, c) =>
      c ? c.toUpperCase() : s.toLowerCase()
    ),
  Uc = (l) => {
    const a = hm(l);
    return a.charAt(0).toUpperCase() + a.slice(1);
  },
  dd = (...l) =>
    l
      .filter((a, s, c) => !!a && a.trim() !== "" && c.indexOf(a) === s)
      .join(" ")
      .trim();
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ var gm = {
  xmlns: "http://www.w3.org/2000/svg",
  width: 24,
  height: 24,
  viewBox: "0 0 24 24",
  fill: "none",
  stroke: "currentColor",
  strokeWidth: 2,
  strokeLinecap: "round",
  strokeLinejoin: "round",
};
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const vm = S.forwardRef(
  (
    {
      color: l = "currentColor",
      size: a = 24,
      strokeWidth: s = 2,
      absoluteStrokeWidth: c,
      className: d = "",
      children: m,
      iconNode: w,
      ...v
    },
    E
  ) =>
    S.createElement(
      "svg",
      {
        ref: E,
        ...gm,
        width: a,
        height: a,
        stroke: l,
        strokeWidth: c ? (Number(s) * 24) / Number(a) : s,
        className: dd("lucide", d),
        ...v,
      },
      [
        ...w.map(([j, z]) => S.createElement(j, z)),
        ...(Array.isArray(m) ? m : [m]),
      ]
    )
);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Ee = (l, a) => {
  const s = S.forwardRef(({ className: c, ...d }, m) =>
    S.createElement(vm, {
      ref: m,
      iconNode: a,
      className: dd(`lucide-${mm(Uc(l))}`, `lucide-${l}`, c),
      ...d,
    })
  );
  return (s.displayName = Uc(l)), s;
};
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const ym = [
    ["path", { d: "M5 12h14", key: "1ays0h" }],
    ["path", { d: "m12 5 7 7-7 7", key: "xquz4c" }],
  ],
  fd = Ee("arrow-right", ym);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const xm = [
    [
      "path",
      {
        d: "m15.477 12.89 1.515 8.526a.5.5 0 0 1-.81.47l-3.58-2.687a1 1 0 0 0-1.197 0l-3.586 2.686a.5.5 0 0 1-.81-.469l1.514-8.526",
        key: "1yiouv",
      },
    ],
    ["circle", { cx: "12", cy: "8", r: "6", key: "1vp47v" }],
  ],
  Wc = Ee("award", xm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const wm = [
    ["path", { d: "M8 2v4", key: "1cmpym" }],
    ["path", { d: "M16 2v4", key: "4m81vk" }],
    [
      "rect",
      { width: "18", height: "18", x: "3", y: "4", rx: "2", key: "1hopcy" },
    ],
    ["path", { d: "M3 10h18", key: "8toen8" }],
  ],
  km = Ee("calendar", wm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Nm = [["path", { d: "m15 18-6-6 6-6", key: "1wnfg3" }]],
  Sm = Ee("chevron-left", Nm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Em = [["path", { d: "m9 18 6-6-6-6", key: "mthhwq" }]],
  Cm = Ee("chevron-right", Em);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const jm = [
    ["line", { x1: "12", x2: "12", y1: "2", y2: "22", key: "7eqyqh" }],
    [
      "path",
      { d: "M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6", key: "1b0p4s" },
    ],
  ],
  _m = Ee("dollar-sign", jm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const bm = [
    [
      "path",
      {
        d: "M2.062 12.348a1 1 0 0 1 0-.696 10.75 10.75 0 0 1 19.876 0 1 1 0 0 1 0 .696 10.75 10.75 0 0 1-19.876 0",
        key: "1nclc0",
      },
    ],
    ["circle", { cx: "12", cy: "12", r: "3", key: "1v7zrd" }],
  ],
  pd = Ee("eye", bm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Mm = [
    [
      "path",
      {
        d: "M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z",
        key: "1jg4f8",
      },
    ],
  ],
  Pm = Ee("facebook", Mm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const zm = [
    [
      "path",
      {
        d: "M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z",
        key: "c3ymky",
      },
    ],
  ],
  Vr = Ee("heart", zm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Rm = [
    [
      "path",
      { d: "M15 21v-8a1 1 0 0 0-1-1h-4a1 1 0 0 0-1 1v8", key: "5wwlr5" },
    ],
    [
      "path",
      {
        d: "M3 10a2 2 0 0 1 .709-1.528l7-5.999a2 2 0 0 1 2.582 0l7 5.999A2 2 0 0 1 21 10v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z",
        key: "1d0kgt",
      },
    ],
  ],
  Tm = Ee("house", Rm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Im = [
    [
      "rect",
      {
        width: "20",
        height: "20",
        x: "2",
        y: "2",
        rx: "5",
        ry: "5",
        key: "2e1cvw",
      },
    ],
    [
      "path",
      { d: "M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z", key: "9exkf1" },
    ],
    ["line", { x1: "17.5", x2: "17.51", y1: "6.5", y2: "6.5", key: "r4j83e" }],
  ],
  Om = Ee("instagram", Im);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Dm = [
    ["path", { d: "M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4", key: "u53s6r" }],
    ["polyline", { points: "10 17 15 12 10 7", key: "1ail0h" }],
    ["line", { x1: "15", x2: "3", y1: "12", y2: "12", key: "v6grx8" }],
  ],
  Lm = Ee("log-in", Dm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Am = [
    [
      "rect",
      { width: "20", height: "16", x: "2", y: "4", rx: "2", key: "18n3k1" },
    ],
    ["path", { d: "m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7", key: "1ocrg3" }],
  ],
  Fm = Ee("mail", Am);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Hm = [
    [
      "path",
      {
        d: "M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0",
        key: "1r0f0z",
      },
    ],
    ["circle", { cx: "12", cy: "10", r: "3", key: "ilqhr7" }],
  ],
  md = Ee("map-pin", Hm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Um = [
    ["line", { x1: "4", x2: "20", y1: "12", y2: "12", key: "1e0a9i" }],
    ["line", { x1: "4", x2: "20", y1: "6", y2: "6", key: "1owob3" }],
    ["line", { x1: "4", x2: "20", y1: "18", y2: "18", key: "yk5zj1" }],
  ],
  Wm = Ee("menu", Um);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Bm = [
    [
      "path",
      {
        d: "M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z",
        key: "1lielz",
      },
    ],
  ],
  $m = Ee("message-square", Bm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Vm = [
    [
      "path",
      {
        d: "M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z",
        key: "foiqr5",
      },
    ],
  ],
  Gm = Ee("phone", Vm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Xm = [
    ["path", { d: "M5 12h14", key: "1ays0h" }],
    ["path", { d: "M12 5v14", key: "s699le" }],
  ],
  Ym = Ee("plus", Xm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Qm = [
    ["circle", { cx: "11", cy: "11", r: "8", key: "4ej97u" }],
    ["path", { d: "m21 21-4.3-4.3", key: "1qie3q" }],
  ],
  hd = Ee("search", Qm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Zm = [
    [
      "path",
      {
        d: "M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z",
        key: "r04s7s",
      },
    ],
  ],
  Km = Ee("star", Zm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const Jm = [
    ["path", { d: "M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2", key: "975kel" }],
    ["circle", { cx: "12", cy: "7", r: "4", key: "17ys0d" }],
  ],
  qm = Ee("user", Jm);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const eh = [
    ["path", { d: "M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2", key: "1yyitq" }],
    ["circle", { cx: "9", cy: "7", r: "4", key: "nufk8" }],
    ["path", { d: "M22 21v-2a4 4 0 0 0-3-3.87", key: "kshegd" }],
    ["path", { d: "M16 3.13a4 4 0 0 1 0 7.75", key: "1da9ce" }],
  ],
  gd = Ee("users", eh);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const th = [
    ["path", { d: "M18 6 6 18", key: "1bl5f8" }],
    ["path", { d: "m6 6 12 12", key: "d8bk6v" }],
  ],
  nh = Ee("x", th);
/**
 * @license lucide-react v0.487.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */ const rh = [
    [
      "path",
      {
        d: "M2.5 17a24.12 24.12 0 0 1 0-10 2 2 0 0 1 1.4-1.4 49.56 49.56 0 0 1 16.2 0A2 2 0 0 1 21.5 7a24.12 24.12 0 0 1 0 10 2 2 0 0 1-1.4 1.4 49.55 49.55 0 0 1-16.2 0A2 2 0 0 1 2.5 17",
        key: "1q2vi4",
      },
    ],
    ["path", { d: "m10 15 5-3-5-3z", key: "1jp15x" }],
  ],
  oh = Ee("youtube", rh);
function Bc(l, a) {
  if (typeof l == "function") return l(a);
  l != null && (l.current = a);
}
function vd(...l) {
  return (a) => {
    let s = !1;
    const c = l.map((d) => {
      const m = Bc(d, a);
      return !s && typeof m == "function" && (s = !0), m;
    });
    if (s)
      return () => {
        for (let d = 0; d < c.length; d++) {
          const m = c[d];
          typeof m == "function" ? m() : Bc(l[d], null);
        }
      };
  };
}
function Cn(...l) {
  return S.useCallback(vd(...l), l);
}
function Is(l) {
  const a = ih(l),
    s = S.forwardRef((c, d) => {
      const { children: m, ...w } = c,
        v = S.Children.toArray(m),
        E = v.find(ah);
      if (E) {
        const j = E.props.children,
          z = v.map((R) =>
            R === E
              ? S.Children.count(j) > 1
                ? S.Children.only(null)
                : S.isValidElement(j)
                ? j.props.children
                : null
              : R
          );
        return f.jsx(a, {
          ...w,
          ref: d,
          children: S.isValidElement(j) ? S.cloneElement(j, void 0, z) : null,
        });
      }
      return f.jsx(a, { ...w, ref: d, children: m });
    });
  return (s.displayName = `${l}.Slot`), s;
}
var lh = Is("Slot");
function ih(l) {
  const a = S.forwardRef((s, c) => {
    const { children: d, ...m } = s;
    if (S.isValidElement(d)) {
      const w = ch(d),
        v = uh(m, d.props);
      return (
        d.type !== S.Fragment && (v.ref = c ? vd(c, w) : w),
        S.cloneElement(d, v)
      );
    }
    return S.Children.count(d) > 1 ? S.Children.only(null) : null;
  });
  return (a.displayName = `${l}.SlotClone`), a;
}
var sh = Symbol("radix.slottable");
function ah(l) {
  return (
    S.isValidElement(l) &&
    typeof l.type == "function" &&
    "__radixId" in l.type &&
    l.type.__radixId === sh
  );
}
function uh(l, a) {
  const s = { ...a };
  for (const c in a) {
    const d = l[c],
      m = a[c];
    /^on[A-Z]/.test(c)
      ? d && m
        ? (s[c] = (...v) => {
            const E = m(...v);
            return d(...v), E;
          })
        : d && (s[c] = d)
      : c === "style"
      ? (s[c] = { ...d, ...m })
      : c === "className" && (s[c] = [d, m].filter(Boolean).join(" "));
  }
  return { ...l, ...s };
}
function ch(l) {
  let a = Object.getOwnPropertyDescriptor(l.props, "ref")?.get,
    s = a && "isReactWarning" in a && a.isReactWarning;
  return s
    ? l.ref
    : ((a = Object.getOwnPropertyDescriptor(l, "ref")?.get),
      (s = a && "isReactWarning" in a && a.isReactWarning),
      s ? l.props.ref : l.props.ref || l.ref);
}
function yd(l) {
  var a,
    s,
    c = "";
  if (typeof l == "string" || typeof l == "number") c += l;
  else if (typeof l == "object")
    if (Array.isArray(l)) {
      var d = l.length;
      for (a = 0; a < d; a++)
        l[a] && (s = yd(l[a])) && (c && (c += " "), (c += s));
    } else for (s in l) l[s] && (c && (c += " "), (c += s));
  return c;
}
function xd() {
  for (var l, a, s = 0, c = "", d = arguments.length; s < d; s++)
    (l = arguments[s]) && (a = yd(l)) && (c && (c += " "), (c += a));
  return c;
}
const $c = (l) => (typeof l == "boolean" ? `${l}` : l === 0 ? "0" : l),
  Vc = xd,
  dh = (l, a) => (s) => {
    var c;
    if (a?.variants == null) return Vc(l, s?.class, s?.className);
    const { variants: d, defaultVariants: m } = a,
      w = Object.keys(d).map((j) => {
        const z = s?.[j],
          R = m?.[j];
        if (z === null) return null;
        const O = $c(z) || $c(R);
        return d[j][O];
      }),
      v =
        s &&
        Object.entries(s).reduce((j, z) => {
          let [R, O] = z;
          return O === void 0 || (j[R] = O), j;
        }, {}),
      E =
        a == null || (c = a.compoundVariants) === null || c === void 0
          ? void 0
          : c.reduce((j, z) => {
              let { class: R, className: O, ...L } = z;
              return Object.entries(L).every((Y) => {
                let [_, D] = Y;
                return Array.isArray(D)
                  ? D.includes({ ...m, ...v }[_])
                  : { ...m, ...v }[_] === D;
              })
                ? [...j, R, O]
                : j;
            }, []);
    return Vc(l, w, E, s?.class, s?.className);
  },
  Os = "-",
  fh = (l) => {
    const a = mh(l),
      { conflictingClassGroups: s, conflictingClassGroupModifiers: c } = l;
    return {
      getClassGroupId: (w) => {
        const v = w.split(Os);
        return v[0] === "" && v.length !== 1 && v.shift(), wd(v, a) || ph(w);
      },
      getConflictingClassGroupIds: (w, v) => {
        const E = s[w] || [];
        return v && c[w] ? [...E, ...c[w]] : E;
      },
    };
  },
  wd = (l, a) => {
    if (l.length === 0) return a.classGroupId;
    const s = l[0],
      c = a.nextPart.get(s),
      d = c ? wd(l.slice(1), c) : void 0;
    if (d) return d;
    if (a.validators.length === 0) return;
    const m = l.join(Os);
    return a.validators.find(({ validator: w }) => w(m))?.classGroupId;
  },
  Gc = /^\[(.+)\]$/,
  ph = (l) => {
    if (Gc.test(l)) {
      const a = Gc.exec(l)[1],
        s = a?.substring(0, a.indexOf(":"));
      if (s) return "arbitrary.." + s;
    }
  },
  mh = (l) => {
    const { theme: a, classGroups: s } = l,
      c = { nextPart: new Map(), validators: [] };
    for (const d in s) bs(s[d], c, d, a);
    return c;
  },
  bs = (l, a, s, c) => {
    l.forEach((d) => {
      if (typeof d == "string") {
        const m = d === "" ? a : Xc(a, d);
        m.classGroupId = s;
        return;
      }
      if (typeof d == "function") {
        if (hh(d)) {
          bs(d(c), a, s, c);
          return;
        }
        a.validators.push({ validator: d, classGroupId: s });
        return;
      }
      Object.entries(d).forEach(([m, w]) => {
        bs(w, Xc(a, m), s, c);
      });
    });
  },
  Xc = (l, a) => {
    let s = l;
    return (
      a.split(Os).forEach((c) => {
        s.nextPart.has(c) ||
          s.nextPart.set(c, { nextPart: new Map(), validators: [] }),
          (s = s.nextPart.get(c));
      }),
      s
    );
  },
  hh = (l) => l.isThemeGetter,
  gh = (l) => {
    if (l < 1) return { get: () => {}, set: () => {} };
    let a = 0,
      s = new Map(),
      c = new Map();
    const d = (m, w) => {
      s.set(m, w), a++, a > l && ((a = 0), (c = s), (s = new Map()));
    };
    return {
      get(m) {
        let w = s.get(m);
        if (w !== void 0) return w;
        if ((w = c.get(m)) !== void 0) return d(m, w), w;
      },
      set(m, w) {
        s.has(m) ? s.set(m, w) : d(m, w);
      },
    };
  },
  Ms = "!",
  Ps = ":",
  vh = Ps.length,
  yh = (l) => {
    const { prefix: a, experimentalParseClassName: s } = l;
    let c = (d) => {
      const m = [];
      let w = 0,
        v = 0,
        E = 0,
        j;
      for (let Y = 0; Y < d.length; Y++) {
        let _ = d[Y];
        if (w === 0 && v === 0) {
          if (_ === Ps) {
            m.push(d.slice(E, Y)), (E = Y + vh);
            continue;
          }
          if (_ === "/") {
            j = Y;
            continue;
          }
        }
        _ === "[" ? w++ : _ === "]" ? w-- : _ === "(" ? v++ : _ === ")" && v--;
      }
      const z = m.length === 0 ? d : d.substring(E),
        R = xh(z),
        O = R !== z,
        L = j && j > E ? j - E : void 0;
      return {
        modifiers: m,
        hasImportantModifier: O,
        baseClassName: R,
        maybePostfixModifierPosition: L,
      };
    };
    if (a) {
      const d = a + Ps,
        m = c;
      c = (w) =>
        w.startsWith(d)
          ? m(w.substring(d.length))
          : {
              isExternal: !0,
              modifiers: [],
              hasImportantModifier: !1,
              baseClassName: w,
              maybePostfixModifierPosition: void 0,
            };
    }
    if (s) {
      const d = c;
      c = (m) => s({ className: m, parseClassName: d });
    }
    return c;
  },
  xh = (l) =>
    l.endsWith(Ms)
      ? l.substring(0, l.length - 1)
      : l.startsWith(Ms)
      ? l.substring(1)
      : l,
  wh = (l) => {
    const a = Object.fromEntries(l.orderSensitiveModifiers.map((c) => [c, !0]));
    return (c) => {
      if (c.length <= 1) return c;
      const d = [];
      let m = [];
      return (
        c.forEach((w) => {
          w[0] === "[" || a[w] ? (d.push(...m.sort(), w), (m = [])) : m.push(w);
        }),
        d.push(...m.sort()),
        d
      );
    };
  },
  kh = (l) => ({
    cache: gh(l.cacheSize),
    parseClassName: yh(l),
    sortModifiers: wh(l),
    ...fh(l),
  }),
  Nh = /\s+/,
  Sh = (l, a) => {
    const {
        parseClassName: s,
        getClassGroupId: c,
        getConflictingClassGroupIds: d,
        sortModifiers: m,
      } = a,
      w = [],
      v = l.trim().split(Nh);
    let E = "";
    for (let j = v.length - 1; j >= 0; j -= 1) {
      const z = v[j],
        {
          isExternal: R,
          modifiers: O,
          hasImportantModifier: L,
          baseClassName: Y,
          maybePostfixModifierPosition: _,
        } = s(z);
      if (R) {
        E = z + (E.length > 0 ? " " + E : E);
        continue;
      }
      let D = !!_,
        q = c(D ? Y.substring(0, _) : Y);
      if (!q) {
        if (!D) {
          E = z + (E.length > 0 ? " " + E : E);
          continue;
        }
        if (((q = c(Y)), !q)) {
          E = z + (E.length > 0 ? " " + E : E);
          continue;
        }
        D = !1;
      }
      const le = m(O).join(":"),
        oe = L ? le + Ms : le,
        te = oe + q;
      if (w.includes(te)) continue;
      w.push(te);
      const se = d(q, D);
      for (let de = 0; de < se.length; ++de) {
        const ee = se[de];
        w.push(oe + ee);
      }
      E = z + (E.length > 0 ? " " + E : E);
    }
    return E;
  };
function Eh() {
  let l = 0,
    a,
    s,
    c = "";
  for (; l < arguments.length; )
    (a = arguments[l++]) && (s = kd(a)) && (c && (c += " "), (c += s));
  return c;
}
const kd = (l) => {
  if (typeof l == "string") return l;
  let a,
    s = "";
  for (let c = 0; c < l.length; c++)
    l[c] && (a = kd(l[c])) && (s && (s += " "), (s += a));
  return s;
};
function Ch(l, ...a) {
  let s,
    c,
    d,
    m = w;
  function w(E) {
    const j = a.reduce((z, R) => R(z), l());
    return (s = kh(j)), (c = s.cache.get), (d = s.cache.set), (m = v), v(E);
  }
  function v(E) {
    const j = c(E);
    if (j) return j;
    const z = Sh(E, s);
    return d(E, z), z;
  }
  return function () {
    return m(Eh.apply(null, arguments));
  };
}
const Te = (l) => {
    const a = (s) => s[l] || [];
    return (a.isThemeGetter = !0), a;
  },
  Nd = /^\[(?:(\w[\w-]*):)?(.+)\]$/i,
  Sd = /^\((?:(\w[\w-]*):)?(.+)\)$/i,
  jh = /^\d+\/\d+$/,
  _h = /^(\d+(\.\d+)?)?(xs|sm|md|lg|xl)$/,
  bh =
    /\d+(%|px|r?em|[sdl]?v([hwib]|min|max)|pt|pc|in|cm|mm|cap|ch|ex|r?lh|cq(w|h|i|b|min|max))|\b(calc|min|max|clamp)\(.+\)|^0$/,
  Mh = /^(rgba?|hsla?|hwb|(ok)?(lab|lch)|color-mix)\(.+\)$/,
  Ph = /^(inset_)?-?((\d+)?\.?(\d+)[a-z]+|0)_-?((\d+)?\.?(\d+)[a-z]+|0)/,
  zh =
    /^(url|image|image-set|cross-fade|element|(repeating-)?(linear|radial|conic)-gradient)\(.+\)$/,
  Kn = (l) => jh.test(l),
  ie = (l) => !!l && !Number.isNaN(Number(l)),
  ln = (l) => !!l && Number.isInteger(Number(l)),
  vs = (l) => l.endsWith("%") && ie(l.slice(0, -1)),
  Lt = (l) => _h.test(l),
  Rh = () => !0,
  Th = (l) => bh.test(l) && !Mh.test(l),
  Ed = () => !1,
  Ih = (l) => Ph.test(l),
  Oh = (l) => zh.test(l),
  Dh = (l) => !B(l) && !$(l),
  Lh = (l) => nr(l, _d, Ed),
  B = (l) => Nd.test(l),
  Sn = (l) => nr(l, bd, Th),
  ys = (l) => nr(l, Wh, ie),
  Yc = (l) => nr(l, Cd, Ed),
  Ah = (l) => nr(l, jd, Oh),
  ll = (l) => nr(l, Md, Ih),
  $ = (l) => Sd.test(l),
  $r = (l) => rr(l, bd),
  Fh = (l) => rr(l, Bh),
  Qc = (l) => rr(l, Cd),
  Hh = (l) => rr(l, _d),
  Uh = (l) => rr(l, jd),
  il = (l) => rr(l, Md, !0),
  nr = (l, a, s) => {
    const c = Nd.exec(l);
    return c ? (c[1] ? a(c[1]) : s(c[2])) : !1;
  },
  rr = (l, a, s = !1) => {
    const c = Sd.exec(l);
    return c ? (c[1] ? a(c[1]) : s) : !1;
  },
  Cd = (l) => l === "position" || l === "percentage",
  jd = (l) => l === "image" || l === "url",
  _d = (l) => l === "length" || l === "size" || l === "bg-size",
  bd = (l) => l === "length",
  Wh = (l) => l === "number",
  Bh = (l) => l === "family-name",
  Md = (l) => l === "shadow",
  $h = () => {
    const l = Te("color"),
      a = Te("font"),
      s = Te("text"),
      c = Te("font-weight"),
      d = Te("tracking"),
      m = Te("leading"),
      w = Te("breakpoint"),
      v = Te("container"),
      E = Te("spacing"),
      j = Te("radius"),
      z = Te("shadow"),
      R = Te("inset-shadow"),
      O = Te("text-shadow"),
      L = Te("drop-shadow"),
      Y = Te("blur"),
      _ = Te("perspective"),
      D = Te("aspect"),
      q = Te("ease"),
      le = Te("animate"),
      oe = () => [
        "auto",
        "avoid",
        "all",
        "avoid-page",
        "page",
        "left",
        "right",
        "column",
      ],
      te = () => [
        "center",
        "top",
        "bottom",
        "left",
        "right",
        "top-left",
        "left-top",
        "top-right",
        "right-top",
        "bottom-right",
        "right-bottom",
        "bottom-left",
        "left-bottom",
      ],
      se = () => [...te(), $, B],
      de = () => ["auto", "hidden", "clip", "visible", "scroll"],
      ee = () => ["auto", "contain", "none"],
      U = () => [$, B, E],
      ke = () => [Kn, "full", "auto", ...U()],
      Ue = () => [ln, "none", "subgrid", $, B],
      Nt = () => ["auto", { span: ["full", ln, $, B] }, ln, $, B],
      Xe = () => [ln, "auto", $, B],
      We = () => ["auto", "min", "max", "fr", $, B],
      Ye = () => [
        "start",
        "end",
        "center",
        "between",
        "around",
        "evenly",
        "stretch",
        "baseline",
        "center-safe",
        "end-safe",
      ],
      Ae = () => [
        "start",
        "end",
        "center",
        "stretch",
        "center-safe",
        "end-safe",
      ],
      Ne = () => ["auto", ...U()],
      he = () => [
        Kn,
        "auto",
        "full",
        "dvw",
        "dvh",
        "lvw",
        "lvh",
        "svw",
        "svh",
        "min",
        "max",
        "fit",
        ...U(),
      ],
      C = () => [l, $, B],
      Q = () => [...te(), Qc, Yc, { position: [$, B] }],
      F = () => ["no-repeat", { repeat: ["", "x", "y", "space", "round"] }],
      y = () => ["auto", "cover", "contain", Hh, Lh, { size: [$, B] }],
      b = () => [vs, $r, Sn],
      X = () => ["", "none", "full", j, $, B],
      J = () => ["", ie, $r, Sn],
      ue = () => ["solid", "dashed", "dotted", "double"],
      ce = () => [
        "normal",
        "multiply",
        "screen",
        "overlay",
        "darken",
        "lighten",
        "color-dodge",
        "color-burn",
        "hard-light",
        "soft-light",
        "difference",
        "exclusion",
        "hue",
        "saturation",
        "color",
        "luminosity",
      ],
      re = () => [ie, vs, Qc, Yc],
      pe = () => ["", "none", Y, $, B],
      ge = () => ["none", ie, $, B],
      Ie = () => ["none", ie, $, B],
      Ft = () => [ie, $, B],
      un = () => [Kn, "full", ...U()];
    return {
      cacheSize: 500,
      theme: {
        animate: ["spin", "ping", "pulse", "bounce"],
        aspect: ["video"],
        blur: [Lt],
        breakpoint: [Lt],
        color: [Rh],
        container: [Lt],
        "drop-shadow": [Lt],
        ease: ["in", "out", "in-out"],
        font: [Dh],
        "font-weight": [
          "thin",
          "extralight",
          "light",
          "normal",
          "medium",
          "semibold",
          "bold",
          "extrabold",
          "black",
        ],
        "inset-shadow": [Lt],
        leading: ["none", "tight", "snug", "normal", "relaxed", "loose"],
        perspective: [
          "dramatic",
          "near",
          "normal",
          "midrange",
          "distant",
          "none",
        ],
        radius: [Lt],
        shadow: [Lt],
        spacing: ["px", ie],
        text: [Lt],
        "text-shadow": [Lt],
        tracking: ["tighter", "tight", "normal", "wide", "wider", "widest"],
      },
      classGroups: {
        aspect: [{ aspect: ["auto", "square", Kn, B, $, D] }],
        container: ["container"],
        columns: [{ columns: [ie, B, $, v] }],
        "break-after": [{ "break-after": oe() }],
        "break-before": [{ "break-before": oe() }],
        "break-inside": [
          { "break-inside": ["auto", "avoid", "avoid-page", "avoid-column"] },
        ],
        "box-decoration": [{ "box-decoration": ["slice", "clone"] }],
        box: [{ box: ["border", "content"] }],
        display: [
          "block",
          "inline-block",
          "inline",
          "flex",
          "inline-flex",
          "table",
          "inline-table",
          "table-caption",
          "table-cell",
          "table-column",
          "table-column-group",
          "table-footer-group",
          "table-header-group",
          "table-row-group",
          "table-row",
          "flow-root",
          "grid",
          "inline-grid",
          "contents",
          "list-item",
          "hidden",
        ],
        sr: ["sr-only", "not-sr-only"],
        float: [{ float: ["right", "left", "none", "start", "end"] }],
        clear: [{ clear: ["left", "right", "both", "none", "start", "end"] }],
        isolation: ["isolate", "isolation-auto"],
        "object-fit": [
          { object: ["contain", "cover", "fill", "none", "scale-down"] },
        ],
        "object-position": [{ object: se() }],
        overflow: [{ overflow: de() }],
        "overflow-x": [{ "overflow-x": de() }],
        "overflow-y": [{ "overflow-y": de() }],
        overscroll: [{ overscroll: ee() }],
        "overscroll-x": [{ "overscroll-x": ee() }],
        "overscroll-y": [{ "overscroll-y": ee() }],
        position: ["static", "fixed", "absolute", "relative", "sticky"],
        inset: [{ inset: ke() }],
        "inset-x": [{ "inset-x": ke() }],
        "inset-y": [{ "inset-y": ke() }],
        start: [{ start: ke() }],
        end: [{ end: ke() }],
        top: [{ top: ke() }],
        right: [{ right: ke() }],
        bottom: [{ bottom: ke() }],
        left: [{ left: ke() }],
        visibility: ["visible", "invisible", "collapse"],
        z: [{ z: [ln, "auto", $, B] }],
        basis: [{ basis: [Kn, "full", "auto", v, ...U()] }],
        "flex-direction": [
          { flex: ["row", "row-reverse", "col", "col-reverse"] },
        ],
        "flex-wrap": [{ flex: ["nowrap", "wrap", "wrap-reverse"] }],
        flex: [{ flex: [ie, Kn, "auto", "initial", "none", B] }],
        grow: [{ grow: ["", ie, $, B] }],
        shrink: [{ shrink: ["", ie, $, B] }],
        order: [{ order: [ln, "first", "last", "none", $, B] }],
        "grid-cols": [{ "grid-cols": Ue() }],
        "col-start-end": [{ col: Nt() }],
        "col-start": [{ "col-start": Xe() }],
        "col-end": [{ "col-end": Xe() }],
        "grid-rows": [{ "grid-rows": Ue() }],
        "row-start-end": [{ row: Nt() }],
        "row-start": [{ "row-start": Xe() }],
        "row-end": [{ "row-end": Xe() }],
        "grid-flow": [
          { "grid-flow": ["row", "col", "dense", "row-dense", "col-dense"] },
        ],
        "auto-cols": [{ "auto-cols": We() }],
        "auto-rows": [{ "auto-rows": We() }],
        gap: [{ gap: U() }],
        "gap-x": [{ "gap-x": U() }],
        "gap-y": [{ "gap-y": U() }],
        "justify-content": [{ justify: [...Ye(), "normal"] }],
        "justify-items": [{ "justify-items": [...Ae(), "normal"] }],
        "justify-self": [{ "justify-self": ["auto", ...Ae()] }],
        "align-content": [{ content: ["normal", ...Ye()] }],
        "align-items": [{ items: [...Ae(), { baseline: ["", "last"] }] }],
        "align-self": [{ self: ["auto", ...Ae(), { baseline: ["", "last"] }] }],
        "place-content": [{ "place-content": Ye() }],
        "place-items": [{ "place-items": [...Ae(), "baseline"] }],
        "place-self": [{ "place-self": ["auto", ...Ae()] }],
        p: [{ p: U() }],
        px: [{ px: U() }],
        py: [{ py: U() }],
        ps: [{ ps: U() }],
        pe: [{ pe: U() }],
        pt: [{ pt: U() }],
        pr: [{ pr: U() }],
        pb: [{ pb: U() }],
        pl: [{ pl: U() }],
        m: [{ m: Ne() }],
        mx: [{ mx: Ne() }],
        my: [{ my: Ne() }],
        ms: [{ ms: Ne() }],
        me: [{ me: Ne() }],
        mt: [{ mt: Ne() }],
        mr: [{ mr: Ne() }],
        mb: [{ mb: Ne() }],
        ml: [{ ml: Ne() }],
        "space-x": [{ "space-x": U() }],
        "space-x-reverse": ["space-x-reverse"],
        "space-y": [{ "space-y": U() }],
        "space-y-reverse": ["space-y-reverse"],
        size: [{ size: he() }],
        w: [{ w: [v, "screen", ...he()] }],
        "min-w": [{ "min-w": [v, "screen", "none", ...he()] }],
        "max-w": [
          { "max-w": [v, "screen", "none", "prose", { screen: [w] }, ...he()] },
        ],
        h: [{ h: ["screen", "lh", ...he()] }],
        "min-h": [{ "min-h": ["screen", "lh", "none", ...he()] }],
        "max-h": [{ "max-h": ["screen", "lh", ...he()] }],
        "font-size": [{ text: ["base", s, $r, Sn] }],
        "font-smoothing": ["antialiased", "subpixel-antialiased"],
        "font-style": ["italic", "not-italic"],
        "font-weight": [{ font: [c, $, ys] }],
        "font-stretch": [
          {
            "font-stretch": [
              "ultra-condensed",
              "extra-condensed",
              "condensed",
              "semi-condensed",
              "normal",
              "semi-expanded",
              "expanded",
              "extra-expanded",
              "ultra-expanded",
              vs,
              B,
            ],
          },
        ],
        "font-family": [{ font: [Fh, B, a] }],
        "fvn-normal": ["normal-nums"],
        "fvn-ordinal": ["ordinal"],
        "fvn-slashed-zero": ["slashed-zero"],
        "fvn-figure": ["lining-nums", "oldstyle-nums"],
        "fvn-spacing": ["proportional-nums", "tabular-nums"],
        "fvn-fraction": ["diagonal-fractions", "stacked-fractions"],
        tracking: [{ tracking: [d, $, B] }],
        "line-clamp": [{ "line-clamp": [ie, "none", $, ys] }],
        leading: [{ leading: [m, ...U()] }],
        "list-image": [{ "list-image": ["none", $, B] }],
        "list-style-position": [{ list: ["inside", "outside"] }],
        "list-style-type": [{ list: ["disc", "decimal", "none", $, B] }],
        "text-alignment": [
          { text: ["left", "center", "right", "justify", "start", "end"] },
        ],
        "placeholder-color": [{ placeholder: C() }],
        "text-color": [{ text: C() }],
        "text-decoration": [
          "underline",
          "overline",
          "line-through",
          "no-underline",
        ],
        "text-decoration-style": [{ decoration: [...ue(), "wavy"] }],
        "text-decoration-thickness": [
          { decoration: [ie, "from-font", "auto", $, Sn] },
        ],
        "text-decoration-color": [{ decoration: C() }],
        "underline-offset": [{ "underline-offset": [ie, "auto", $, B] }],
        "text-transform": [
          "uppercase",
          "lowercase",
          "capitalize",
          "normal-case",
        ],
        "text-overflow": ["truncate", "text-ellipsis", "text-clip"],
        "text-wrap": [{ text: ["wrap", "nowrap", "balance", "pretty"] }],
        indent: [{ indent: U() }],
        "vertical-align": [
          {
            align: [
              "baseline",
              "top",
              "middle",
              "bottom",
              "text-top",
              "text-bottom",
              "sub",
              "super",
              $,
              B,
            ],
          },
        ],
        whitespace: [
          {
            whitespace: [
              "normal",
              "nowrap",
              "pre",
              "pre-line",
              "pre-wrap",
              "break-spaces",
            ],
          },
        ],
        break: [{ break: ["normal", "words", "all", "keep"] }],
        wrap: [{ wrap: ["break-word", "anywhere", "normal"] }],
        hyphens: [{ hyphens: ["none", "manual", "auto"] }],
        content: [{ content: ["none", $, B] }],
        "bg-attachment": [{ bg: ["fixed", "local", "scroll"] }],
        "bg-clip": [{ "bg-clip": ["border", "padding", "content", "text"] }],
        "bg-origin": [{ "bg-origin": ["border", "padding", "content"] }],
        "bg-position": [{ bg: Q() }],
        "bg-repeat": [{ bg: F() }],
        "bg-size": [{ bg: y() }],
        "bg-image": [
          {
            bg: [
              "none",
              {
                linear: [
                  { to: ["t", "tr", "r", "br", "b", "bl", "l", "tl"] },
                  ln,
                  $,
                  B,
                ],
                radial: ["", $, B],
                conic: [ln, $, B],
              },
              Uh,
              Ah,
            ],
          },
        ],
        "bg-color": [{ bg: C() }],
        "gradient-from-pos": [{ from: b() }],
        "gradient-via-pos": [{ via: b() }],
        "gradient-to-pos": [{ to: b() }],
        "gradient-from": [{ from: C() }],
        "gradient-via": [{ via: C() }],
        "gradient-to": [{ to: C() }],
        rounded: [{ rounded: X() }],
        "rounded-s": [{ "rounded-s": X() }],
        "rounded-e": [{ "rounded-e": X() }],
        "rounded-t": [{ "rounded-t": X() }],
        "rounded-r": [{ "rounded-r": X() }],
        "rounded-b": [{ "rounded-b": X() }],
        "rounded-l": [{ "rounded-l": X() }],
        "rounded-ss": [{ "rounded-ss": X() }],
        "rounded-se": [{ "rounded-se": X() }],
        "rounded-ee": [{ "rounded-ee": X() }],
        "rounded-es": [{ "rounded-es": X() }],
        "rounded-tl": [{ "rounded-tl": X() }],
        "rounded-tr": [{ "rounded-tr": X() }],
        "rounded-br": [{ "rounded-br": X() }],
        "rounded-bl": [{ "rounded-bl": X() }],
        "border-w": [{ border: J() }],
        "border-w-x": [{ "border-x": J() }],
        "border-w-y": [{ "border-y": J() }],
        "border-w-s": [{ "border-s": J() }],
        "border-w-e": [{ "border-e": J() }],
        "border-w-t": [{ "border-t": J() }],
        "border-w-r": [{ "border-r": J() }],
        "border-w-b": [{ "border-b": J() }],
        "border-w-l": [{ "border-l": J() }],
        "divide-x": [{ "divide-x": J() }],
        "divide-x-reverse": ["divide-x-reverse"],
        "divide-y": [{ "divide-y": J() }],
        "divide-y-reverse": ["divide-y-reverse"],
        "border-style": [{ border: [...ue(), "hidden", "none"] }],
        "divide-style": [{ divide: [...ue(), "hidden", "none"] }],
        "border-color": [{ border: C() }],
        "border-color-x": [{ "border-x": C() }],
        "border-color-y": [{ "border-y": C() }],
        "border-color-s": [{ "border-s": C() }],
        "border-color-e": [{ "border-e": C() }],
        "border-color-t": [{ "border-t": C() }],
        "border-color-r": [{ "border-r": C() }],
        "border-color-b": [{ "border-b": C() }],
        "border-color-l": [{ "border-l": C() }],
        "divide-color": [{ divide: C() }],
        "outline-style": [{ outline: [...ue(), "none", "hidden"] }],
        "outline-offset": [{ "outline-offset": [ie, $, B] }],
        "outline-w": [{ outline: ["", ie, $r, Sn] }],
        "outline-color": [{ outline: C() }],
        shadow: [{ shadow: ["", "none", z, il, ll] }],
        "shadow-color": [{ shadow: C() }],
        "inset-shadow": [{ "inset-shadow": ["none", R, il, ll] }],
        "inset-shadow-color": [{ "inset-shadow": C() }],
        "ring-w": [{ ring: J() }],
        "ring-w-inset": ["ring-inset"],
        "ring-color": [{ ring: C() }],
        "ring-offset-w": [{ "ring-offset": [ie, Sn] }],
        "ring-offset-color": [{ "ring-offset": C() }],
        "inset-ring-w": [{ "inset-ring": J() }],
        "inset-ring-color": [{ "inset-ring": C() }],
        "text-shadow": [{ "text-shadow": ["none", O, il, ll] }],
        "text-shadow-color": [{ "text-shadow": C() }],
        opacity: [{ opacity: [ie, $, B] }],
        "mix-blend": [
          { "mix-blend": [...ce(), "plus-darker", "plus-lighter"] },
        ],
        "bg-blend": [{ "bg-blend": ce() }],
        "mask-clip": [
          {
            "mask-clip": [
              "border",
              "padding",
              "content",
              "fill",
              "stroke",
              "view",
            ],
          },
          "mask-no-clip",
        ],
        "mask-composite": [
          { mask: ["add", "subtract", "intersect", "exclude"] },
        ],
        "mask-image-linear-pos": [{ "mask-linear": [ie] }],
        "mask-image-linear-from-pos": [{ "mask-linear-from": re() }],
        "mask-image-linear-to-pos": [{ "mask-linear-to": re() }],
        "mask-image-linear-from-color": [{ "mask-linear-from": C() }],
        "mask-image-linear-to-color": [{ "mask-linear-to": C() }],
        "mask-image-t-from-pos": [{ "mask-t-from": re() }],
        "mask-image-t-to-pos": [{ "mask-t-to": re() }],
        "mask-image-t-from-color": [{ "mask-t-from": C() }],
        "mask-image-t-to-color": [{ "mask-t-to": C() }],
        "mask-image-r-from-pos": [{ "mask-r-from": re() }],
        "mask-image-r-to-pos": [{ "mask-r-to": re() }],
        "mask-image-r-from-color": [{ "mask-r-from": C() }],
        "mask-image-r-to-color": [{ "mask-r-to": C() }],
        "mask-image-b-from-pos": [{ "mask-b-from": re() }],
        "mask-image-b-to-pos": [{ "mask-b-to": re() }],
        "mask-image-b-from-color": [{ "mask-b-from": C() }],
        "mask-image-b-to-color": [{ "mask-b-to": C() }],
        "mask-image-l-from-pos": [{ "mask-l-from": re() }],
        "mask-image-l-to-pos": [{ "mask-l-to": re() }],
        "mask-image-l-from-color": [{ "mask-l-from": C() }],
        "mask-image-l-to-color": [{ "mask-l-to": C() }],
        "mask-image-x-from-pos": [{ "mask-x-from": re() }],
        "mask-image-x-to-pos": [{ "mask-x-to": re() }],
        "mask-image-x-from-color": [{ "mask-x-from": C() }],
        "mask-image-x-to-color": [{ "mask-x-to": C() }],
        "mask-image-y-from-pos": [{ "mask-y-from": re() }],
        "mask-image-y-to-pos": [{ "mask-y-to": re() }],
        "mask-image-y-from-color": [{ "mask-y-from": C() }],
        "mask-image-y-to-color": [{ "mask-y-to": C() }],
        "mask-image-radial": [{ "mask-radial": [$, B] }],
        "mask-image-radial-from-pos": [{ "mask-radial-from": re() }],
        "mask-image-radial-to-pos": [{ "mask-radial-to": re() }],
        "mask-image-radial-from-color": [{ "mask-radial-from": C() }],
        "mask-image-radial-to-color": [{ "mask-radial-to": C() }],
        "mask-image-radial-shape": [{ "mask-radial": ["circle", "ellipse"] }],
        "mask-image-radial-size": [
          {
            "mask-radial": [
              { closest: ["side", "corner"], farthest: ["side", "corner"] },
            ],
          },
        ],
        "mask-image-radial-pos": [{ "mask-radial-at": te() }],
        "mask-image-conic-pos": [{ "mask-conic": [ie] }],
        "mask-image-conic-from-pos": [{ "mask-conic-from": re() }],
        "mask-image-conic-to-pos": [{ "mask-conic-to": re() }],
        "mask-image-conic-from-color": [{ "mask-conic-from": C() }],
        "mask-image-conic-to-color": [{ "mask-conic-to": C() }],
        "mask-mode": [{ mask: ["alpha", "luminance", "match"] }],
        "mask-origin": [
          {
            "mask-origin": [
              "border",
              "padding",
              "content",
              "fill",
              "stroke",
              "view",
            ],
          },
        ],
        "mask-position": [{ mask: Q() }],
        "mask-repeat": [{ mask: F() }],
        "mask-size": [{ mask: y() }],
        "mask-type": [{ "mask-type": ["alpha", "luminance"] }],
        "mask-image": [{ mask: ["none", $, B] }],
        filter: [{ filter: ["", "none", $, B] }],
        blur: [{ blur: pe() }],
        brightness: [{ brightness: [ie, $, B] }],
        contrast: [{ contrast: [ie, $, B] }],
        "drop-shadow": [{ "drop-shadow": ["", "none", L, il, ll] }],
        "drop-shadow-color": [{ "drop-shadow": C() }],
        grayscale: [{ grayscale: ["", ie, $, B] }],
        "hue-rotate": [{ "hue-rotate": [ie, $, B] }],
        invert: [{ invert: ["", ie, $, B] }],
        saturate: [{ saturate: [ie, $, B] }],
        sepia: [{ sepia: ["", ie, $, B] }],
        "backdrop-filter": [{ "backdrop-filter": ["", "none", $, B] }],
        "backdrop-blur": [{ "backdrop-blur": pe() }],
        "backdrop-brightness": [{ "backdrop-brightness": [ie, $, B] }],
        "backdrop-contrast": [{ "backdrop-contrast": [ie, $, B] }],
        "backdrop-grayscale": [{ "backdrop-grayscale": ["", ie, $, B] }],
        "backdrop-hue-rotate": [{ "backdrop-hue-rotate": [ie, $, B] }],
        "backdrop-invert": [{ "backdrop-invert": ["", ie, $, B] }],
        "backdrop-opacity": [{ "backdrop-opacity": [ie, $, B] }],
        "backdrop-saturate": [{ "backdrop-saturate": [ie, $, B] }],
        "backdrop-sepia": [{ "backdrop-sepia": ["", ie, $, B] }],
        "border-collapse": [{ border: ["collapse", "separate"] }],
        "border-spacing": [{ "border-spacing": U() }],
        "border-spacing-x": [{ "border-spacing-x": U() }],
        "border-spacing-y": [{ "border-spacing-y": U() }],
        "table-layout": [{ table: ["auto", "fixed"] }],
        caption: [{ caption: ["top", "bottom"] }],
        transition: [
          {
            transition: [
              "",
              "all",
              "colors",
              "opacity",
              "shadow",
              "transform",
              "none",
              $,
              B,
            ],
          },
        ],
        "transition-behavior": [{ transition: ["normal", "discrete"] }],
        duration: [{ duration: [ie, "initial", $, B] }],
        ease: [{ ease: ["linear", "initial", q, $, B] }],
        delay: [{ delay: [ie, $, B] }],
        animate: [{ animate: ["none", le, $, B] }],
        backface: [{ backface: ["hidden", "visible"] }],
        perspective: [{ perspective: [_, $, B] }],
        "perspective-origin": [{ "perspective-origin": se() }],
        rotate: [{ rotate: ge() }],
        "rotate-x": [{ "rotate-x": ge() }],
        "rotate-y": [{ "rotate-y": ge() }],
        "rotate-z": [{ "rotate-z": ge() }],
        scale: [{ scale: Ie() }],
        "scale-x": [{ "scale-x": Ie() }],
        "scale-y": [{ "scale-y": Ie() }],
        "scale-z": [{ "scale-z": Ie() }],
        "scale-3d": ["scale-3d"],
        skew: [{ skew: Ft() }],
        "skew-x": [{ "skew-x": Ft() }],
        "skew-y": [{ "skew-y": Ft() }],
        transform: [{ transform: [$, B, "", "none", "gpu", "cpu"] }],
        "transform-origin": [{ origin: se() }],
        "transform-style": [{ transform: ["3d", "flat"] }],
        translate: [{ translate: un() }],
        "translate-x": [{ "translate-x": un() }],
        "translate-y": [{ "translate-y": un() }],
        "translate-z": [{ "translate-z": un() }],
        "translate-none": ["translate-none"],
        accent: [{ accent: C() }],
        appearance: [{ appearance: ["none", "auto"] }],
        "caret-color": [{ caret: C() }],
        "color-scheme": [
          {
            scheme: [
              "normal",
              "dark",
              "light",
              "light-dark",
              "only-dark",
              "only-light",
            ],
          },
        ],
        cursor: [
          {
            cursor: [
              "auto",
              "default",
              "pointer",
              "wait",
              "text",
              "move",
              "help",
              "not-allowed",
              "none",
              "context-menu",
              "progress",
              "cell",
              "crosshair",
              "vertical-text",
              "alias",
              "copy",
              "no-drop",
              "grab",
              "grabbing",
              "all-scroll",
              "col-resize",
              "row-resize",
              "n-resize",
              "e-resize",
              "s-resize",
              "w-resize",
              "ne-resize",
              "nw-resize",
              "se-resize",
              "sw-resize",
              "ew-resize",
              "ns-resize",
              "nesw-resize",
              "nwse-resize",
              "zoom-in",
              "zoom-out",
              $,
              B,
            ],
          },
        ],
        "field-sizing": [{ "field-sizing": ["fixed", "content"] }],
        "pointer-events": [{ "pointer-events": ["auto", "none"] }],
        resize: [{ resize: ["none", "", "y", "x"] }],
        "scroll-behavior": [{ scroll: ["auto", "smooth"] }],
        "scroll-m": [{ "scroll-m": U() }],
        "scroll-mx": [{ "scroll-mx": U() }],
        "scroll-my": [{ "scroll-my": U() }],
        "scroll-ms": [{ "scroll-ms": U() }],
        "scroll-me": [{ "scroll-me": U() }],
        "scroll-mt": [{ "scroll-mt": U() }],
        "scroll-mr": [{ "scroll-mr": U() }],
        "scroll-mb": [{ "scroll-mb": U() }],
        "scroll-ml": [{ "scroll-ml": U() }],
        "scroll-p": [{ "scroll-p": U() }],
        "scroll-px": [{ "scroll-px": U() }],
        "scroll-py": [{ "scroll-py": U() }],
        "scroll-ps": [{ "scroll-ps": U() }],
        "scroll-pe": [{ "scroll-pe": U() }],
        "scroll-pt": [{ "scroll-pt": U() }],
        "scroll-pr": [{ "scroll-pr": U() }],
        "scroll-pb": [{ "scroll-pb": U() }],
        "scroll-pl": [{ "scroll-pl": U() }],
        "snap-align": [{ snap: ["start", "end", "center", "align-none"] }],
        "snap-stop": [{ snap: ["normal", "always"] }],
        "snap-type": [{ snap: ["none", "x", "y", "both"] }],
        "snap-strictness": [{ snap: ["mandatory", "proximity"] }],
        touch: [{ touch: ["auto", "none", "manipulation"] }],
        "touch-x": [{ "touch-pan": ["x", "left", "right"] }],
        "touch-y": [{ "touch-pan": ["y", "up", "down"] }],
        "touch-pz": ["touch-pinch-zoom"],
        select: [{ select: ["none", "text", "all", "auto"] }],
        "will-change": [
          { "will-change": ["auto", "scroll", "contents", "transform", $, B] },
        ],
        fill: [{ fill: ["none", ...C()] }],
        "stroke-w": [{ stroke: [ie, $r, Sn, ys] }],
        stroke: [{ stroke: ["none", ...C()] }],
        "forced-color-adjust": [{ "forced-color-adjust": ["auto", "none"] }],
      },
      conflictingClassGroups: {
        overflow: ["overflow-x", "overflow-y"],
        overscroll: ["overscroll-x", "overscroll-y"],
        inset: [
          "inset-x",
          "inset-y",
          "start",
          "end",
          "top",
          "right",
          "bottom",
          "left",
        ],
        "inset-x": ["right", "left"],
        "inset-y": ["top", "bottom"],
        flex: ["basis", "grow", "shrink"],
        gap: ["gap-x", "gap-y"],
        p: ["px", "py", "ps", "pe", "pt", "pr", "pb", "pl"],
        px: ["pr", "pl"],
        py: ["pt", "pb"],
        m: ["mx", "my", "ms", "me", "mt", "mr", "mb", "ml"],
        mx: ["mr", "ml"],
        my: ["mt", "mb"],
        size: ["w", "h"],
        "font-size": ["leading"],
        "fvn-normal": [
          "fvn-ordinal",
          "fvn-slashed-zero",
          "fvn-figure",
          "fvn-spacing",
          "fvn-fraction",
        ],
        "fvn-ordinal": ["fvn-normal"],
        "fvn-slashed-zero": ["fvn-normal"],
        "fvn-figure": ["fvn-normal"],
        "fvn-spacing": ["fvn-normal"],
        "fvn-fraction": ["fvn-normal"],
        "line-clamp": ["display", "overflow"],
        rounded: [
          "rounded-s",
          "rounded-e",
          "rounded-t",
          "rounded-r",
          "rounded-b",
          "rounded-l",
          "rounded-ss",
          "rounded-se",
          "rounded-ee",
          "rounded-es",
          "rounded-tl",
          "rounded-tr",
          "rounded-br",
          "rounded-bl",
        ],
        "rounded-s": ["rounded-ss", "rounded-es"],
        "rounded-e": ["rounded-se", "rounded-ee"],
        "rounded-t": ["rounded-tl", "rounded-tr"],
        "rounded-r": ["rounded-tr", "rounded-br"],
        "rounded-b": ["rounded-br", "rounded-bl"],
        "rounded-l": ["rounded-tl", "rounded-bl"],
        "border-spacing": ["border-spacing-x", "border-spacing-y"],
        "border-w": [
          "border-w-x",
          "border-w-y",
          "border-w-s",
          "border-w-e",
          "border-w-t",
          "border-w-r",
          "border-w-b",
          "border-w-l",
        ],
        "border-w-x": ["border-w-r", "border-w-l"],
        "border-w-y": ["border-w-t", "border-w-b"],
        "border-color": [
          "border-color-x",
          "border-color-y",
          "border-color-s",
          "border-color-e",
          "border-color-t",
          "border-color-r",
          "border-color-b",
          "border-color-l",
        ],
        "border-color-x": ["border-color-r", "border-color-l"],
        "border-color-y": ["border-color-t", "border-color-b"],
        translate: ["translate-x", "translate-y", "translate-none"],
        "translate-none": [
          "translate",
          "translate-x",
          "translate-y",
          "translate-z",
        ],
        "scroll-m": [
          "scroll-mx",
          "scroll-my",
          "scroll-ms",
          "scroll-me",
          "scroll-mt",
          "scroll-mr",
          "scroll-mb",
          "scroll-ml",
        ],
        "scroll-mx": ["scroll-mr", "scroll-ml"],
        "scroll-my": ["scroll-mt", "scroll-mb"],
        "scroll-p": [
          "scroll-px",
          "scroll-py",
          "scroll-ps",
          "scroll-pe",
          "scroll-pt",
          "scroll-pr",
          "scroll-pb",
          "scroll-pl",
        ],
        "scroll-px": ["scroll-pr", "scroll-pl"],
        "scroll-py": ["scroll-pt", "scroll-pb"],
        touch: ["touch-x", "touch-y", "touch-pz"],
        "touch-x": ["touch"],
        "touch-y": ["touch"],
        "touch-pz": ["touch"],
      },
      conflictingClassGroupModifiers: { "font-size": ["leading"] },
      orderSensitiveModifiers: [
        "*",
        "**",
        "after",
        "backdrop",
        "before",
        "details-content",
        "file",
        "first-letter",
        "first-line",
        "marker",
        "placeholder",
        "selection",
      ],
    };
  },
  Vh = Ch($h);
function hl(...l) {
  return Vh(xd(l));
}
const Gh = dh(
  "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium transition-all disabled:pointer-events-none disabled:opacity-50 [&_svg]:pointer-events-none [&_svg:not([class*='size-'])]:size-4 shrink-0 [&_svg]:shrink-0 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive",
  {
    variants: {
      variant: {
        default: "bg-primary text-primary-foreground hover:bg-primary/90",
        destructive:
          "bg-destructive text-white hover:bg-destructive/90 focus-visible:ring-destructive/20 dark:focus-visible:ring-destructive/40 dark:bg-destructive/60",
        outline:
          "border bg-background text-foreground hover:bg-accent hover:text-accent-foreground dark:bg-input/30 dark:border-input dark:hover:bg-input/50",
        secondary:
          "bg-secondary text-secondary-foreground hover:bg-secondary/80",
        ghost:
          "hover:bg-accent hover:text-accent-foreground dark:hover:bg-accent/50",
        link: "text-primary underline-offset-4 hover:underline",
      },
      size: {
        default: "h-9 px-4 py-2 has-[>svg]:px-3",
        sm: "h-8 rounded-md gap-1.5 px-3 has-[>svg]:px-2.5",
        lg: "h-10 rounded-md px-6 has-[>svg]:px-4",
        icon: "size-9 rounded-md",
      },
    },
    defaultVariants: { variant: "default", size: "default" },
  }
);
function st({ className: l, variant: a, size: s, asChild: c = !1, ...d }) {
  const m = c ? lh : "button";
  return f.jsx(m, {
    "data-slot": "button",
    className: hl(Gh({ variant: a, size: s, className: l })),
    ...d,
  });
}
function Xh({ className: l, type: a, ...s }) {
  return f.jsx("input", {
    type: a,
    "data-slot": "input",
    className: hl(
      "file:text-foreground placeholder:text-muted-foreground selection:bg-primary selection:text-primary-foreground dark:bg-input/30 border-input flex h-9 w-full min-w-0 rounded-md border px-3 py-1 text-base bg-input-background transition-[color,box-shadow] outline-none file:inline-flex file:h-7 file:border-0 file:bg-transparent file:text-sm file:font-medium disabled:pointer-events-none disabled:cursor-not-allowed disabled:opacity-50 md:text-sm",
      "focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]",
      "aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive",
      l
    ),
    ...s,
  });
}
function an(l, a, { checkForDefaultPrevented: s = !0 } = {}) {
  return function (d) {
    if ((l?.(d), s === !1 || !d.defaultPrevented)) return a?.(d);
  };
}
function Yh(l, a) {
  const s = S.createContext(a),
    c = (m) => {
      const { children: w, ...v } = m,
        E = S.useMemo(() => v, Object.values(v));
      return f.jsx(s.Provider, { value: E, children: w });
    };
  c.displayName = l + "Provider";
  function d(m) {
    const w = S.useContext(s);
    if (w) return w;
    if (a !== void 0) return a;
    throw new Error(`\`${m}\` must be used within \`${l}\``);
  }
  return [c, d];
}
function Qh(l, a = []) {
  let s = [];
  function c(m, w) {
    const v = S.createContext(w),
      E = s.length;
    s = [...s, w];
    const j = (R) => {
      const { scope: O, children: L, ...Y } = R,
        _ = O?.[l]?.[E] || v,
        D = S.useMemo(() => Y, Object.values(Y));
      return f.jsx(_.Provider, { value: D, children: L });
    };
    j.displayName = m + "Provider";
    function z(R, O) {
      const L = O?.[l]?.[E] || v,
        Y = S.useContext(L);
      if (Y) return Y;
      if (w !== void 0) return w;
      throw new Error(`\`${R}\` must be used within \`${m}\``);
    }
    return [j, z];
  }
  const d = () => {
    const m = s.map((w) => S.createContext(w));
    return function (v) {
      const E = v?.[l] || m;
      return S.useMemo(() => ({ [`__scope${l}`]: { ...v, [l]: E } }), [v, E]);
    };
  };
  return (d.scopeName = l), [c, Zh(d, ...a)];
}
function Zh(...l) {
  const a = l[0];
  if (l.length === 1) return a;
  const s = () => {
    const c = l.map((d) => ({ useScope: d(), scopeName: d.scopeName }));
    return function (m) {
      const w = c.reduce((v, { useScope: E, scopeName: j }) => {
        const R = E(m)[`__scope${j}`];
        return { ...v, ...R };
      }, {});
      return S.useMemo(() => ({ [`__scope${a.scopeName}`]: w }), [w]);
    };
  };
  return (s.scopeName = a.scopeName), s;
}
var Gr = globalThis?.document ? S.useLayoutEffect : () => {},
  Kh = cd[" useId ".trim().toString()] || (() => {}),
  Jh = 0;
function xs(l) {
  const [a, s] = S.useState(Kh());
  return (
    Gr(() => {
      s((c) => c ?? String(Jh++));
    }, [l]),
    l || (a ? `radix-${a}` : "")
  );
}
var qh = cd[" useInsertionEffect ".trim().toString()] || Gr;
function eg({ prop: l, defaultProp: a, onChange: s = () => {}, caller: c }) {
  const [d, m, w] = tg({ defaultProp: a, onChange: s }),
    v = l !== void 0,
    E = v ? l : d;
  {
    const z = S.useRef(l !== void 0);
    S.useEffect(() => {
      const R = z.current;
      R !== v &&
        console.warn(
          `${c} is changing from ${R ? "controlled" : "uncontrolled"} to ${
            v ? "controlled" : "uncontrolled"
          }. Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component.`
        ),
        (z.current = v);
    }, [v, c]);
  }
  const j = S.useCallback(
    (z) => {
      if (v) {
        const R = ng(z) ? z(l) : z;
        R !== l && w.current?.(R);
      } else m(z);
    },
    [v, l, m, w]
  );
  return [E, j];
}
function tg({ defaultProp: l, onChange: a }) {
  const [s, c] = S.useState(l),
    d = S.useRef(s),
    m = S.useRef(a);
  return (
    qh(() => {
      m.current = a;
    }, [a]),
    S.useEffect(() => {
      d.current !== s && (m.current?.(s), (d.current = s));
    }, [s, d]),
    [s, c, m]
  );
}
function ng(l) {
  return typeof l == "function";
}
var Pd = ud();
const rg = ad(Pd);
var og = [
    "a",
    "button",
    "div",
    "form",
    "h2",
    "h3",
    "img",
    "input",
    "label",
    "li",
    "nav",
    "ol",
    "p",
    "select",
    "span",
    "svg",
    "ul",
  ],
  At = og.reduce((l, a) => {
    const s = Is(`Primitive.${a}`),
      c = S.forwardRef((d, m) => {
        const { asChild: w, ...v } = d,
          E = w ? s : a;
        return (
          typeof window < "u" && (window[Symbol.for("radix-ui")] = !0),
          f.jsx(E, { ...v, ref: m })
        );
      });
    return (c.displayName = `Primitive.${a}`), { ...l, [a]: c };
  }, {});
function lg(l, a) {
  l && Pd.flushSync(() => l.dispatchEvent(a));
}
function Xr(l) {
  const a = S.useRef(l);
  return (
    S.useEffect(() => {
      a.current = l;
    }),
    S.useMemo(
      () =>
        (...s) =>
          a.current?.(...s),
      []
    )
  );
}
function ig(l, a = globalThis?.document) {
  const s = Xr(l);
  S.useEffect(() => {
    const c = (d) => {
      d.key === "Escape" && s(d);
    };
    return (
      a.addEventListener("keydown", c, { capture: !0 }),
      () => a.removeEventListener("keydown", c, { capture: !0 })
    );
  }, [s, a]);
}
var sg = "DismissableLayer",
  zs = "dismissableLayer.update",
  ag = "dismissableLayer.pointerDownOutside",
  ug = "dismissableLayer.focusOutside",
  Zc,
  zd = S.createContext({
    layers: new Set(),
    layersWithOutsidePointerEventsDisabled: new Set(),
    branches: new Set(),
  }),
  Rd = S.forwardRef((l, a) => {
    const {
        disableOutsidePointerEvents: s = !1,
        onEscapeKeyDown: c,
        onPointerDownOutside: d,
        onFocusOutside: m,
        onInteractOutside: w,
        onDismiss: v,
        ...E
      } = l,
      j = S.useContext(zd),
      [z, R] = S.useState(null),
      O = z?.ownerDocument ?? globalThis?.document,
      [, L] = S.useState({}),
      Y = Cn(a, (ee) => R(ee)),
      _ = Array.from(j.layers),
      [D] = [...j.layersWithOutsidePointerEventsDisabled].slice(-1),
      q = _.indexOf(D),
      le = z ? _.indexOf(z) : -1,
      oe = j.layersWithOutsidePointerEventsDisabled.size > 0,
      te = le >= q,
      se = fg((ee) => {
        const U = ee.target,
          ke = [...j.branches].some((Ue) => Ue.contains(U));
        !te || ke || (d?.(ee), w?.(ee), ee.defaultPrevented || v?.());
      }, O),
      de = pg((ee) => {
        const U = ee.target;
        [...j.branches].some((Ue) => Ue.contains(U)) ||
          (m?.(ee), w?.(ee), ee.defaultPrevented || v?.());
      }, O);
    return (
      ig((ee) => {
        le === j.layers.size - 1 &&
          (c?.(ee), !ee.defaultPrevented && v && (ee.preventDefault(), v()));
      }, O),
      S.useEffect(() => {
        if (z)
          return (
            s &&
              (j.layersWithOutsidePointerEventsDisabled.size === 0 &&
                ((Zc = O.body.style.pointerEvents),
                (O.body.style.pointerEvents = "none")),
              j.layersWithOutsidePointerEventsDisabled.add(z)),
            j.layers.add(z),
            Kc(),
            () => {
              s &&
                j.layersWithOutsidePointerEventsDisabled.size === 1 &&
                (O.body.style.pointerEvents = Zc);
            }
          );
      }, [z, O, s, j]),
      S.useEffect(
        () => () => {
          z &&
            (j.layers.delete(z),
            j.layersWithOutsidePointerEventsDisabled.delete(z),
            Kc());
        },
        [z, j]
      ),
      S.useEffect(() => {
        const ee = () => L({});
        return (
          document.addEventListener(zs, ee),
          () => document.removeEventListener(zs, ee)
        );
      }, []),
      f.jsx(At.div, {
        ...E,
        ref: Y,
        style: {
          pointerEvents: oe ? (te ? "auto" : "none") : void 0,
          ...l.style,
        },
        onFocusCapture: an(l.onFocusCapture, de.onFocusCapture),
        onBlurCapture: an(l.onBlurCapture, de.onBlurCapture),
        onPointerDownCapture: an(
          l.onPointerDownCapture,
          se.onPointerDownCapture
        ),
      })
    );
  });
Rd.displayName = sg;
var cg = "DismissableLayerBranch",
  dg = S.forwardRef((l, a) => {
    const s = S.useContext(zd),
      c = S.useRef(null),
      d = Cn(a, c);
    return (
      S.useEffect(() => {
        const m = c.current;
        if (m)
          return (
            s.branches.add(m),
            () => {
              s.branches.delete(m);
            }
          );
      }, [s.branches]),
      f.jsx(At.div, { ...l, ref: d })
    );
  });
dg.displayName = cg;
function fg(l, a = globalThis?.document) {
  const s = Xr(l),
    c = S.useRef(!1),
    d = S.useRef(() => {});
  return (
    S.useEffect(() => {
      const m = (v) => {
          if (v.target && !c.current) {
            let E = function () {
              Td(ag, s, j, { discrete: !0 });
            };
            const j = { originalEvent: v };
            v.pointerType === "touch"
              ? (a.removeEventListener("click", d.current),
                (d.current = E),
                a.addEventListener("click", d.current, { once: !0 }))
              : E();
          } else a.removeEventListener("click", d.current);
          c.current = !1;
        },
        w = window.setTimeout(() => {
          a.addEventListener("pointerdown", m);
        }, 0);
      return () => {
        window.clearTimeout(w),
          a.removeEventListener("pointerdown", m),
          a.removeEventListener("click", d.current);
      };
    }, [a, s]),
    { onPointerDownCapture: () => (c.current = !0) }
  );
}
function pg(l, a = globalThis?.document) {
  const s = Xr(l),
    c = S.useRef(!1);
  return (
    S.useEffect(() => {
      const d = (m) => {
        m.target &&
          !c.current &&
          Td(ug, s, { originalEvent: m }, { discrete: !1 });
      };
      return (
        a.addEventListener("focusin", d),
        () => a.removeEventListener("focusin", d)
      );
    }, [a, s]),
    {
      onFocusCapture: () => (c.current = !0),
      onBlurCapture: () => (c.current = !1),
    }
  );
}
function Kc() {
  const l = new CustomEvent(zs);
  document.dispatchEvent(l);
}
function Td(l, a, s, { discrete: c }) {
  const d = s.originalEvent.target,
    m = new CustomEvent(l, { bubbles: !1, cancelable: !0, detail: s });
  a && d.addEventListener(l, a, { once: !0 }),
    c ? lg(d, m) : d.dispatchEvent(m);
}
var ws = "focusScope.autoFocusOnMount",
  ks = "focusScope.autoFocusOnUnmount",
  Jc = { bubbles: !1, cancelable: !0 },
  mg = "FocusScope",
  Id = S.forwardRef((l, a) => {
    const {
        loop: s = !1,
        trapped: c = !1,
        onMountAutoFocus: d,
        onUnmountAutoFocus: m,
        ...w
      } = l,
      [v, E] = S.useState(null),
      j = Xr(d),
      z = Xr(m),
      R = S.useRef(null),
      O = Cn(a, (_) => E(_)),
      L = S.useRef({
        paused: !1,
        pause() {
          this.paused = !0;
        },
        resume() {
          this.paused = !1;
        },
      }).current;
    S.useEffect(() => {
      if (c) {
        let _ = function (oe) {
            if (L.paused || !v) return;
            const te = oe.target;
            v.contains(te) ? (R.current = te) : sn(R.current, { select: !0 });
          },
          D = function (oe) {
            if (L.paused || !v) return;
            const te = oe.relatedTarget;
            te !== null && (v.contains(te) || sn(R.current, { select: !0 }));
          },
          q = function (oe) {
            if (document.activeElement === document.body)
              for (const se of oe) se.removedNodes.length > 0 && sn(v);
          };
        document.addEventListener("focusin", _),
          document.addEventListener("focusout", D);
        const le = new MutationObserver(q);
        return (
          v && le.observe(v, { childList: !0, subtree: !0 }),
          () => {
            document.removeEventListener("focusin", _),
              document.removeEventListener("focusout", D),
              le.disconnect();
          }
        );
      }
    }, [c, v, L.paused]),
      S.useEffect(() => {
        if (v) {
          ed.add(L);
          const _ = document.activeElement;
          if (!v.contains(_)) {
            const q = new CustomEvent(ws, Jc);
            v.addEventListener(ws, j),
              v.dispatchEvent(q),
              q.defaultPrevented ||
                (hg(wg(Od(v)), { select: !0 }),
                document.activeElement === _ && sn(v));
          }
          return () => {
            v.removeEventListener(ws, j),
              setTimeout(() => {
                const q = new CustomEvent(ks, Jc);
                v.addEventListener(ks, z),
                  v.dispatchEvent(q),
                  q.defaultPrevented || sn(_ ?? document.body, { select: !0 }),
                  v.removeEventListener(ks, z),
                  ed.remove(L);
              }, 0);
          };
        }
      }, [v, j, z, L]);
    const Y = S.useCallback(
      (_) => {
        if ((!s && !c) || L.paused) return;
        const D = _.key === "Tab" && !_.altKey && !_.ctrlKey && !_.metaKey,
          q = document.activeElement;
        if (D && q) {
          const le = _.currentTarget,
            [oe, te] = gg(le);
          oe && te
            ? !_.shiftKey && q === te
              ? (_.preventDefault(), s && sn(oe, { select: !0 }))
              : _.shiftKey &&
                q === oe &&
                (_.preventDefault(), s && sn(te, { select: !0 }))
            : q === le && _.preventDefault();
        }
      },
      [s, c, L.paused]
    );
    return f.jsx(At.div, { tabIndex: -1, ...w, ref: O, onKeyDown: Y });
  });
Id.displayName = mg;
function hg(l, { select: a = !1 } = {}) {
  const s = document.activeElement;
  for (const c of l)
    if ((sn(c, { select: a }), document.activeElement !== s)) return;
}
function gg(l) {
  const a = Od(l),
    s = qc(a, l),
    c = qc(a.reverse(), l);
  return [s, c];
}
function Od(l) {
  const a = [],
    s = document.createTreeWalker(l, NodeFilter.SHOW_ELEMENT, {
      acceptNode: (c) => {
        const d = c.tagName === "INPUT" && c.type === "hidden";
        return c.disabled || c.hidden || d
          ? NodeFilter.FILTER_SKIP
          : c.tabIndex >= 0
          ? NodeFilter.FILTER_ACCEPT
          : NodeFilter.FILTER_SKIP;
      },
    });
  for (; s.nextNode(); ) a.push(s.currentNode);
  return a;
}
function qc(l, a) {
  for (const s of l) if (!vg(s, { upTo: a })) return s;
}
function vg(l, { upTo: a }) {
  if (getComputedStyle(l).visibility === "hidden") return !0;
  for (; l; ) {
    if (a !== void 0 && l === a) return !1;
    if (getComputedStyle(l).display === "none") return !0;
    l = l.parentElement;
  }
  return !1;
}
function yg(l) {
  return l instanceof HTMLInputElement && "select" in l;
}
function sn(l, { select: a = !1 } = {}) {
  if (l && l.focus) {
    const s = document.activeElement;
    l.focus({ preventScroll: !0 }), l !== s && yg(l) && a && l.select();
  }
}
var ed = xg();
function xg() {
  let l = [];
  return {
    add(a) {
      const s = l[0];
      a !== s && s?.pause(), (l = td(l, a)), l.unshift(a);
    },
    remove(a) {
      (l = td(l, a)), l[0]?.resume();
    },
  };
}
function td(l, a) {
  const s = [...l],
    c = s.indexOf(a);
  return c !== -1 && s.splice(c, 1), s;
}
function wg(l) {
  return l.filter((a) => a.tagName !== "A");
}
var kg = "Portal",
  Dd = S.forwardRef((l, a) => {
    const { container: s, ...c } = l,
      [d, m] = S.useState(!1);
    Gr(() => m(!0), []);
    const w = s || (d && globalThis?.document?.body);
    return w ? rg.createPortal(f.jsx(At.div, { ...c, ref: a }), w) : null;
  });
Dd.displayName = kg;
function Ng(l, a) {
  return S.useReducer((s, c) => a[s][c] ?? s, l);
}
var gl = (l) => {
  const { present: a, children: s } = l,
    c = Sg(a),
    d =
      typeof s == "function" ? s({ present: c.isPresent }) : S.Children.only(s),
    m = Cn(c.ref, Eg(d));
  return typeof s == "function" || c.isPresent
    ? S.cloneElement(d, { ref: m })
    : null;
};
gl.displayName = "Presence";
function Sg(l) {
  const [a, s] = S.useState(),
    c = S.useRef(null),
    d = S.useRef(l),
    m = S.useRef("none"),
    w = l ? "mounted" : "unmounted",
    [v, E] = Ng(w, {
      mounted: { UNMOUNT: "unmounted", ANIMATION_OUT: "unmountSuspended" },
      unmountSuspended: { MOUNT: "mounted", ANIMATION_END: "unmounted" },
      unmounted: { MOUNT: "mounted" },
    });
  return (
    S.useEffect(() => {
      const j = sl(c.current);
      m.current = v === "mounted" ? j : "none";
    }, [v]),
    Gr(() => {
      const j = c.current,
        z = d.current;
      if (z !== l) {
        const O = m.current,
          L = sl(j);
        l
          ? E("MOUNT")
          : L === "none" || j?.display === "none"
          ? E("UNMOUNT")
          : E(z && O !== L ? "ANIMATION_OUT" : "UNMOUNT"),
          (d.current = l);
      }
    }, [l, E]),
    Gr(() => {
      if (a) {
        let j;
        const z = a.ownerDocument.defaultView ?? window,
          R = (L) => {
            const _ = sl(c.current).includes(CSS.escape(L.animationName));
            if (L.target === a && _ && (E("ANIMATION_END"), !d.current)) {
              const D = a.style.animationFillMode;
              (a.style.animationFillMode = "forwards"),
                (j = z.setTimeout(() => {
                  a.style.animationFillMode === "forwards" &&
                    (a.style.animationFillMode = D);
                }));
            }
          },
          O = (L) => {
            L.target === a && (m.current = sl(c.current));
          };
        return (
          a.addEventListener("animationstart", O),
          a.addEventListener("animationcancel", R),
          a.addEventListener("animationend", R),
          () => {
            z.clearTimeout(j),
              a.removeEventListener("animationstart", O),
              a.removeEventListener("animationcancel", R),
              a.removeEventListener("animationend", R);
          }
        );
      } else E("ANIMATION_END");
    }, [a, E]),
    {
      isPresent: ["mounted", "unmountSuspended"].includes(v),
      ref: S.useCallback((j) => {
        (c.current = j ? getComputedStyle(j) : null), s(j);
      }, []),
    }
  );
}
function sl(l) {
  return l?.animationName || "none";
}
function Eg(l) {
  let a = Object.getOwnPropertyDescriptor(l.props, "ref")?.get,
    s = a && "isReactWarning" in a && a.isReactWarning;
  return s
    ? l.ref
    : ((a = Object.getOwnPropertyDescriptor(l, "ref")?.get),
      (s = a && "isReactWarning" in a && a.isReactWarning),
      s ? l.props.ref : l.props.ref || l.ref);
}
var Ns = 0;
function Cg() {
  S.useEffect(() => {
    const l = document.querySelectorAll("[data-radix-focus-guard]");
    return (
      document.body.insertAdjacentElement("afterbegin", l[0] ?? nd()),
      document.body.insertAdjacentElement("beforeend", l[1] ?? nd()),
      Ns++,
      () => {
        Ns === 1 &&
          document
            .querySelectorAll("[data-radix-focus-guard]")
            .forEach((a) => a.remove()),
          Ns--;
      }
    );
  }, []);
}
function nd() {
  const l = document.createElement("span");
  return (
    l.setAttribute("data-radix-focus-guard", ""),
    (l.tabIndex = 0),
    (l.style.outline = "none"),
    (l.style.opacity = "0"),
    (l.style.position = "fixed"),
    (l.style.pointerEvents = "none"),
    l
  );
}
var bt = function () {
  return (
    (bt =
      Object.assign ||
      function (a) {
        for (var s, c = 1, d = arguments.length; c < d; c++) {
          s = arguments[c];
          for (var m in s)
            Object.prototype.hasOwnProperty.call(s, m) && (a[m] = s[m]);
        }
        return a;
      }),
    bt.apply(this, arguments)
  );
};
function Ld(l, a) {
  var s = {};
  for (var c in l)
    Object.prototype.hasOwnProperty.call(l, c) &&
      a.indexOf(c) < 0 &&
      (s[c] = l[c]);
  if (l != null && typeof Object.getOwnPropertySymbols == "function")
    for (var d = 0, c = Object.getOwnPropertySymbols(l); d < c.length; d++)
      a.indexOf(c[d]) < 0 &&
        Object.prototype.propertyIsEnumerable.call(l, c[d]) &&
        (s[c[d]] = l[c[d]]);
  return s;
}
function jg(l, a, s) {
  if (s || arguments.length === 2)
    for (var c = 0, d = a.length, m; c < d; c++)
      (m || !(c in a)) &&
        (m || (m = Array.prototype.slice.call(a, 0, c)), (m[c] = a[c]));
  return l.concat(m || Array.prototype.slice.call(a));
}
var fl = "right-scroll-bar-position",
  pl = "width-before-scroll-bar",
  _g = "with-scroll-bars-hidden",
  bg = "--removed-body-scroll-bar-size";
function Ss(l, a) {
  return typeof l == "function" ? l(a) : l && (l.current = a), l;
}
function Mg(l, a) {
  var s = S.useState(function () {
    return {
      value: l,
      callback: a,
      facade: {
        get current() {
          return s.value;
        },
        set current(c) {
          var d = s.value;
          d !== c && ((s.value = c), s.callback(c, d));
        },
      },
    };
  })[0];
  return (s.callback = a), s.facade;
}
var Pg = typeof window < "u" ? S.useLayoutEffect : S.useEffect,
  rd = new WeakMap();
function zg(l, a) {
  var s = Mg(null, function (c) {
    return l.forEach(function (d) {
      return Ss(d, c);
    });
  });
  return (
    Pg(
      function () {
        var c = rd.get(s);
        if (c) {
          var d = new Set(c),
            m = new Set(l),
            w = s.current;
          d.forEach(function (v) {
            m.has(v) || Ss(v, null);
          }),
            m.forEach(function (v) {
              d.has(v) || Ss(v, w);
            });
        }
        rd.set(s, l);
      },
      [l]
    ),
    s
  );
}
function Rg(l) {
  return l;
}
function Tg(l, a) {
  a === void 0 && (a = Rg);
  var s = [],
    c = !1,
    d = {
      read: function () {
        if (c)
          throw new Error(
            "Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`."
          );
        return s.length ? s[s.length - 1] : l;
      },
      useMedium: function (m) {
        var w = a(m, c);
        return (
          s.push(w),
          function () {
            s = s.filter(function (v) {
              return v !== w;
            });
          }
        );
      },
      assignSyncMedium: function (m) {
        for (c = !0; s.length; ) {
          var w = s;
          (s = []), w.forEach(m);
        }
        s = {
          push: function (v) {
            return m(v);
          },
          filter: function () {
            return s;
          },
        };
      },
      assignMedium: function (m) {
        c = !0;
        var w = [];
        if (s.length) {
          var v = s;
          (s = []), v.forEach(m), (w = s);
        }
        var E = function () {
            var z = w;
            (w = []), z.forEach(m);
          },
          j = function () {
            return Promise.resolve().then(E);
          };
        j(),
          (s = {
            push: function (z) {
              w.push(z), j();
            },
            filter: function (z) {
              return (w = w.filter(z)), s;
            },
          });
      },
    };
  return d;
}
function Ig(l) {
  l === void 0 && (l = {});
  var a = Tg(null);
  return (a.options = bt({ async: !0, ssr: !1 }, l)), a;
}
var Ad = function (l) {
  var a = l.sideCar,
    s = Ld(l, ["sideCar"]);
  if (!a)
    throw new Error(
      "Sidecar: please provide `sideCar` property to import the right car"
    );
  var c = a.read();
  if (!c) throw new Error("Sidecar medium not found");
  return S.createElement(c, bt({}, s));
};
Ad.isSideCarExport = !0;
function Og(l, a) {
  return l.useMedium(a), Ad;
}
var Fd = Ig(),
  Es = function () {},
  vl = S.forwardRef(function (l, a) {
    var s = S.useRef(null),
      c = S.useState({
        onScrollCapture: Es,
        onWheelCapture: Es,
        onTouchMoveCapture: Es,
      }),
      d = c[0],
      m = c[1],
      w = l.forwardProps,
      v = l.children,
      E = l.className,
      j = l.removeScrollBar,
      z = l.enabled,
      R = l.shards,
      O = l.sideCar,
      L = l.noRelative,
      Y = l.noIsolation,
      _ = l.inert,
      D = l.allowPinchZoom,
      q = l.as,
      le = q === void 0 ? "div" : q,
      oe = l.gapMode,
      te = Ld(l, [
        "forwardProps",
        "children",
        "className",
        "removeScrollBar",
        "enabled",
        "shards",
        "sideCar",
        "noRelative",
        "noIsolation",
        "inert",
        "allowPinchZoom",
        "as",
        "gapMode",
      ]),
      se = O,
      de = zg([s, a]),
      ee = bt(bt({}, te), d);
    return S.createElement(
      S.Fragment,
      null,
      z &&
        S.createElement(se, {
          sideCar: Fd,
          removeScrollBar: j,
          shards: R,
          noRelative: L,
          noIsolation: Y,
          inert: _,
          setCallbacks: m,
          allowPinchZoom: !!D,
          lockRef: s,
          gapMode: oe,
        }),
      w
        ? S.cloneElement(S.Children.only(v), bt(bt({}, ee), { ref: de }))
        : S.createElement(le, bt({}, ee, { className: E, ref: de }), v)
    );
  });
vl.defaultProps = { enabled: !0, removeScrollBar: !0, inert: !1 };
vl.classNames = { fullWidth: pl, zeroRight: fl };
var Dg = function () {
  if (typeof __webpack_nonce__ < "u") return __webpack_nonce__;
};
function Lg() {
  if (!document) return null;
  var l = document.createElement("style");
  l.type = "text/css";
  var a = Dg();
  return a && l.setAttribute("nonce", a), l;
}
function Ag(l, a) {
  l.styleSheet
    ? (l.styleSheet.cssText = a)
    : l.appendChild(document.createTextNode(a));
}
function Fg(l) {
  var a = document.head || document.getElementsByTagName("head")[0];
  a.appendChild(l);
}
var Hg = function () {
    var l = 0,
      a = null;
    return {
      add: function (s) {
        l == 0 && (a = Lg()) && (Ag(a, s), Fg(a)), l++;
      },
      remove: function () {
        l--,
          !l && a && (a.parentNode && a.parentNode.removeChild(a), (a = null));
      },
    };
  },
  Ug = function () {
    var l = Hg();
    return function (a, s) {
      S.useEffect(
        function () {
          return (
            l.add(a),
            function () {
              l.remove();
            }
          );
        },
        [a && s]
      );
    };
  },
  Hd = function () {
    var l = Ug(),
      a = function (s) {
        var c = s.styles,
          d = s.dynamic;
        return l(c, d), null;
      };
    return a;
  },
  Wg = { left: 0, top: 0, right: 0, gap: 0 },
  Cs = function (l) {
    return parseInt(l || "", 10) || 0;
  },
  Bg = function (l) {
    var a = window.getComputedStyle(document.body),
      s = a[l === "padding" ? "paddingLeft" : "marginLeft"],
      c = a[l === "padding" ? "paddingTop" : "marginTop"],
      d = a[l === "padding" ? "paddingRight" : "marginRight"];
    return [Cs(s), Cs(c), Cs(d)];
  },
  $g = function (l) {
    if ((l === void 0 && (l = "margin"), typeof window > "u")) return Wg;
    var a = Bg(l),
      s = document.documentElement.clientWidth,
      c = window.innerWidth;
    return {
      left: a[0],
      top: a[1],
      right: a[2],
      gap: Math.max(0, c - s + a[2] - a[0]),
    };
  },
  Vg = Hd(),
  tr = "data-scroll-locked",
  Gg = function (l, a, s, c) {
    var d = l.left,
      m = l.top,
      w = l.right,
      v = l.gap;
    return (
      s === void 0 && (s = "margin"),
      `
  .`
        .concat(
          _g,
          ` {
   overflow: hidden `
        )
        .concat(
          c,
          `;
   padding-right: `
        )
        .concat(v, "px ")
        .concat(
          c,
          `;
  }
  body[`
        )
        .concat(
          tr,
          `] {
    overflow: hidden `
        )
        .concat(
          c,
          `;
    overscroll-behavior: contain;
    `
        )
        .concat(
          [
            a && "position: relative ".concat(c, ";"),
            s === "margin" &&
              `
    padding-left: `
                .concat(
                  d,
                  `px;
    padding-top: `
                )
                .concat(
                  m,
                  `px;
    padding-right: `
                )
                .concat(
                  w,
                  `px;
    margin-left:0;
    margin-top:0;
    margin-right: `
                )
                .concat(v, "px ")
                .concat(
                  c,
                  `;
    `
                ),
            s === "padding" &&
              "padding-right: ".concat(v, "px ").concat(c, ";"),
          ]
            .filter(Boolean)
            .join(""),
          `
  }
  
  .`
        )
        .concat(
          fl,
          ` {
    right: `
        )
        .concat(v, "px ")
        .concat(
          c,
          `;
  }
  
  .`
        )
        .concat(
          pl,
          ` {
    margin-right: `
        )
        .concat(v, "px ")
        .concat(
          c,
          `;
  }
  
  .`
        )
        .concat(fl, " .")
        .concat(
          fl,
          ` {
    right: 0 `
        )
        .concat(
          c,
          `;
  }
  
  .`
        )
        .concat(pl, " .")
        .concat(
          pl,
          ` {
    margin-right: 0 `
        )
        .concat(
          c,
          `;
  }
  
  body[`
        )
        .concat(
          tr,
          `] {
    `
        )
        .concat(bg, ": ")
        .concat(
          v,
          `px;
  }
`
        )
    );
  },
  od = function () {
    var l = parseInt(document.body.getAttribute(tr) || "0", 10);
    return isFinite(l) ? l : 0;
  },
  Xg = function () {
    S.useEffect(function () {
      return (
        document.body.setAttribute(tr, (od() + 1).toString()),
        function () {
          var l = od() - 1;
          l <= 0
            ? document.body.removeAttribute(tr)
            : document.body.setAttribute(tr, l.toString());
        }
      );
    }, []);
  },
  Yg = function (l) {
    var a = l.noRelative,
      s = l.noImportant,
      c = l.gapMode,
      d = c === void 0 ? "margin" : c;
    Xg();
    var m = S.useMemo(
      function () {
        return $g(d);
      },
      [d]
    );
    return S.createElement(Vg, { styles: Gg(m, !a, d, s ? "" : "!important") });
  },
  Rs = !1;
if (typeof window < "u")
  try {
    var al = Object.defineProperty({}, "passive", {
      get: function () {
        return (Rs = !0), !0;
      },
    });
    window.addEventListener("test", al, al),
      window.removeEventListener("test", al, al);
  } catch {
    Rs = !1;
  }
var Jn = Rs ? { passive: !1 } : !1,
  Qg = function (l) {
    return l.tagName === "TEXTAREA";
  },
  Ud = function (l, a) {
    if (!(l instanceof Element)) return !1;
    var s = window.getComputedStyle(l);
    return (
      s[a] !== "hidden" &&
      !(s.overflowY === s.overflowX && !Qg(l) && s[a] === "visible")
    );
  },
  Zg = function (l) {
    return Ud(l, "overflowY");
  },
  Kg = function (l) {
    return Ud(l, "overflowX");
  },
  ld = function (l, a) {
    var s = a.ownerDocument,
      c = a;
    do {
      typeof ShadowRoot < "u" && c instanceof ShadowRoot && (c = c.host);
      var d = Wd(l, c);
      if (d) {
        var m = Bd(l, c),
          w = m[1],
          v = m[2];
        if (w > v) return !0;
      }
      c = c.parentNode;
    } while (c && c !== s.body);
    return !1;
  },
  Jg = function (l) {
    var a = l.scrollTop,
      s = l.scrollHeight,
      c = l.clientHeight;
    return [a, s, c];
  },
  qg = function (l) {
    var a = l.scrollLeft,
      s = l.scrollWidth,
      c = l.clientWidth;
    return [a, s, c];
  },
  Wd = function (l, a) {
    return l === "v" ? Zg(a) : Kg(a);
  },
  Bd = function (l, a) {
    return l === "v" ? Jg(a) : qg(a);
  },
  ev = function (l, a) {
    return l === "h" && a === "rtl" ? -1 : 1;
  },
  tv = function (l, a, s, c, d) {
    var m = ev(l, window.getComputedStyle(a).direction),
      w = m * c,
      v = s.target,
      E = a.contains(v),
      j = !1,
      z = w > 0,
      R = 0,
      O = 0;
    do {
      if (!v) break;
      var L = Bd(l, v),
        Y = L[0],
        _ = L[1],
        D = L[2],
        q = _ - D - m * Y;
      (Y || q) && Wd(l, v) && ((R += q), (O += Y));
      var le = v.parentNode;
      v = le && le.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? le.host : le;
    } while ((!E && v !== document.body) || (E && (a.contains(v) || a === v)));
    return ((z && Math.abs(R) < 1) || (!z && Math.abs(O) < 1)) && (j = !0), j;
  },
  ul = function (l) {
    return "changedTouches" in l
      ? [l.changedTouches[0].clientX, l.changedTouches[0].clientY]
      : [0, 0];
  },
  id = function (l) {
    return [l.deltaX, l.deltaY];
  },
  sd = function (l) {
    return l && "current" in l ? l.current : l;
  },
  nv = function (l, a) {
    return l[0] === a[0] && l[1] === a[1];
  },
  rv = function (l) {
    return `
  .block-interactivity-`
      .concat(
        l,
        ` {pointer-events: none;}
  .allow-interactivity-`
      )
      .concat(
        l,
        ` {pointer-events: all;}
`
      );
  },
  ov = 0,
  qn = [];
function lv(l) {
  var a = S.useRef([]),
    s = S.useRef([0, 0]),
    c = S.useRef(),
    d = S.useState(ov++)[0],
    m = S.useState(Hd)[0],
    w = S.useRef(l);
  S.useEffect(
    function () {
      w.current = l;
    },
    [l]
  ),
    S.useEffect(
      function () {
        if (l.inert) {
          document.body.classList.add("block-interactivity-".concat(d));
          var _ = jg([l.lockRef.current], (l.shards || []).map(sd), !0).filter(
            Boolean
          );
          return (
            _.forEach(function (D) {
              return D.classList.add("allow-interactivity-".concat(d));
            }),
            function () {
              document.body.classList.remove("block-interactivity-".concat(d)),
                _.forEach(function (D) {
                  return D.classList.remove("allow-interactivity-".concat(d));
                });
            }
          );
        }
      },
      [l.inert, l.lockRef.current, l.shards]
    );
  var v = S.useCallback(function (_, D) {
      if (
        ("touches" in _ && _.touches.length === 2) ||
        (_.type === "wheel" && _.ctrlKey)
      )
        return !w.current.allowPinchZoom;
      var q = ul(_),
        le = s.current,
        oe = "deltaX" in _ ? _.deltaX : le[0] - q[0],
        te = "deltaY" in _ ? _.deltaY : le[1] - q[1],
        se,
        de = _.target,
        ee = Math.abs(oe) > Math.abs(te) ? "h" : "v";
      if ("touches" in _ && ee === "h" && de.type === "range") return !1;
      var U = ld(ee, de);
      if (!U) return !0;
      if (
        (U ? (se = ee) : ((se = ee === "v" ? "h" : "v"), (U = ld(ee, de))), !U)
      )
        return !1;
      if (
        (!c.current && "changedTouches" in _ && (oe || te) && (c.current = se),
        !se)
      )
        return !0;
      var ke = c.current || se;
      return tv(ke, D, _, ke === "h" ? oe : te);
    }, []),
    E = S.useCallback(function (_) {
      var D = _;
      if (!(!qn.length || qn[qn.length - 1] !== m)) {
        var q = "deltaY" in D ? id(D) : ul(D),
          le = a.current.filter(function (se) {
            return (
              se.name === D.type &&
              (se.target === D.target || D.target === se.shadowParent) &&
              nv(se.delta, q)
            );
          })[0];
        if (le && le.should) {
          D.cancelable && D.preventDefault();
          return;
        }
        if (!le) {
          var oe = (w.current.shards || [])
              .map(sd)
              .filter(Boolean)
              .filter(function (se) {
                return se.contains(D.target);
              }),
            te = oe.length > 0 ? v(D, oe[0]) : !w.current.noIsolation;
          te && D.cancelable && D.preventDefault();
        }
      }
    }, []),
    j = S.useCallback(function (_, D, q, le) {
      var oe = {
        name: _,
        delta: D,
        target: q,
        should: le,
        shadowParent: iv(q),
      };
      a.current.push(oe),
        setTimeout(function () {
          a.current = a.current.filter(function (te) {
            return te !== oe;
          });
        }, 1);
    }, []),
    z = S.useCallback(function (_) {
      (s.current = ul(_)), (c.current = void 0);
    }, []),
    R = S.useCallback(function (_) {
      j(_.type, id(_), _.target, v(_, l.lockRef.current));
    }, []),
    O = S.useCallback(function (_) {
      j(_.type, ul(_), _.target, v(_, l.lockRef.current));
    }, []);
  S.useEffect(function () {
    return (
      qn.push(m),
      l.setCallbacks({
        onScrollCapture: R,
        onWheelCapture: R,
        onTouchMoveCapture: O,
      }),
      document.addEventListener("wheel", E, Jn),
      document.addEventListener("touchmove", E, Jn),
      document.addEventListener("touchstart", z, Jn),
      function () {
        (qn = qn.filter(function (_) {
          return _ !== m;
        })),
          document.removeEventListener("wheel", E, Jn),
          document.removeEventListener("touchmove", E, Jn),
          document.removeEventListener("touchstart", z, Jn);
      }
    );
  }, []);
  var L = l.removeScrollBar,
    Y = l.inert;
  return S.createElement(
    S.Fragment,
    null,
    Y ? S.createElement(m, { styles: rv(d) }) : null,
    L
      ? S.createElement(Yg, { noRelative: l.noRelative, gapMode: l.gapMode })
      : null
  );
}
function iv(l) {
  for (var a = null; l !== null; )
    l instanceof ShadowRoot && ((a = l.host), (l = l.host)), (l = l.parentNode);
  return a;
}
const sv = Og(Fd, lv);
var $d = S.forwardRef(function (l, a) {
  return S.createElement(vl, bt({}, l, { ref: a, sideCar: sv }));
});
$d.classNames = vl.classNames;
var av = function (l) {
    if (typeof document > "u") return null;
    var a = Array.isArray(l) ? l[0] : l;
    return a.ownerDocument.body;
  },
  er = new WeakMap(),
  cl = new WeakMap(),
  dl = {},
  js = 0,
  Vd = function (l) {
    return l && (l.host || Vd(l.parentNode));
  },
  uv = function (l, a) {
    return a
      .map(function (s) {
        if (l.contains(s)) return s;
        var c = Vd(s);
        return c && l.contains(c)
          ? c
          : (console.error(
              "aria-hidden",
              s,
              "in not contained inside",
              l,
              ". Doing nothing"
            ),
            null);
      })
      .filter(function (s) {
        return !!s;
      });
  },
  cv = function (l, a, s, c) {
    var d = uv(a, Array.isArray(l) ? l : [l]);
    dl[s] || (dl[s] = new WeakMap());
    var m = dl[s],
      w = [],
      v = new Set(),
      E = new Set(d),
      j = function (R) {
        !R || v.has(R) || (v.add(R), j(R.parentNode));
      };
    d.forEach(j);
    var z = function (R) {
      !R ||
        E.has(R) ||
        Array.prototype.forEach.call(R.children, function (O) {
          if (v.has(O)) z(O);
          else
            try {
              var L = O.getAttribute(c),
                Y = L !== null && L !== "false",
                _ = (er.get(O) || 0) + 1,
                D = (m.get(O) || 0) + 1;
              er.set(O, _),
                m.set(O, D),
                w.push(O),
                _ === 1 && Y && cl.set(O, !0),
                D === 1 && O.setAttribute(s, "true"),
                Y || O.setAttribute(c, "true");
            } catch (q) {
              console.error("aria-hidden: cannot operate on ", O, q);
            }
        });
    };
    return (
      z(a),
      v.clear(),
      js++,
      function () {
        w.forEach(function (R) {
          var O = er.get(R) - 1,
            L = m.get(R) - 1;
          er.set(R, O),
            m.set(R, L),
            O || (cl.has(R) || R.removeAttribute(c), cl.delete(R)),
            L || R.removeAttribute(s);
        }),
          js--,
          js ||
            ((er = new WeakMap()),
            (er = new WeakMap()),
            (cl = new WeakMap()),
            (dl = {}));
      }
    );
  },
  dv = function (l, a, s) {
    s === void 0 && (s = "data-aria-hidden");
    var c = Array.from(Array.isArray(l) ? l : [l]),
      d = av(l);
    return d
      ? (c.push.apply(c, Array.from(d.querySelectorAll("[aria-live], script"))),
        cv(c, d, s, "aria-hidden"))
      : function () {
          return null;
        };
  },
  yl = "Dialog",
  [Gd, Vv] = Qh(yl),
  [fv, kt] = Gd(yl),
  Xd = (l) => {
    const {
        __scopeDialog: a,
        children: s,
        open: c,
        defaultOpen: d,
        onOpenChange: m,
        modal: w = !0,
      } = l,
      v = S.useRef(null),
      E = S.useRef(null),
      [j, z] = eg({ prop: c, defaultProp: d ?? !1, onChange: m, caller: yl });
    return f.jsx(fv, {
      scope: a,
      triggerRef: v,
      contentRef: E,
      contentId: xs(),
      titleId: xs(),
      descriptionId: xs(),
      open: j,
      onOpenChange: z,
      onOpenToggle: S.useCallback(() => z((R) => !R), [z]),
      modal: w,
      children: s,
    });
  };
Xd.displayName = yl;
var Yd = "DialogTrigger",
  Qd = S.forwardRef((l, a) => {
    const { __scopeDialog: s, ...c } = l,
      d = kt(Yd, s),
      m = Cn(a, d.triggerRef);
    return f.jsx(At.button, {
      type: "button",
      "aria-haspopup": "dialog",
      "aria-expanded": d.open,
      "aria-controls": d.contentId,
      "data-state": As(d.open),
      ...c,
      ref: m,
      onClick: an(l.onClick, d.onOpenToggle),
    });
  });
Qd.displayName = Yd;
var Ds = "DialogPortal",
  [pv, Zd] = Gd(Ds, { forceMount: void 0 }),
  Kd = (l) => {
    const { __scopeDialog: a, forceMount: s, children: c, container: d } = l,
      m = kt(Ds, a);
    return f.jsx(pv, {
      scope: a,
      forceMount: s,
      children: S.Children.map(c, (w) =>
        f.jsx(gl, {
          present: s || m.open,
          children: f.jsx(Dd, { asChild: !0, container: d, children: w }),
        })
      ),
    });
  };
Kd.displayName = Ds;
var ml = "DialogOverlay",
  Jd = S.forwardRef((l, a) => {
    const s = Zd(ml, l.__scopeDialog),
      { forceMount: c = s.forceMount, ...d } = l,
      m = kt(ml, l.__scopeDialog);
    return m.modal
      ? f.jsx(gl, {
          present: c || m.open,
          children: f.jsx(hv, { ...d, ref: a }),
        })
      : null;
  });
Jd.displayName = ml;
var mv = Is("DialogOverlay.RemoveScroll"),
  hv = S.forwardRef((l, a) => {
    const { __scopeDialog: s, ...c } = l,
      d = kt(ml, s);
    return f.jsx($d, {
      as: mv,
      allowPinchZoom: !0,
      shards: [d.contentRef],
      children: f.jsx(At.div, {
        "data-state": As(d.open),
        ...c,
        ref: a,
        style: { pointerEvents: "auto", ...c.style },
      }),
    });
  }),
  En = "DialogContent",
  qd = S.forwardRef((l, a) => {
    const s = Zd(En, l.__scopeDialog),
      { forceMount: c = s.forceMount, ...d } = l,
      m = kt(En, l.__scopeDialog);
    return f.jsx(gl, {
      present: c || m.open,
      children: m.modal
        ? f.jsx(gv, { ...d, ref: a })
        : f.jsx(vv, { ...d, ref: a }),
    });
  });
qd.displayName = En;
var gv = S.forwardRef((l, a) => {
    const s = kt(En, l.__scopeDialog),
      c = S.useRef(null),
      d = Cn(a, s.contentRef, c);
    return (
      S.useEffect(() => {
        const m = c.current;
        if (m) return dv(m);
      }, []),
      f.jsx(ef, {
        ...l,
        ref: d,
        trapFocus: s.open,
        disableOutsidePointerEvents: !0,
        onCloseAutoFocus: an(l.onCloseAutoFocus, (m) => {
          m.preventDefault(), s.triggerRef.current?.focus();
        }),
        onPointerDownOutside: an(l.onPointerDownOutside, (m) => {
          const w = m.detail.originalEvent,
            v = w.button === 0 && w.ctrlKey === !0;
          (w.button === 2 || v) && m.preventDefault();
        }),
        onFocusOutside: an(l.onFocusOutside, (m) => m.preventDefault()),
      })
    );
  }),
  vv = S.forwardRef((l, a) => {
    const s = kt(En, l.__scopeDialog),
      c = S.useRef(!1),
      d = S.useRef(!1);
    return f.jsx(ef, {
      ...l,
      ref: a,
      trapFocus: !1,
      disableOutsidePointerEvents: !1,
      onCloseAutoFocus: (m) => {
        l.onCloseAutoFocus?.(m),
          m.defaultPrevented ||
            (c.current || s.triggerRef.current?.focus(), m.preventDefault()),
          (c.current = !1),
          (d.current = !1);
      },
      onInteractOutside: (m) => {
        l.onInteractOutside?.(m),
          m.defaultPrevented ||
            ((c.current = !0),
            m.detail.originalEvent.type === "pointerdown" && (d.current = !0));
        const w = m.target;
        s.triggerRef.current?.contains(w) && m.preventDefault(),
          m.detail.originalEvent.type === "focusin" &&
            d.current &&
            m.preventDefault();
      },
    });
  }),
  ef = S.forwardRef((l, a) => {
    const {
        __scopeDialog: s,
        trapFocus: c,
        onOpenAutoFocus: d,
        onCloseAutoFocus: m,
        ...w
      } = l,
      v = kt(En, s),
      E = S.useRef(null),
      j = Cn(a, E);
    return (
      Cg(),
      f.jsxs(f.Fragment, {
        children: [
          f.jsx(Id, {
            asChild: !0,
            loop: !0,
            trapped: c,
            onMountAutoFocus: d,
            onUnmountAutoFocus: m,
            children: f.jsx(Rd, {
              role: "dialog",
              id: v.contentId,
              "aria-describedby": v.descriptionId,
              "aria-labelledby": v.titleId,
              "data-state": As(v.open),
              ...w,
              ref: j,
              onDismiss: () => v.onOpenChange(!1),
            }),
          }),
          f.jsxs(f.Fragment, {
            children: [
              f.jsx(wv, { titleId: v.titleId }),
              f.jsx(Nv, { contentRef: E, descriptionId: v.descriptionId }),
            ],
          }),
        ],
      })
    );
  }),
  Ls = "DialogTitle",
  yv = S.forwardRef((l, a) => {
    const { __scopeDialog: s, ...c } = l,
      d = kt(Ls, s);
    return f.jsx(At.h2, { id: d.titleId, ...c, ref: a });
  });
yv.displayName = Ls;
var tf = "DialogDescription",
  xv = S.forwardRef((l, a) => {
    const { __scopeDialog: s, ...c } = l,
      d = kt(tf, s);
    return f.jsx(At.p, { id: d.descriptionId, ...c, ref: a });
  });
xv.displayName = tf;
var nf = "DialogClose",
  rf = S.forwardRef((l, a) => {
    const { __scopeDialog: s, ...c } = l,
      d = kt(nf, s);
    return f.jsx(At.button, {
      type: "button",
      ...c,
      ref: a,
      onClick: an(l.onClick, () => d.onOpenChange(!1)),
    });
  });
rf.displayName = nf;
function As(l) {
  return l ? "open" : "closed";
}
var of = "DialogTitleWarning",
  [Gv, lf] = Yh(of, { contentName: En, titleName: Ls, docsSlug: "dialog" }),
  wv = ({ titleId: l }) => {
    const a = lf(of),
      s = `\`${a.contentName}\` requires a \`${a.titleName}\` for the component to be accessible for screen reader users.

If you want to hide the \`${a.titleName}\`, you can wrap it with our VisuallyHidden component.

For more information, see https://radix-ui.com/primitives/docs/components/${a.docsSlug}`;
    return (
      S.useEffect(() => {
        l && (document.getElementById(l) || console.error(s));
      }, [s, l]),
      null
    );
  },
  kv = "DialogDescriptionWarning",
  Nv = ({ contentRef: l, descriptionId: a }) => {
    const c = `Warning: Missing \`Description\` or \`aria-describedby={undefined}\` for {${
      lf(kv).contentName
    }}.`;
    return (
      S.useEffect(() => {
        const d = l.current?.getAttribute("aria-describedby");
        a && d && (document.getElementById(a) || console.warn(c));
      }, [c, l, a]),
      null
    );
  },
  Sv = Xd,
  Ev = Qd,
  Cv = Kd,
  jv = Jd,
  _v = qd,
  bv = rf;
function Mv({ ...l }) {
  return f.jsx(Sv, { "data-slot": "sheet", ...l });
}
function Pv({ ...l }) {
  return f.jsx(Ev, { "data-slot": "sheet-trigger", ...l });
}
function zv({ ...l }) {
  return f.jsx(Cv, { "data-slot": "sheet-portal", ...l });
}
function Rv({ className: l, ...a }) {
  return f.jsx(jv, {
    "data-slot": "sheet-overlay",
    className: hl(
      "data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 z-50 bg-black/50",
      l
    ),
    ...a,
  });
}
function Tv({ className: l, children: a, side: s = "right", ...c }) {
  return f.jsxs(zv, {
    children: [
      f.jsx(Rv, {}),
      f.jsxs(_v, {
        "data-slot": "sheet-content",
        className: hl(
          "bg-background data-[state=open]:animate-in data-[state=closed]:animate-out fixed z-50 flex flex-col gap-4 shadow-lg transition ease-in-out data-[state=closed]:duration-300 data-[state=open]:duration-500",
          s === "right" &&
            "data-[state=closed]:slide-out-to-right data-[state=open]:slide-in-from-right inset-y-0 right-0 h-full w-3/4 border-l sm:max-w-sm",
          s === "left" &&
            "data-[state=closed]:slide-out-to-left data-[state=open]:slide-in-from-left inset-y-0 left-0 h-full w-3/4 border-r sm:max-w-sm",
          s === "top" &&
            "data-[state=closed]:slide-out-to-top data-[state=open]:slide-in-from-top inset-x-0 top-0 h-auto border-b",
          s === "bottom" &&
            "data-[state=closed]:slide-out-to-bottom data-[state=open]:slide-in-from-bottom inset-x-0 bottom-0 h-auto border-t",
          l
        ),
        ...c,
        children: [
          a,
          f.jsxs(bv, {
            className:
              "ring-offset-background focus:ring-ring data-[state=open]:bg-secondary absolute top-4 right-4 rounded-xs opacity-70 transition-opacity hover:opacity-100 focus:ring-2 focus:ring-offset-2 focus:outline-hidden disabled:pointer-events-none",
            children: [
              f.jsx(nh, { className: "size-4" }),
              f.jsx("span", { className: "sr-only", children: "Close" }),
            ],
          }),
        ],
      }),
    ],
  });
}
function Iv() {
  return f.jsx("header", {
    className: "w-full bg-card border-b border-border shadow-sm",
    children: f.jsxs("div", {
      className: "container mx-auto px-4 sm:px-6 lg:px-8",
      children: [
        f.jsxs("div", {
          className: "flex items-center justify-between h-20",
          children: [
            f.jsxs("div", {
              className: "flex items-center gap-4",
              children: [
                f.jsx("div", {
                  className:
                    "w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center border-2 border-primary/20",
                  children: f.jsx(Vr, {
                    className: "h-6 w-6 text-primary fill-primary/20",
                  }),
                }),
                f.jsxs("div", {
                  children: [
                    f.jsx("h1", {
                      className: "text-2xl text-foreground tracking-tight",
                      children: "동반자",
                    }),
                    f.jsx("p", {
                      className: "text-sm text-muted-foreground mt-0.5",
                      children: "유기견 보호소 통합 플랫폼",
                    }),
                  ],
                }),
              ],
            }),
            f.jsx("div", { className: "flex-1" }),
            f.jsxs("div", {
              className: "flex items-center gap-6",
              children: [
                f.jsxs("div", {
                  className: "hidden md:flex items-center relative",
                  children: [
                    f.jsx(Xh, {
                      type: "search",
                      placeholder: "통합검색...",
                      className:
                        "w-80 pr-12 bg-input-background border-border focus:border-primary h-11 rounded-lg",
                    }),
                    f.jsx(hd, {
                      className:
                        "absolute right-4 h-5 w-5 text-muted-foreground",
                    }),
                  ],
                }),
                f.jsxs("div", {
                  className: "flex items-center gap-3",
                  children: [
                    f.jsxs(st, {
                      variant: "outline",
                      size: "sm",
                      className:
                        "text-sm px-4 py-2 h-9 border-border text-foreground hover:bg-primary/5 hover:border-primary/30",
                      children: [
                        f.jsx(Lm, { className: "h-4 w-4 mr-2" }),
                        "로그인",
                      ],
                    }),
                    f.jsxs(st, {
                      size: "sm",
                      className:
                        "text-sm px-4 py-2 h-9 bg-primary text-primary-foreground hover:bg-primary/90",
                      children: [
                        f.jsx(qm, { className: "h-4 w-4 mr-2" }),
                        "회원가입",
                      ],
                    }),
                  ],
                }),
              ],
            }),
          ],
        }),
        f.jsx("nav", {
          className: "border-t border-border",
          children: f.jsxs("div", {
            className: "flex items-center justify-center h-14 relative",
            children: [
              f.jsx("div", {
                className: "hidden lg:flex items-center space-x-12",
                children: [
                  { name: "커뮤니티", href: "#" },
                  { name: "최근구조", href: "#" },
                  { name: "실종신고", href: "#" },
                  { name: "입양하기", href: "#" },
                  { name: "후원하기", href: "#" },
                  { name: "봉사하기", href: "#" },
                  { name: "공지사항", href: "#" },
                ].map((l) =>
                  f.jsxs(
                    "a",
                    {
                      href: l.href,
                      className:
                        "relative text-sm text-foreground hover:text-primary transition-colors duration-200 group py-2",
                      children: [
                        l.name,
                        f.jsx("div", {
                          className:
                            "absolute bottom-0 left-0 w-0 h-0.5 bg-primary group-hover:w-full transition-all duration-200",
                        }),
                      ],
                    },
                    l.name
                  )
                ),
              }),
              f.jsx("div", {
                className: "lg:hidden",
                children: f.jsxs(Mv, {
                  children: [
                    f.jsx(Pv, {
                      asChild: !0,
                      children: f.jsx(st, {
                        variant: "outline",
                        size: "sm",
                        className: "text-sm px-3 py-2 h-8",
                        children: f.jsx(Wm, { className: "h-4 w-4" }),
                      }),
                    }),
                    f.jsx(Tv, {
                      children: f.jsx("div", {
                        className: "space-y-4 mt-8",
                        children: [
                          { name: "커뮤니티", href: "#" },
                          { name: "최근구조", href: "#" },
                          { name: "실종신고", href: "#" },
                          { name: "입양하기", href: "#" },
                          { name: "후원하기", href: "#" },
                          { name: "봉사하기", href: "#" },
                          { name: "공지사항", href: "#" },
                        ].map((l) =>
                          f.jsx(
                            "a",
                            {
                              href: l.href,
                              className:
                                "block text-base text-foreground hover:text-primary py-2",
                              children: l.name,
                            },
                            l.name
                          )
                        ),
                      }),
                    }),
                  ],
                }),
              }),
            ],
          }),
        }),
      ],
    }),
  });
}
const Ov =
  "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iODgiIGhlaWdodD0iODgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgc3Ryb2tlPSIjMDAwIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBvcGFjaXR5PSIuMyIgZmlsbD0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIzLjciPjxyZWN0IHg9IjE2IiB5PSIxNiIgd2lkdGg9IjU2IiBoZWlnaHQ9IjU2IiByeD0iNiIvPjxwYXRoIGQ9Im0xNiA1OCAxNi0xOCAzMiAzMiIvPjxjaXJjbGUgY3g9IjUzIiBjeT0iMzUiIHI9IjciLz48L3N2Zz4KCg==";
function sf(l) {
  const [a, s] = S.useState(!1),
    c = () => {
      s(!0);
    },
    { src: d, alt: m, style: w, className: v, ...E } = l;
  return a
    ? f.jsx("div", {
        className: `inline-block bg-gray-100 text-center align-middle ${
          v ?? ""
        }`,
        style: w,
        children: f.jsx("div", {
          className: "flex items-center justify-center w-full h-full",
          children: f.jsx("img", {
            src: Ov,
            alt: "Error loading image",
            ...E,
            "data-original-url": d,
          }),
        }),
      })
    : f.jsx("img", {
        src: d,
        alt: m,
        className: v,
        style: w,
        ...E,
        onError: c,
      });
}
function Dv() {
  return f.jsxs("section", {
    className: "relative w-full h-[650px] overflow-hidden",
    children: [
      f.jsxs("div", {
        className: "absolute inset-0",
        children: [
          f.jsx(sf, {
            src: "https://images.unsplash.com/photo-1627014450098-8e7ed1084606?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxoYXBweSUyMGZhbWlseSUyMHdpdGglMjByZXNjdWUlMjBkb2clMjBhZG9wdGlvbnxlbnwxfHx8fDE3NTY4Nzk3MTV8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
            alt: "Happy family with rescue dog",
            className: "w-full h-full object-cover",
          }),
          f.jsx("div", { className: "absolute inset-0 bg-black/40" }),
          f.jsx("div", {
            className:
              "absolute inset-0 bg-gradient-to-b from-black/20 via-black/40 to-black/60",
          }),
        ],
      }),
      f.jsx("div", {
        className:
          "relative z-10 container mx-auto px-4 sm:px-6 lg:px-8 h-full",
        children: f.jsxs("div", {
          className:
            "flex flex-col justify-center items-center text-center h-full space-y-8",
          children: [
            f.jsxs("div", {
              className: "space-y-6",
              children: [
                f.jsxs("h1", {
                  className:
                    "text-4xl md:text-5xl lg:text-6xl text-white leading-tight max-w-4xl mx-auto",
                  children: [
                    "지금, ",
                    f.jsx("span", {
                      className: "text-secondary",
                      children: "동반자",
                    }),
                    "와 함께 해주세요.",
                  ],
                }),
                f.jsx("p", {
                  className:
                    "text-xl md:text-2xl text-white/90 max-w-2xl mx-auto leading-relaxed",
                  children: "당신의 참여가 더 많은 생명을 구합니다.",
                }),
              ],
            }),
            f.jsxs("div", {
              className: "space-y-6",
              children: [
                f.jsxs(st, {
                  size: "lg",
                  className:
                    "text-lg px-8 py-4 h-14 bg-white/90 text-foreground hover:bg-white border-0 shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105",
                  children: [
                    f.jsx(pd, { className: "h-5 w-5 mr-3" }),
                    "내 주변 보호소 찾기",
                    f.jsx(fd, { className: "h-5 w-5 ml-3" }),
                  ],
                }),
                f.jsxs("div", {
                  className:
                    "grid grid-cols-1 sm:grid-cols-3 lg:grid-cols-5 gap-4 mt-8 max-w-5xl mx-auto",
                  children: [
                    f.jsxs(st, {
                      size: "lg",
                      className:
                        "flex flex-col items-center gap-3 py-8 h-24 bg-primary/90 text-primary-foreground hover:bg-primary border-0 shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105 backdrop-blur-sm",
                      children: [
                        f.jsx(Vr, { className: "h-7 w-7" }),
                        f.jsx("span", {
                          className: "text-base",
                          children: "최근구조",
                        }),
                      ],
                    }),
                    f.jsxs(st, {
                      size: "lg",
                      variant: "outline",
                      className:
                        "flex flex-col items-center gap-3 py-8 h-24 bg-white/10 text-white border-white/30 hover:bg-white/20 shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105 backdrop-blur-sm",
                      children: [
                        f.jsx(hd, { className: "h-7 w-7" }),
                        f.jsx("span", {
                          className: "text-base",
                          children: "실종신고",
                        }),
                      ],
                    }),
                    f.jsxs(st, {
                      size: "lg",
                      variant: "outline",
                      className:
                        "flex flex-col items-center gap-3 py-8 h-24 bg-white/10 text-white border-white/30 hover:bg-white/20 shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105 backdrop-blur-sm",
                      children: [
                        f.jsx(Tm, { className: "h-7 w-7" }),
                        f.jsx("span", {
                          className: "text-base",
                          children: "입양하기",
                        }),
                      ],
                    }),
                    f.jsxs(st, {
                      size: "lg",
                      variant: "outline",
                      className:
                        "flex flex-col items-center gap-3 py-8 h-24 bg-white/10 text-white border-white/30 hover:bg-white/20 shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105 backdrop-blur-sm",
                      children: [
                        f.jsx(_m, { className: "h-7 w-7" }),
                        f.jsx("span", {
                          className: "text-base",
                          children: "후원하기",
                        }),
                      ],
                    }),
                    f.jsxs(st, {
                      size: "lg",
                      variant: "outline",
                      className:
                        "flex flex-col items-center gap-3 py-8 h-24 bg-white/10 text-white border-white/30 hover:bg-white/20 shadow-lg hover:shadow-xl transition-all duration-300 hover:scale-105 backdrop-blur-sm",
                      children: [
                        f.jsx(gd, { className: "h-7 w-7" }),
                        f.jsx("span", {
                          className: "text-base",
                          children: "봉사하기",
                        }),
                      ],
                    }),
                  ],
                }),
              ],
            }),
          ],
        }),
      }),
      f.jsx("div", {
        className:
          "absolute bottom-0 left-0 right-0 h-20 bg-gradient-to-t from-background to-transparent",
      }),
    ],
  });
}
function Lv({
  name: l,
  age: a,
  breed: s,
  location: c,
  image: d,
  status: m,
  date: w,
  description: v,
}) {
  return f.jsxs("div", {
    className:
      "group rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 flex-shrink-0 w-[280px] cursor-pointer transform hover:-translate-y-2 bg-card border border-border",
    children: [
      f.jsxs("div", {
        className: "relative h-72",
        children: [
          f.jsx(sf, {
            src: d,
            alt: `${l} - ${s}`,
            className:
              "w-full h-full object-cover group-hover:scale-105 transition-transform duration-500",
          }),
          f.jsx("div", {
            className:
              "absolute inset-0 bg-gradient-to-t from-black/30 via-transparent to-transparent",
          }),
          f.jsx("div", {
            className: `absolute top-4 left-4 px-3 py-1.5 rounded-full text-xs backdrop-blur-sm border ${
              m === "rescued"
                ? "bg-secondary/95 text-secondary-foreground border-secondary/20"
                : m === "missing"
                ? "bg-red-500/95 text-white border-red-500/20"
                : "bg-primary/95 text-primary-foreground border-primary/20"
            }`,
            children:
              m === "rescued"
                ? "최근 구조"
                : m === "missing"
                ? "실종"
                : "입양 가능",
          }),
          f.jsx("button", {
            className:
              "absolute top-4 right-4 p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm",
            children: f.jsx(Vr, { className: "h-4 w-4 text-primary" }),
          }),
          f.jsx("div", {
            className:
              "absolute bottom-4 right-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300",
            children: f.jsx("button", {
              className:
                "p-2.5 rounded-full backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/90 border border-border/50 shadow-sm",
              children: f.jsx(pd, { className: "h-4 w-4 text-primary" }),
            }),
          }),
          f.jsx("div", {
            className:
              "absolute bottom-4 left-4 opacity-0 group-hover:opacity-100 transition-opacity duration-300",
            children: f.jsxs("div", {
              className:
                "flex items-center gap-1 px-2 py-1 rounded-full bg-accent/90 backdrop-blur-sm",
              children: [
                f.jsx(Km, { className: "h-3 w-3 text-accent-foreground" }),
                f.jsx("span", {
                  className: "text-xs text-accent-foreground",
                  children: "추천",
                }),
              ],
            }),
          }),
        ],
      }),
      f.jsxs("div", {
        className: "p-6",
        children: [
          f.jsxs("div", {
            className: "flex items-center justify-between mb-3",
            children: [
              f.jsx("h3", {
                className:
                  "text-xl group-hover:text-primary transition-colors text-foreground",
                children: l,
              }),
              f.jsx("span", {
                className:
                  "text-sm px-3 py-1 rounded-full bg-muted text-muted-foreground border border-border",
                children: a,
              }),
            ],
          }),
          f.jsx("p", { className: "text-sm mb-4 text-primary", children: s }),
          v &&
            f.jsx("p", {
              className:
                "text-sm mb-4 line-clamp-2 leading-relaxed text-muted-foreground",
              children: v,
            }),
          f.jsxs("div", {
            className:
              "flex items-center justify-between text-xs pt-4 border-t border-border",
            children: [
              f.jsxs("div", {
                className: "flex items-center gap-2",
                children: [
                  f.jsx(md, { className: "h-4 w-4 text-primary" }),
                  f.jsx("span", {
                    className: "text-muted-foreground",
                    children: c,
                  }),
                ],
              }),
              f.jsxs("div", {
                className: "flex items-center gap-2",
                children: [
                  f.jsx(km, { className: "h-4 w-4 text-primary" }),
                  f.jsx("span", {
                    className: "text-muted-foreground",
                    children: w,
                  }),
                ],
              }),
            ],
          }),
          f.jsx("div", {
            className:
              "mt-4 opacity-0 group-hover:opacity-100 transition-all duration-300",
            children: f.jsx("button", {
              className: `w-full py-2.5 text-sm rounded-lg transition-colors duration-200 border ${
                m === "missing"
                  ? "bg-red-500 text-white hover:bg-red-600 border-red-500/20"
                  : "bg-primary text-primary-foreground hover:bg-primary/90 border-primary/20"
              }`,
              children:
                m === "rescued"
                  ? "자세히 보기"
                  : m === "missing"
                  ? "제보하기"
                  : "입양 신청하기",
            }),
          }),
        ],
      }),
    ],
  });
}
function _s({ title: l, subtitle: a, animals: s }) {
  const [c, d] = S.useState(0),
    m = 5,
    w = Math.ceil(s.length / m),
    v = () => {
      d((L) => Math.min(L + 1, w - 1));
    },
    E = () => {
      d((L) => Math.max(L - 1, 0));
    },
    j = c * m,
    z = s.slice(j, j + m),
    R = s[0]?.status === "rescued",
    O = s[0]?.status === "missing";
  return f.jsxs("section", {
    className: `w-full py-20 px-4 sm:px-6 lg:px-8 relative ${
      R ? "bg-secondary/20" : O ? "bg-red-50" : "bg-background"
    }`,
    children: [
      f.jsx("div", {
        className: "absolute inset-0 opacity-5",
        style: {
          backgroundImage: `url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23${
            R ? "8D7B68" : "A4907C"
          }' fill-opacity='0.4'%3E%3Ccircle cx='7' cy='7' r='1'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E")`,
        },
      }),
      f.jsxs("div", {
        className: "container mx-auto relative",
        children: [
          f.jsx("div", {
            className:
              "flex flex-col lg:flex-row justify-between items-start lg:items-center mb-16 gap-6",
            children: f.jsxs("div", {
              className: "text-left flex-1",
              children: [
                f.jsxs("div", {
                  className:
                    "flex flex-col xl:flex-row xl:items-center gap-4 mb-4",
                  children: [
                    f.jsx("h2", {
                      className: "text-4xl lg:text-5xl text-foreground",
                      children: l,
                    }),
                    f.jsxs("div", {
                      className:
                        "flex flex-wrap items-center gap-4 text-lg text-muted-foreground",
                      children: [
                        f.jsxs("span", {
                          className:
                            "bg-primary/10 px-4 py-2 rounded-lg text-primary whitespace-nowrap",
                          children: ["현재 ", s.length, "마리"],
                        }),
                        R &&
                          f.jsx("span", {
                            className:
                              "bg-green-100 px-4 py-2 rounded-lg text-green-700 whitespace-nowrap",
                            children: "지금까지 1,247마리 구조",
                          }),
                        !R &&
                          !O &&
                          f.jsx("span", {
                            className:
                              "bg-blue-100 px-4 py-2 rounded-lg text-blue-700 whitespace-nowrap",
                            children: "지금까지 3,892마리 입양",
                          }),
                        O &&
                          f.jsx("span", {
                            className:
                              "bg-orange-100 px-4 py-2 rounded-lg text-orange-700 whitespace-nowrap",
                            children: "지금까지 567마리 찾음",
                          }),
                        f.jsx("div", {
                          className: "ml-8",
                          children: f.jsxs(st, {
                            variant: "outline",
                            size: "lg",
                            className:
                              "flex items-center gap-2 px-6 py-3 h-12 border-primary text-primary hover:bg-primary/5",
                            children: [
                              f.jsx(Ym, { className: "h-5 w-5" }),
                              "더보기",
                            ],
                          }),
                        }),
                      ],
                    }),
                  ],
                }),
                a &&
                  f.jsx("p", {
                    className:
                      "text-xl text-muted-foreground leading-relaxed max-w-2xl",
                    children: a,
                  }),
              ],
            }),
          }),
          f.jsxs("div", {
            className: "relative",
            children: [
              f.jsx(st, {
                variant: "outline",
                size: "icon",
                className:
                  "absolute left-0 top-1/2 -translate-y-1/2 z-20 w-12 h-12 shadow-lg border-border backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/95 text-primary hover:bg-primary/10",
                onClick: E,
                disabled: c === 0,
                children: f.jsx(Sm, { className: "h-5 w-5" }),
              }),
              f.jsx(st, {
                variant: "outline",
                size: "icon",
                className:
                  "absolute right-0 top-1/2 -translate-y-1/2 z-20 w-12 h-12 shadow-lg border-border backdrop-blur-sm hover:scale-110 transition-all duration-200 bg-card/95 text-primary hover:bg-primary/10",
                onClick: v,
                disabled: c === w - 1,
                children: f.jsx(Cm, { className: "h-5 w-5" }),
              }),
              f.jsx("div", {
                className: "overflow-hidden mx-8",
                children: f.jsx("div", {
                  className: "grid grid-cols-5 gap-6",
                  children: z.map((L) =>
                    f.jsx(
                      Lv,
                      {
                        name: L.name,
                        age: L.age,
                        breed: L.breed,
                        location: L.location,
                        image: L.image,
                        status: L.status,
                        date: L.date,
                        description: L.description,
                      },
                      L.id
                    )
                  ),
                }),
              }),
            ],
          }),
          f.jsx("div", {
            className: "flex justify-center mt-12 gap-3",
            children: Array.from({ length: w }).map((L, Y) =>
              f.jsx(
                "button",
                {
                  className: `w-3 h-3 rounded-full transition-all duration-200 hover:scale-125 ${
                    Y === c
                      ? "bg-primary shadow-lg"
                      : "bg-muted-foreground/30 hover:bg-muted-foreground/50"
                  }`,
                  onClick: () => d(Y),
                },
                Y
              )
            ),
          }),
        ],
      }),
    ],
  });
}
function Av({ posts: l }) {
  return f.jsxs("section", {
    className: "w-full py-20 px-4 sm:px-6 lg:px-8 relative bg-muted/30",
    children: [
      f.jsx("div", {
        className: "absolute inset-0 opacity-3",
        style: {
          backgroundImage: `url("data:image/svg+xml,%3Csvg width='40' height='40' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23A4907C' fill-opacity='0.2'%3E%3Cpath d='M20 20c0-5.5-4.5-10-10-10s-10 4.5-10 10 4.5 10 10 10 10-4.5 10-10zm10 0c0-5.5-4.5-10-10-10s-10 4.5-10 10 4.5 10 10 10 10-4.5 10-10z'/%3E%3C/g%3E%3C/svg%3E")`,
        },
      }),
      f.jsxs("div", {
        className: "container mx-auto relative",
        children: [
          f.jsxs("div", {
            className: "text-center mb-16",
            children: [
              f.jsx("h2", {
                className: "text-4xl lg:text-5xl mb-4 text-foreground",
                children: "커뮤니티",
              }),
              f.jsx("p", {
                className:
                  "text-xl mb-10 max-w-2xl mx-auto text-muted-foreground leading-relaxed",
                children: "보호소의 일상과 반려동물 이야기들을 나누어보세요",
              }),
            ],
          }),
          f.jsx("div", {
            className:
              "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-12",
            children: l.slice(0, 9).map((a, s) =>
              f.jsxs(
                "div",
                {
                  className:
                    "bg-card border border-border rounded-xl p-6 hover:shadow-lg transition-all duration-200 cursor-pointer hover:border-primary/30 group",
                  children: [
                    f.jsxs("div", {
                      className: "flex items-start justify-between mb-3",
                      children: [
                        f.jsx("span", {
                          className: `text-xs px-2 py-1 rounded-full ${
                            a.category === "입양 후기"
                              ? "bg-primary/10 text-primary"
                              : a.category === "봉사 후기"
                              ? "bg-accent/10 text-accent-foreground"
                              : a.category === "보호일지"
                              ? "bg-secondary/30 text-secondary-foreground"
                              : "bg-muted text-muted-foreground"
                          }`,
                          children: a.category,
                        }),
                        a.image &&
                          f.jsx("div", {
                            className:
                              "w-2 h-2 bg-primary rounded-full flex-shrink-0",
                          }),
                      ],
                    }),
                    f.jsx("h3", {
                      className:
                        "text-lg mb-3 group-hover:text-primary transition-colors line-clamp-2",
                      children: a.title,
                    }),
                    f.jsx("p", {
                      className:
                        "text-sm text-muted-foreground mb-4 line-clamp-3",
                      children: a.content,
                    }),
                    f.jsxs("div", {
                      className:
                        "flex items-center justify-between text-xs text-muted-foreground",
                      children: [
                        f.jsxs("div", {
                          className: "flex items-center gap-4",
                          children: [
                            f.jsx("span", { children: a.author }),
                            f.jsx("span", { children: a.date }),
                          ],
                        }),
                        f.jsxs("div", {
                          className: "flex items-center gap-3",
                          children: [
                            f.jsxs("div", {
                              className: "flex items-center gap-1",
                              children: [
                                f.jsx($m, { className: "h-3 w-3" }),
                                f.jsx("span", { children: a.comments }),
                              ],
                            }),
                            f.jsxs("div", {
                              className: "flex items-center gap-1",
                              children: [
                                f.jsx(gd, { className: "h-3 w-3" }),
                                f.jsx("span", { children: a.views }),
                              ],
                            }),
                          ],
                        }),
                      ],
                    }),
                  ],
                },
                a.id
              )
            ),
          }),
          f.jsx("div", {
            className: "text-center",
            children: f.jsxs(st, {
              size: "lg",
              className:
                "text-base px-8 py-4 rounded-full shadow-lg hover:shadow-xl transition-all duration-200 hover:scale-105 bg-primary text-primary-foreground",
              children: [
                "더 많은 글 보기",
                f.jsx(fd, { className: "h-5 w-5 ml-3" }),
              ],
            }),
          }),
        ],
      }),
    ],
  });
}
function Fv() {
  return f.jsxs("footer", {
    className:
      "w-full py-16 px-4 sm:px-6 lg:px-8 relative bg-foreground text-background",
    children: [
      f.jsx("div", {
        className: "absolute inset-0 opacity-5",
        style: {
          backgroundImage: `url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23A4907C' fill-opacity='0.3'%3E%3Ccircle cx='7' cy='7' r='1'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E")`,
        },
      }),
      f.jsxs("div", {
        className: "max-w-7xl mx-auto relative",
        children: [
          f.jsxs("div", {
            className: "grid grid-cols-1 md:grid-cols-4 gap-12",
            children: [
              f.jsxs("div", {
                className: "md:col-span-2",
                children: [
                  f.jsxs("div", {
                    className: "flex items-center gap-4 mb-6",
                    children: [
                      f.jsx("div", {
                        className:
                          "w-12 h-12 rounded-full flex items-center justify-center bg-primary/20 border-2 border-primary/30",
                        children: f.jsx(Vr, {
                          className: "h-6 w-6 text-primary fill-primary/20",
                        }),
                      }),
                      f.jsxs("div", {
                        children: [
                          f.jsx("h3", {
                            className: "text-2xl text-background",
                            children: "동반자",
                          }),
                          f.jsx("p", {
                            className: "text-sm text-muted-foreground",
                            children: "유기견 보호소 통합 플랫폼",
                          }),
                        ],
                      }),
                    ],
                  }),
                  f.jsx("p", {
                    className:
                      "text-base mb-8 max-w-md leading-relaxed text-muted-foreground",
                    children:
                      "전국의 유기동물보호소를 통합하여 입양, 후원, 봉사, 커뮤니티 기능을 한곳에서 제공하는 종합 플랫폼입니다. 더 많은 생명을 구하는 일에 함께해주세요.",
                  }),
                  f.jsxs("div", {
                    className: "space-y-4 text-sm",
                    children: [
                      f.jsxs("div", {
                        className: "flex items-center gap-4",
                        children: [
                          f.jsx(Gm, { className: "h-5 w-5 text-primary" }),
                          f.jsx("span", {
                            className: "text-muted-foreground",
                            children: "1588-0000 (평일 9:00-18:00)",
                          }),
                        ],
                      }),
                      f.jsxs("div", {
                        className: "flex items-center gap-4",
                        children: [
                          f.jsx(Fm, { className: "h-5 w-5 text-primary" }),
                          f.jsx("span", {
                            className: "text-muted-foreground",
                            children: "help@dongbanja.kr",
                          }),
                        ],
                      }),
                      f.jsxs("div", {
                        className: "flex items-center gap-4",
                        children: [
                          f.jsx(md, { className: "h-5 w-5 text-primary" }),
                          f.jsx("span", {
                            className: "text-muted-foreground",
                            children: "서울시 강남구 테헤란로 123, 동반자빌딩",
                          }),
                        ],
                      }),
                    ],
                  }),
                  f.jsxs("div", {
                    className: "flex items-center gap-6 mt-8",
                    children: [
                      f.jsx("span", {
                        className: "text-sm text-muted-foreground",
                        children: "Follow us:",
                      }),
                      [
                        { icon: Om, href: "#", name: "Instagram" },
                        { icon: Pm, href: "#", name: "Facebook" },
                        { icon: oh, href: "#", name: "YouTube" },
                      ].map((l, a) =>
                        f.jsx(
                          "a",
                          {
                            href: l.href,
                            className:
                              "w-10 h-10 rounded-full flex items-center justify-center hover:scale-110 transition-all duration-200 bg-primary/20 border border-primary/30 hover:bg-primary/30",
                            title: l.name,
                            children: f.jsx(l.icon, {
                              className: "h-5 w-5 text-primary",
                            }),
                          },
                          a
                        )
                      ),
                    ],
                  }),
                ],
              }),
              f.jsxs("div", {
                children: [
                  f.jsxs("h4", {
                    className:
                      "text-lg mb-6 text-background flex items-center gap-2",
                    children: [
                      f.jsx(Wc, { className: "h-5 w-5 text-primary" }),
                      "빠른 메뉴",
                    ],
                  }),
                  f.jsx("ul", {
                    className: "space-y-4 text-sm",
                    children: [
                      { name: "최근구조", href: "#", count: "19마리" },
                      { name: "입양하기", href: "#", count: "143마리" },
                      { name: "실종신고", href: "#", count: "78마리" },
                      { name: "후원하기", href: "#", count: "₩2.1억" },
                      { name: "봉사하기", href: "#", count: "1,240명" },
                      { name: "커뮤니티", href: "#", count: "2.8K글" },
                      { name: "공지사항", href: "#", count: null },
                    ].map((l) =>
                      f.jsx(
                        "li",
                        {
                          children: f.jsxs("a", {
                            href: l.href,
                            className:
                              "flex items-center justify-between hover:text-primary transition-all duration-200 hover:translate-x-1 text-muted-foreground group",
                            children: [
                              f.jsx("span", { children: l.name }),
                              l.count &&
                                f.jsx("span", {
                                  className:
                                    "text-xs px-2 py-1 rounded-full bg-primary/10 text-primary group-hover:bg-primary/20",
                                  children: l.count,
                                }),
                            ],
                          }),
                        },
                        l.name
                      )
                    ),
                  }),
                ],
              }),
              f.jsxs("div", {
                children: [
                  f.jsx("h4", {
                    className: "text-lg mb-6 text-background",
                    children: "지원 정보",
                  }),
                  f.jsx("ul", {
                    className: "space-y-4 text-sm",
                    children: [
                      "이용약관",
                      "개인정보처리방침",
                      "FAQ",
                      "고객센터",
                      "파트너 등록",
                    ].map((l) =>
                      f.jsx(
                        "li",
                        {
                          children: f.jsx("a", {
                            href: "#",
                            className:
                              "hover:text-primary transition-all duration-200 hover:translate-x-1 text-muted-foreground",
                            children: l,
                          }),
                        },
                        l
                      )
                    ),
                  }),
                  f.jsxs("div", {
                    className:
                      "mt-8 p-4 rounded-xl bg-primary/10 border border-primary/20",
                    children: [
                      f.jsxs("div", {
                        className: "flex items-center gap-3 mb-2",
                        children: [
                          f.jsx(Wc, { className: "h-5 w-5 text-primary" }),
                          f.jsx("span", {
                            className: "text-sm text-primary",
                            children: "통합 인증",
                          }),
                        ],
                      }),
                      f.jsx("p", {
                        className: "text-xs text-muted-foreground",
                        children: "농림축산식품부 · 동물보호단체 공식 인증",
                      }),
                    ],
                  }),
                ],
              }),
            ],
          }),
          f.jsxs("div", {
            className:
              "border-t border-primary/20 mt-16 pt-8 flex flex-col md:flex-row items-center justify-between text-sm",
            children: [
              f.jsx("p", {
                className: "text-muted-foreground",
                children: "© 2024 동반자. All rights reserved.",
              }),
              f.jsxs("div", {
                className: "flex items-center gap-2 mt-4 md:mt-0",
                children: [
                  f.jsx("span", {
                    className: "text-muted-foreground",
                    children: "Made with",
                  }),
                  f.jsx(Vr, {
                    className:
                      "h-4 w-4 mx-1 animate-pulse text-primary fill-primary/20",
                  }),
                  f.jsx("span", {
                    className: "text-muted-foreground",
                    children: "for all animals",
                  }),
                ],
              }),
            ],
          }),
        ],
      }),
    ],
  });
}
const Hv = Array.from({ length: 20 }, (l, a) => {
    const s = [
        {
          name: "초코",
          breed: "믹스견",
          location: "서울시 강남구",
          description:
            "길에서 발견되어 구조된 사랑스러운 아이입니다. 현재 건강검진 중이에요.",
        },
        {
          name: "나비",
          breed: "코리안 숏헤어",
          location: "부산시 해운대구",
          description: "어미 고양이와 함께 구조된 새끼 고양이입니다.",
        },
        {
          name: "구름",
          breed: "푸들 믹스",
          location: "대구시 중구",
          description: "유기되어 구조된 활발한 성격의 강아지입니다.",
        },
        {
          name: "별이",
          breed: "골든 리트리버",
          location: "인천시 연수구",
          description:
            "보호자가 사정으로 인해 보호소에 맡겨진 온순한 대형견입니다.",
        },
        {
          name: "미미",
          breed: "러시안 블루",
          location: "광주시 북구",
          description: "아파트 베란다에서 발견되어 구조된 새끼 고양이입니다.",
        },
      ],
      c = s[a % s.length],
      d = [
        "https://images.unsplash.com/photo-1536862413209-7f2485243f1e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZXNjdWUlMjBkb2clMjBzaGVsdGVyfGVufDF8fHx8MTc1Njc5NDMxMXww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
        "https://images.unsplash.com/photo-1669891732707-4beb1437679a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjdXRlJTIwY2F0JTIwYWRvcHRpb258ZW58MXx8fHwxNzU2ODc3MDY3fDA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
        "https://images.unsplash.com/photo-1733328059553-5d1e986f5078?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwdXBweSUyMHNoZWx0ZXIlMjBjYXJlfGVufDF8fHx8MTc1Njg3NzA2N3ww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
        "https://images.unsplash.com/photo-1730452961410-bfeca9ae4a90?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxnb2xkZW4lMjByZXRyaWV2ZXIlMjBhZG9wdGlvbnxlbnwxfHx8fDE3NTY4NzcwNjh8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
        "https://images.unsplash.com/photo-1609074405294-355851aead3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxraXR0ZW4lMjByZXNjdWUlMjBjdXRlfGVufDF8fHx8MTc1Njg3NzA2OHww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      ];
    return {
      id: (a + 1).toString(),
      name: `${c.name}${a > 4 ? ` ${Math.floor(a / 5) + 1}` : ""}`,
      age: `${Math.floor(Math.random() * 5) + 1}살`,
      breed: c.breed,
      location: c.location,
      image: d[a % d.length],
      status: "rescued",
      date: `2024.01.${String(Math.floor(Math.random() * 28) + 1).padStart(
        2,
        "0"
      )}`,
      description: c.description,
    };
  }),
  Uv = Array.from({ length: 20 }, (l, a) => {
    const s = [
        {
          name: "햇살",
          breed: "진돗개 믹스",
          location: "서울시 마포구",
          description: "사람을 좋아하고 산책을 즐기는 건강한 강아지입니다.",
        },
        {
          name: "달님",
          breed: "브리티시 숏헤어",
          location: "경기도 성남시",
          description: "조용하고 차분한 성격의 예쁜 고양이입니다.",
        },
        {
          name: "봄이",
          breed: "시츄",
          location: "부산시 사상구",
          description: "귀엽고 애교 많은 소형견입니다. 아이들과도 잘 지내요.",
        },
        {
          name: "코코",
          breed: "라브라도 리트리버",
          location: "대전시 유성구",
          description: "훈련이 잘 되어 있고 성격이 온순한 대형견입니다.",
        },
        {
          name: "루루",
          breed: "먼치킨",
          location: "울산시 남구",
          description: "놀기 좋아하는 활발한 성격의 고양이입니다.",
        },
        {
          name: "마루",
          breed: "비글",
          location: "인천시 남동구",
          description: "활발하고 친근한 비글입니다. 다른 개들과도 잘 어울려요.",
        },
      ],
      c = s[a % s.length],
      d = [
        "https://images.unsplash.com/photo-1536862413209-7f2485243f1e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZXNjdWUlMjBkb2clMjBzaGVsdGVyfGVufDF8fHx8MTc1Njc5NDMxMXww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
        "https://images.unsplash.com/photo-1669891732707-4beb1437679a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjdXRlJTIwY2F0JTIwYWRvcHRpb258ZW58MXx8fHwxNzU2ODc3MDY3fDA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
        "https://images.unsplash.com/photo-1733328059553-5d1e986f5078?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwdXBweSUyMHNoZWx0ZXIlMjBjYXJlfGVufDF8fHx8MTc1Njg3NzA2N3ww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
        "https://images.unsplash.com/photo-1730452961410-bfeca9ae4a90?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxnb2xkZW4lMjByZXRyaWV2ZXIlMjBhZG9wdGlvbnxlbnwxfHx8fDE3NTY4NzcwNjh8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
        "https://images.unsplash.com/photo-1609074405294-355851aead3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxraXR0ZW4lMjByZXNjdWUlMjBjdXRlfGVufDF8fHx8MTc1Njg3NzA2OHww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
        "https://images.unsplash.com/photo-1552053831-71594a27632d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxiZWFnbGUlMjBkb2clMjBhZG9wdGlvbnxlbnwxfHx8fDE3NTY4Nzc2NzZ8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      ];
    return {
      id: (a + 20).toString(),
      name: `${c.name}${a > 5 ? ` ${Math.floor(a / 6) + 1}` : ""}`,
      age: `${Math.floor(Math.random() * 8) + 1}살`,
      breed: c.breed,
      location: c.location,
      image: d[a % d.length],
      status: "adoptable",
      date: "입양 대기",
      description: c.description,
    };
  }),
  Wv = Array.from({ length: 20 }, (l, a) => {
    const s = [
        {
          name: "복실이",
          breed: "스피츠",
          location: "서울시 강서구",
          description:
            "하얀색 털에 갈색 반점이 있는 스피츠입니다. 목줄에 파란색 인식표 착용 중이었습니다.",
        },
        {
          name: "까망이",
          breed: "토종고양이",
          location: "부산시 사하구",
          description:
            "검은색 털에 흰 가슴팟이 있는 고양이입니다. 사람을 무서워하지 않습니다.",
        },
        {
          name: "콩이",
          breed: "말티즈",
          location: "대구시 달서구",
          description: "크림색 털의 말티즈입니다. 분홍색 옷을 입고 있었습니다.",
        },
        {
          name: "털뭉치",
          breed: "페르시안",
          location: "경기도 수원시",
          description: "긴털의 회색 페르시안 고양이입니다. 눈이 크고 둥글어요.",
        },
        {
          name: "바둑이",
          breed: "잡종견",
          location: "광주시 북구",
          description:
            "흑백 얼룩무늬의 중형견입니다. 꼬리가 말려있고 귀가 서있어요.",
        },
      ],
      c = s[a % s.length],
      d = [
        "https://images.unsplash.com/photo-1583337130417-3346a1be7dee?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtaXNzaW5nJTIwZG9nJTIwc3BpdHp8ZW58MXx8fHwxNzU2ODc3Njc2fDA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
        "https://images.unsplash.com/photo-1574144611937-0df059b5ef3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtaXNzaW5nJTIwYmxhY2slMjBjYXR8ZW58MXx8fHwxNzU2ODc3Njc2fDA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
        "https://images.unsplash.com/photo-1551717743-49959800b1f6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtYWx0ZXNlJTIwZG9nJTIwbWlzc2luZ3xlbnwxfHx8fDE3NTY4Nzc2NzZ8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
        "https://images.unsplash.com/photo-1573865526739-10659fec78a5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwZXJzaWFuJTIwY2F0JTIwbWlzc2luZ3xlbnwxfHx8fDE3NTY4Nzc2NzZ8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
        "https://images.unsplash.com/photo-1543466835-00a7907e9de1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtaXNzaW5nJTIwZG9nJTIwbWl4fGVufDF8fHx8MTc1Njg3NzY3Nnww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      ];
    return {
      id: (a + 200).toString(),
      name: `${c.name}${a > 4 ? ` ${Math.floor(a / 5) + 1}` : ""}`,
      age: `${Math.floor(Math.random() * 10) + 1}살`,
      breed: c.breed,
      location: c.location,
      image: d[a % d.length],
      status: "missing",
      date: `2024.01.${String(Math.floor(Math.random() * 28) + 1).padStart(
        2,
        "0"
      )}`,
      description: c.description,
    };
  }),
  Bv = [
    {
      id: "1",
      title: '새로운 가족을 만난 골든 리트리버 "행복이" 근황',
      author: "사랑보호소",
      content:
        "작년에 입양된 행복이가 새 가족과 함께 행복하게 지내고 있다는 소식을 전해드립니다. 매일 산책하며 건강하게 자라고 있어요.",
      image:
        "https://images.unsplash.com/photo-1730452961410-bfeca9ae4a90?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxnb2xkZW4lMjByZXRyaWV2ZXIlMjBhZG9wdGlvbnxlbnwxfHx8fDE3NTY4NzcwNjh8MA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      category: "입양 후기",
      date: "2024.01.25",
      likes: 156,
      comments: 23,
      views: 1024,
    },
    {
      id: "2",
      title: "보호소 봉사활동 후기 - 따뜻한 하루",
      author: "김민수",
      content:
        "오늘 처음으로 보호소 봉사활동에 참여했습니다. 아이들과 함께한 시간이 정말 소중했고, 다음에도 꼭 참여하고 싶어요.",
      image:
        "https://images.unsplash.com/photo-1575470888881-2c5829b9adef?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxhbmltYWwlMjB2b2x1bnRlZXIlMjBzaGVsdGVyfGVufDF8fHx8MTc1Njg3NzA2N3ww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      category: "봉사 후기",
      date: "2024.01.24",
      likes: 89,
      comments: 15,
      views: 567,
    },
    {
      id: "3",
      title: '구조견 "초코"의 치료 과정 기록',
      author: "동물병원 김수의사",
      content:
        "길에서 발견된 초코가 건강을 되찾아가는 과정을 기록합니다. 많은 분들의 관심과 후원 덕분에 회복 중이에요.",
      image:
        "https://images.unsplash.com/photo-1536862413209-7f2485243f1e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxyZXNjdWUlMjBkb2clMjBzaGVsdGVyfGVufDF8fHx8MTc1Njc5NDMxMXww&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral",
      category: "보호일지",
      date: "2024.01.23",
      likes: 234,
      comments: 31,
      views: 891,
    },
    {
      id: "4",
      title: "보호소 겨울나기 준비 완료!",
      author: "희망보호소",
      content:
        "추운 겨울을 맞아 보온용품과 사료 후원에 감사드립니다. 덕분에 아이들이 따뜻하게 겨울을 날 수 있을 것 같아요.",
      category: "보호소 타임라인",
      date: "2024.01.22",
      likes: 178,
      comments: 42,
      views: 1156,
    },
    {
      id: "5",
      title: "강아지 훈련 방법에 대해 질문있어요",
      author: "이수진",
      content:
        "새로 입양한 강아지가 밤에 자꾸 울어서 고민입니다. 좋은 훈련 방법이나 조언 있으시면 공유해주세요.",
      category: "질문과 답변",
      date: "2024.01.21",
      likes: 67,
      comments: 28,
      views: 445,
    },
    {
      id: "6",
      title: "겨울철 유기동물 구조 활동 현황",
      author: "동물구조대",
      content:
        "추운 겨울, 길거리에서 힘들어하는 아이들을 구조하고 있습니다. 시민 여러분의 신고와 관심이 큰 도움이 됩니다.",
      category: "보호소 타임라인",
      date: "2024.01.20",
      likes: 312,
      comments: 56,
      views: 1789,
    },
    {
      id: "7",
      title: '새로 입양된 고양이 "달빛이" 적응기',
      author: "박지혜",
      content:
        "한 달 전 입양한 달빛이가 집에 완전히 적응했어요! 처음엔 숨어만 있던 아이가 이제는 무릎 위에서 잠을 자네요.",
      category: "입양 후기",
      date: "2024.01.19",
      likes: 98,
      comments: 19,
      views: 634,
    },
    {
      id: "8",
      title: "보호소 운영비 후원 현황 공지",
      author: "희망보호소",
      content:
        "12월 한 달간 따뜻한 후원을 해주신 모든 분들께 감사드립니다. 덕분에 겨울철 난방비와 사료비를 충당할 수 있었습니다.",
      category: "보호소 타임라인",
      date: "2024.01.18",
      likes: 203,
      comments: 38,
      views: 987,
    },
    {
      id: "9",
      title: '우리 집 새 식구 "복이" 이야기',
      author: "최민정",
      content:
        "3개월 전 입양한 복이가 우리 가족에게 가져다준 행복은 말로 표현할 수 없어요. 입양을 고민하시는 분들께 추천드려요!",
      category: "입양 후기",
      date: "2024.01.17",
      likes: 145,
      comments: 27,
      views: 756,
    },
  ];
function $v() {
  return f.jsxs("div", {
    className: "min-h-screen bg-background",
    children: [
      f.jsx(Iv, {}),
      f.jsx(Dv, {}),
      f.jsx(_s, {
        title: "최근 구조된 아이들",
        subtitle: "길에서 구조되어 보호받고 있는 아이들입니다",
        animals: Hv,
      }),
      f.jsx(_s, {
        title: "입양을 기다리는 아이들",
        subtitle: "따뜻한 가족을 기다리고 있어요",
        animals: Uv,
      }),
      f.jsx(_s, {
        title: "실종된 아이들",
        subtitle: "가족을 찾고 있어요. 목격하신 분은 제보해주세요",
        animals: Wv,
      }),
      f.jsx(Av, { posts: Bv }),
      f.jsx(Fv, {}),
    ],
  });
}
fm.createRoot(document.getElementById("root")).render(f.jsx($v, {}));
