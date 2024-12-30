#import "../lib.typ": *
#import "@preview/slashion:0.1.1": slash-frac as sfrac
#import "@preview/physica:0.9.3": vb, dotproduct, eval

#show: config("第十六周作业")

#show math.equation.where(block: true): set block(breakable: true)

#prob[
  求解下列常微分方程初值问题相应的 Green 函数：
  $
    dcases(
      (dif^2 x(t)) / (dif t^2) - k^2 x(t) = f(t)\, wide & t > 0\, k > 0,
      x(0) = x_0\, quad eval((dif x(t)) / (dif t))_(t = 0) = v_0. quad & "其中" x_0 "和" v_0 "是已知常数。"
    )
  $
][
  Green 函数 $G(t, tau)$ 满足
  $
    dcases(
      (dif^2 G(t, tau)) / (dif t^2) - k^2 G(t, tau) = delta(t - tau)\, wide & t > 0\, k > 0\, tau > 0,
      eval(G(t, tau))_(t = 0) = 0\, eval((dif G(t, tau)) / (dif t))_(t = 0) = 0
    )
  $
  前一方程的齐次解是显然的：
  $
    p(t, tau) = A sinh k t + B cosh k t => p''(t, tau) - k^2 p(t, tau) = 0
  $
  利用常数变易法
  $
    G(t, tau) = p(t, tau) u(t, tau) => 2 p'(t, tau) u'(t, tau) + p(t, tau) u''(t, tau) = delta(t - tau)
  $
  显然 $u(t, tau) = 1 / (p'(tau, tau)) eta(t - tau)$ 满足上式和边界条件，保持连续性可取 $p(t, tau) = A sinh k (t - tau)$，即
  $
    G(t, tau) = 1 / k sinh k (t - tau) eta(t - tau)
  $
]

#prob[
  求下列常微分方程边值问题相应的 Green 函数：
  #sub(columns: 1)[
    1. $
        dcases(
          (dif^2 y(x)) / (dif x^2) - k^2 y(x) = f(x)\, wide & x > 0\, k > 0,
          eval((dif y(x)) / (dif x))_(x = 0) = v_0\, eval(y(x))_(x -> oo) "有界". quad & "其中" v_0 "是已知常数。"
        )
      $
  ][
    2. $
        dcases(
          (dif^2 y(x)) / (dif x^2) + k^2 y(x) = f(x)\, wide & a < x < b\, k > 0,
          y(a) = y_0\, eval((dif y(x)) / (dif x))_(x = b) = v_0. quad & "其中" y_0 "和" v_0 "是已知常数。"
        )
      $
  ]
][
  + Green 函数 $G(x, xi)$ 满足
    $
      dcases(
        (dif^2 G(x, xi)) / (dif x^2) - k^2 G(x, xi) = delta(x - xi)\, wide & x > 0\, k > 0\, xi > 0,
        eval(G(x, xi))_(x -> oo) = 0\, eval((dif G(x, xi)) / (dif x))_(x = 0) = 0
      )
    $
    容易构造满足边界的函数 $p(x, xi) = cosh k x eta(xi - x) + exp(-k x) eta(x - xi)$，为使其满足前一方程，计算
    $
      (dif p(x, xi)) / (dif x) = k sinh k x eta(xi - x) - k exp(-k x) eta(x - xi) - cosh k x delta(x - xi) + exp(-k x) delta(x - xi) \
      (dif^2 p(x, xi)) / (dif x^2) - k^2 p(x, xi) = (- k sinh k xi - k exp(-k xi)) delta(x - xi) = - k cosh k xi delta(x - xi)
    $
    因此取
    $
      G(x, xi) = - (cosh k x eta(xi - x) + exp(-k x) eta(x - xi)) / (k cosh k xi)
    $
    即可

  + Green 函数 $G(x, xi)$ 满足
    $
      dcases(
        (dif^2 G(x, xi)) / (dif x^2) + k^2 G(x, xi) = delta(x - xi)\, wide & a < x < b\, k > 0\, a < xi < b,
        eval(G(x, xi))_(x = a) = 0\, eval((dif G(x, xi)) / (dif x))_(x = b) = 0
      )
    $
    容易构造满足边界的函数
    $
      p(x, xi) = A sin k (x - a) eta(xi - x) + B cos k (x - b) eta(x - xi)
    $
    满足连续性取
    $
      A sin k (xi - a) = B cos k (xi - b) \
      => p(x, xi) = C (cos k (xi - b) sin k (x - a) eta(xi - x) + cos k (x - b) sin k (xi - a) eta(x - xi))
    $
    计算
    $
      (dif p(x, xi)) / (dif x) = cases(
        C k cos k (xi - b) cos k (x - a)\, wide & a < x < xi,
        - C k sin k (xi - b) sin k (x - a)\, wide & xi < x < b,
        gap: #1em
      )
    $
    可得 $x = xi$ 附近 $p'_+(xi, xi) - p'_-(xi, xi) = - C k cos (xi - xi + b - a) = - C k cos (b - a)$，取
    $
      G(x, xi) = - (cos k (xi - b) sin k (x - a) eta(xi - x) + cos k (x - b) sin k (xi - a) eta(x - xi)) / (k cos k (b - a))
    $
    即可（当 $k(b - a) = (n + 1 / 2) pi, quad n in NN$ 时无解）
]

#prob[
  分别用三种方法（1. 常数变易法，2. 利用 Laplace 变换，3. Green 函数方法）求解下列常微分方程初值问题：
  $
    dcases(
      (dif^2 y(t)) / (dif t^2) + k^2 y(t) = f(t)\, wide & t > 0\, k > 0,
      y(0) = A\, eval((dif y(t)) / (dif t))_(t = 0) = B\;
    )
  $
][
  #set enum(numbering: "1.")
  + 齐次方程显然有解
    $
      p(t) = A cos k t + B / k sin k t => p''(t) + k^2 p(t) = 0
    $
    且满足非齐次边界，故 $y(t) = u(t) + p(t)$，其中 $u(t)$ 满足
    $
      dcases(
        (dif^2 u(t)) / (dif t^2) + k^2 u(t) = f(t)\, wide & t > 0,
        u(0) = 0\, eval((dif u(t)) / (dif t))_(t = 0) = 0
      )
    $
    对 $A sin k t$ 进行常数变易法，$u(t) = q(t) sin k t$，得
    $
      & q''(t) sin k t + 2 k q'(t) cos k t = f(t) \
      => & (q'(t) sin^2 k t)' = f(t) sin k t \
      => & q'(t) sin^2 k t = integral_0^t f(tau) sin k tau dif tau wide ("consider" t -> 0) \
      => & q'(t) = 1 / (sin^2 k t) integral_0^t f(tau) sin k tau dif tau \
      => & q(t) = integral_0^t (dif tau_1) / (sin^2 k tau_1) integral_0^tau_1 f(tau_2) sin k tau_2 dif tau_2 wide ("consider" u'(0) = 0) \
      => & y(t) = A cos k t + B / k sin k t + sin k t integral_0^t (dif tau_1) / (sin^2 k tau_1) integral_0^tau_1 f(tau_2) sin k tau_2 dif tau_2
    $

  + 定义
    $
      Y(p) := & cal(L){y(t)}(p) isimgof y(t)
      F(p) := & cal(L){f(t)}(p) isimgof f(t)
    $
    则
    $
      y'(t) img p Y(p) - y(0), wide y''(t) img p^2 Y(p) - p y(0) - y'(0) = p^2 Y(p) - p A - B
    $
    原方程变为
    $
      p^2 Y(p) - p A - B + k^2 Y(p) = F(p) => Y(p) = F(p) / (p^2 + k^2) + (p A + B) / (p^2 + k^2)
    $
    反演得到
    $
      y(t) = & cal(L)^{-1}{F(p) / (p^2 + k^2)}(t) + cal(L)^{-1}{(p A + B) / (p^2 + k^2)}(t) \
      = & cal(L)^{-1}{F(p) / (p^2 + k^2)}(t) + A cos k t + B sin k t \
      = & A cos k t + B / k sin k t + (1 / k eta(t) sin k t) convolve f(t) \
      = & A cos k t + B / k sin k t + 1 / k integral_0^t sin k (t - tau) f(tau) dif tau
    $

  + Green 函数 $G(t, tau)$ 满足
    $
      dcases(
        (dif^2 G(t, tau)) / (dif t^2) + k^2 G(t, tau) = delta(t - tau)\, wide & t > 0\, k > 0\, tau > 0,
        eval(G(t, tau))_(t = 0) = 0\, eval((dif G(t, tau)) / (dif t))_(t = 0) = 0
      )
    $
    可以根据齐次解构造
    $
      G(t, tau) = 1 / k sin k (t - tau) eta(t - tau)
    $
    从而
    $
      y(t) = G(t, tau) convolve f(tau) + a G(t, 0) + b G'(t, 0)
    $
    解边界条件得
    $
      y(t) = A cos k t + B / k sin k t + 1 / k integral_0^t sin k (t - tau) f(tau) dif tau
    $
]
