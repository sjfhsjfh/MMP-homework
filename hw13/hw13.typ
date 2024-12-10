#import "../lib.typ": config, prob, sub
#import "@preview/physica:0.9.3": eval
#import "@preview/slashion:0.1.1": slash-frac as sfrac

#let Im = math.op("Im")
#let LHS = "LHS"
#let RHS = "RHS"
#let r = "原式"
#let img = "\u{2252}"
#let isimgof = "\u{2253}"
#let Re = math.op("Re")
#let Res = math.op("Res")
#let vp = math.op("v.p.")

#show: config("第十三周作业")

#show math.equation.where(block: true): set block(breakable: true)

#prob[
  通过变换 $z = e^(i theta)$，被积函数 $R(sin theta, cos theta)$ 变为 $f(z) equiv R((z^2 - 1) / (2 i z), (z^2 + 1) / (2 z))$，如果被积函数 $R(sin theta, cos theta)$ 在区间 $[0, 2 pi]$ 中有 $m$ 个瑕点 $theta_(k) med (k = 1, 2, dots.c, m)$，其中 $m$ 为正整数，则 $f(z)$ 在单位圆周 $abs(z) = 1$ 上有 $m$ 个孤立奇点 $beta_k = e^(i theta_k)$。设所有这 $m$ 个孤立奇点 $beta_k$ 均为一阶极点，且 $(f(z)) / z$ 在单位圆 $abs(z) < 1$ 内除了 $n$ 个孤立奇点 $alpha_l med (abs(alpha_l) < 1, med l = 1, 2, dots.c, n)$ 外均解析，其中 $n$ 为正整数，请证明
  $
    integral_0^(2 pi) R(sin theta, cos theta) dif theta = 2 pi sum_(l = 1)^n Res{f(z) / z, alpha_l} + pi sum_(k = 1)^m Res{f(z) / z, beta_k}
  $
][
  同样变换有，注意到此为瑕积分，考虑其主值，则需要使新路径 $L$ 从单位圆外侧绕过单位圆上的奇点，而此时计算的主值积分定义应当取不包含绕行小围道的部分 $epsilon_(k)(delta)$。
  $
    #LHS = & integral.cont.ccw_(abs(z) = 1) f(z) (dif z) / (i z) \
    = & 1 / i integral.cont.ccw_L f(z) / z dif z - lim_(delta -> 0) 1 / i sum_(k = 1)^m integral_(epsilon_(k)(delta)) f(z) / z dif z \
    = & 2 pi (sum_(l = 1)^n Res{f(z) / z, alpha_l} + sum_(k = 1)^m Res{f(z) / z, beta_k}) \
    & - 1 / 2 sum_(k = 1)^m 2 pi Res{f(z) / z, beta_k} \
    = & 2 pi sum_(l = 1)^n Res{f(z) / z, alpha_l} + pi sum_(k = 1)^m Res{f(z) / z, beta_k}
  $
  证毕。
]

#prob[
  计算下列积分：
  #sub()[
    1. $#vp integral_0^oo (dif x) / (1 - x^3)$；
  ][
    2. $integral_0^oo (x - sin x) / (x^3 (1 + x^2)) dif x$；
  ][
    3. $integral_0^oo (sin(x + a) sin(x - a)) / (x^2 - a^2) dif x, quad a > 0$；
  ][
    4. $integral_(-oo)^oo (e^(p x) - e^(q x)) / (1 - e^x) dif x, quad 0 < p < 1, quad 0 < q < 1$；
  ][
    5. $vp integral_0^oo x^(s - 1) / (1 - x) dif x, quad 0 < s < 1$；
  ][
    6. $integral_0^oo (ln^2 x) / ((x + a)(x + b)) dif x, quad b > a > 0$；
  ][
    7. $integral_0^oo (x^(alpha - 1) ln x) / (1 + x) dif x, quad 0 < alpha < 1$；
  ]
][
  + 裂项
    $
      #r = & vp integral_0^oo - 1 / (3 (x - 1)) + (2 + x) / (3 (1 + x + x^2)) dif x \
      = & lim_(R -> oo) vp integral_0^R - 1 / (3 (x - 1)) + (2 + x) / (3 (1 + x + x^2)) dif x \
      = & lim_(R -> oo) (- 1 / 3 vp integral_0^R (dif x) / (x - 1) + integral_0^R (2 + x) / (3 (1 + x + x^2)) dif x) \
      = & lim_(R -> oo) (- 1 / 3 ln R + 1 / 3(sqrt(3) (arctan (1 + 2 R) / sqrt(3) - pi / 6) + 1 / 2 ln(1 + R + R^2))) \
      = & lim_(R -> oo) pi / (3 sqrt(3)) + 1 / 6 ln (1 + 1 / R + 1 / R^2) = pi / (3 sqrt(3))
    $

  + 先利用偶函数，再利用留数定理
    $
      #r = & 1 / 2 integral_(-oo)^oo (x - sin x) / (x^3 (1 + x^2)) dif x \
      = & 1 / 2 Re integral.cont.ccw_(Im z > 0) (z + i e^(i z)) / (z^3 (1 + z^2)) dif z \
      = & 1 / 2 Re (2 pi i Res_(z = i) (z + i e^(i z)) / (z^3 (1 + z^2)) + pi i Res_(z = 0) (z + i e^(i z)) / (z^3 (1 + z^2))) \
      = & 1 / 2 (- (pi (1 + e)) / e + 3 / 2 pi) \
      = & (pi (e - 2)) / (4 e)
    $

  + 同上问
    $
      #r = & integral_0^oo 1 / 2 (cos 2 a - cos 2 x) / (x^2 - a^2) dif x \
      = & 1 / 4 integral_(-oo)^oo (cos 2 a - cos 2 x) / (x^2 - a^2) dif x \
      = & 1 / 4 Re integral.cont.ccw_(Im z > 0) (cos 2 a - e^(2 i z)) / (z^2 - a^2) dif z \
      = & 1 / 4 Re pi i (Res_(z = a) (cos 2 a - e^(2 i z)) / (z^2 - a^2) + Res_(z = -a) (cos 2 a - e^(2 i z)) / (z^2 - a^2)) \
      = & (pi sin 2 a) / (4 a)
    $

  + 注意到被积函数在 $x = 0$ 处为可去间断点，则令 $F(p) := vp integral_(-oo)^oo e^(p x) / (1 - e^x) dif x$ 即有 $#r = F(p) - F(q)$
    $
      F(p) = & vp integral_(-oo)^oo e^(p x) / (1 - e^x) dif x \
      = & vp integral_0^oo u^(p - 1) / (1 - u) dif u
    $
    沿实轴正向作割线，绕过 $z = 1$ 的围道给出
    $
      0 = integral.cont.ccw_L z^(p - 1) / (1 - z) dif z = & F(p) - e^(i 2 (p - 1) pi) F(p) + pi i (Res_(z = e^(0i)) z^(p - 1) / (1 - z) + Res_(z = e^(2 pi i)) z^(p - 1) / (1 - z))
    $
    从而得到
    $
      F(p) = i pi (1 + e^(i 2 (p - 1) pi)) / (1 - e^(i 2 (p - 1) pi)) = pi / tan(p pi)
    $
    因此
    $
      #r = pi (cot p pi - cot q pi)
    $

  + 同上问
    $
      #r = pi / (tan s pi)
    $

  + 变形
    $
      #r = integral_(-oo)^oo (t^2 e^t) / ((e^t + a)(e^t + b)) dif t
    $
    取矩形围道 $L(R): -R -> R -> R + 2 pi i -> -R + 2 pi i -> -R$ 并对特定函数应用留数定理
    $
      #r = & integral_(-oo)^oo e^t / ((e^t + a)(e^t + b)) (P(t) - P(t + 2 pi i) + C) dif t \
      = & 2 pi i (Res_(z = i pi + ln a) (P(t) e^t) / ((e^t + a)(e^t + b)) + Res_(z = i pi + ln b) (P(t) e^t) / ((e^t + a)(e^t + b))) \
      & + C integral_(-oo)^oo e^t / ((e^t + a)(e^t + b)) dif t \
      = & 2 pi i (Res_(z = i pi + ln a) (P(t) e^t) / ((e^t + a)(e^t + b)) + Res_(z = i pi + ln b) (P(t) e^t) / ((e^t + a)(e^t + b))) + C (ln b - ln a) / (b - a)
    $
    其中 $P(t)$ 为使第一个等号成立的多项式函数，解方程可得
    $
      P(t) = i / (6 pi) t^3 + 1 / 2 t^2 wide "and" wide C = - 2 / 3 pi^2
    $
    计算上述两项留数可得
    $
      #r = & pi^2 (ln b - ln a) / (b - a) + 1 / 3 (ln^3 b - ln^3 a) / (b - a) - 2 / 3 pi^2 (ln b - ln a) / (b - a) \
      = & 1 / 3 (pi^2 (ln b - ln a) / (b - a) + (ln^3 b - ln^3 a) / (b - a))
    $

  + 构造类似 (4) 中的环路，此处不需要绕过 $z = 1$，记 $#r := I(alpha)$，$integral_0^oo x^(alpha - 1) / (1 + x) dif x := I'(alpha)$
    $
      2 pi i Res_(z = -1) z^(alpha - 1) / (1 + z) ln z = integral.cont.ccw_L z^(alpha - 1) / (1 + z) ln z dif z = I(alpha) - e^(i 2 pi (alpha - 1))(I(alpha) + 2 pi i I'(alpha))
    $
    类似地，可以直接计算出
    $
      I'(alpha) = pi / (sin pi alpha)
    $
    显然 $LHS = - 2 pi^2 e^(i (alpha - 1) pi)$，从而有
    $
      #r = & I(alpha) = (2 pi i e^(i 2 pi (alpha - 1)) I'(alpha) - 2 pi^2 e^(i (alpha - 1) pi)) / (1 - e^(i 2 pi (alpha - 1))) \
      = & - pi^2 (cos pi alpha) / (sin^2 pi alpha)
    $
]

#prob[
  证明 Laplace 变换的性质：
  #sub()[
    1. $integral_0^oo f(t, tau) dif tau eta(t) img integral_0^oo F(p, tau) dif tau$；
  ][
    2. $(partial f(x, t)) / (partial x) eta(t) img (dif F(x, p)) / (dif x)$；
  ][
    3. $integral_t^oo f(tau) / tau dif tau eta(t) img 1 / p integral_0^p F(q) dif q$
  ]
][
  + 由 Laplace 变换的定义，有
    $
      cal(L)(LHS) = & integral_0^oo e^(-p t) dif t integral_0^oo f(t, tau) dif tau \
      = & integral_0^oo dif tau integral_0^oo e^(-p t) f(t, tau) dif t \
      = & integral_0^oo dif tau F(p, tau) \
      = & RHS
    $

  + 由 Laplace 变换的定义，有
    $
      cal(L)(LHS) = & integral_0^oo e^(-p t) dif t (partial f(x, t)) / (partial x) \
      = & partial / (partial x) integral_0^oo e^(-p t) f(x, t) dif t \
      = & partial / (partial x) F(x, p) \
      = & RHS
    $

  + 由 Laplace 变换的定义，有
    $
      cal(L)(LHS) = & integral_0^oo e^(-p t) dif t integral_t^oo f(tau) / tau dif tau \
      = & integral_0^oo dif tau f(tau) / tau integral_0^tau e^(-p t) dif t \
      = & integral_0^oo dif tau f(tau) / (p tau) (1 - e^(-p tau)) \
      = & 1 / p integral_0^oo F(q) dif q \
      = & RHS
    $
]

#prob[
  求下列函数的 Laplace 换式：
  #sub()[
    1. $t^alpha, med Re alpha > 1$；
  ][
    2. $e^(lambda t) sin omega t, med lambda > 0, med omega > 0$；
  ][
    3. $(1 - cos omega t) / t^2, med omega > 0$；
  ][
    4. $integral_t^oo (cos tau) / tau dif tau$；
  ][
    5. $t - a [t / a], med a > 0$.
  ]
][
  + 由定义
    $
      t^alpha img & integral_0^oo e^(-p t) t^alpha dif t \
      = & p^(-1 - alpha) integral_0^oo e^(- u) u^alpha dif u \
      = & Gamma(alpha + 1) / p^(alpha + 1)
    $

  + 由定义
    $
      e^(lambda t) sin omega t img & integral_0^oo e^(-p t) e^(lambda t) sin omega t dif t \
      = & integral_0^oo e^(-(p - lambda) t) sin omega t dif t \
      = & omega / ((p - lambda)^2 + omega^2)
    $

  + 注意到
    $
      1 - cos omega t img 1 / p - omega / (p^2 + omega^2)
    $
    利用
    $
      f(t) img F(p) => f(t) / t img integral_p^oo F(q) dif q
    $
    可得
    $
      (1 - cos omega t) / t img & lim_(R -> oo) integral_p^R 1 / q - q / (q^2 + omega^2) dif q \
      = & lim_(R -> oo) ln R / p + 1 / 2 ln (p^2 + omega^2) / (R^2 + omega^2) \
      = & 1 / 2 ln(1 + omega^2 / p^2)
    $
    从而得到
    $
      (1 - cos omega t) / t^2 img & lim_(R -> oo) integral_p^R 1 / 2 ln (1 + omega^2 / q^2) dif q \
      = & lim_(R -> oo) (omega arctan R / omega - omega arctan p / omega + 1 / 2 (r ln (1 + omega^2 / r^2) - p ln (1 + omega^2 / p^2))) \
      = & omega arctan omega / p - p / 2 ln (1 + omega^2 / p^2)
    $

  + 利用 3.(3) 中结论
    $
      integral_t^oo (cos tau) / tau dif tau img & 1 / p integral_0^p cal(L){cos t}(q) dif q \
      = & 1 / p integral_0^p q / (q^2 + 1) dif q \
      = & ln(1 + p^2) / (2 p)
    $

  + 由定义
    $
      t - a floor(t / a) img & integral_0^oo e^(-p t) (t - a floor(t / a)) dif t \
      = & sum_(n = 0)^oo integral_0^a e^(-p (n a + tau)) tau dif tau \
      = & (sum_(n = 0)^oo e^(-p n a)) integral_0^a e^(-p tau) tau dif tau \
      = & 1 / (1 - e^(-p a)) (1 - (1 + p a) e^(- p a)) / p^2 \
      = & 1 / p^2 - a / ((e^(a p) - 1) p)
    $
]

#prob[
  求下列 Laplace 换式的原函数：
  #sub()[
    1. $a^3 / (p (p + a)^3)$；
  ][
    2. $(4 p - 1) / ((p^2 + p)(4 p^2 - 1))$；
  ][
    3. $e^(-p tau) / p^2$；
  ][
    4. $1 / p e^(-alpha p) / (1 - e^(-alpha p)), med alpha > 0$.
  ]
][
  + 注意到
    $
      a^3 / (p (p + a)^3) = & a^3 dot.c 1 / p dot.c 1 / (p + a)^3 \
      isimgof & a^3 dot.c cal(L)^(-1){1 / p}(t) convolve cal(L)^(-1){1 / (p + a)^3}(t) \
      = & a^3 dot.c eta(t) convolve (cal(L)^(-1){1 / p^3}(t) e^(-a t)) \
      = & a^3 integral_0^t 1 / 2 tau^2 e^(-a tau) dif tau \
      = & 1 - (1 / 2 a^2 t^2 + a t + 1) e^(-a t)
    $

  + 裂项
    $
      (4 p - 1) / ((p^2 + p)(4 p^2 - 1)) = & 1 / p + 5 / 3 1 / (p + 1) + 1 / 3 1 / (p - 1 / 2) - 3 / (p + 1 / 2) \
      isimgof & t + 5 / 3 e^(-t) + 1 / 3 e^(t / 2) - 3 e^(-t / 2)
    $

  + 卷积定理
    $
      e^(-p tau) / p^2 = & e^(-p tau) dot.c 1 / p^2 \
      isimgof & delta(t - tau) convolve (cal(L)^(-1){1 / p^2}(t)) \
      = & delta(t - tau) convolve (t eta(t)) \
      = & eta(t - tau) (t - tau)
    $

  + 展开为级数和
    $
      1 / p e^(-alpha p) / (1 - e^(-alpha p)) = & sum_(n = 1)^oo 1 / p e^(-alpha n p) \
      isimgof & sum_(n = 1)^oo eta(t) convolve delta(t - n alpha) \
      = & sum_(n = 1)^oo eta(t - n alpha) = floor(t / alpha)
    $
]

#prob[
  利用 Laplace 变换计算下列积分：
  #sub(columns: 1)[
    1. $integral_0^oo (e^(- a x) - e^(- b x)) / x cos c x dif x, med a > 0, med b > 0, med c > 0$；
  ][
    2. $integral_0^oo (1 - cos b x) / x^2 dif x, med b > 0$；
  ][
    3. $integral_0^oo (sin x t) / (x (x^2 + 1)) dif x$.
  ]
][
  + $
      #r = & integral_0^oo (e^(- a x) - e^(- b x)) ((cos omega x) / x + integral_c^omega dif c' sin c' x) dif x \
      = & integral_0^oo (e^(- a x) - e^(- b x)) / x cos omega x dif x + integral_c^omega dif c' (integral_0^oo (e^(- a x) - e^(- b x)) sin c' x dif x) \
      = & integral_0^oo (e^(- a x) - e^(- b x)) / x cos omega x dif x + integral_c^omega c' / (c'^2 + a^2) - c' / (c'^2 + b^2) dif c' \
      = & lim_(omega -> oo) integral_0^oo (e^(- a x) - e^(- b x)) / x cos omega x dif x + integral_c^omega c' / (c'^2 + a^2) - c' / (c'^2 + b^2) dif c' \
      = & integral_c^oo c' / (c'^2 + a^2) - c' / (c'^2 + b^2) dif c' \
      = & eval(1 / 2 (ln(c'^2 + a^2) - ln(c'^2 + b^2)))_c^oo \
      = & 1 / 2 ln (b^2 + c^2) / (a^2 + c^2)
    $

  + 由 4.(3) 给出
    $
      #r = cal(L){(1 - cos b x) / x^2}(0) = (pi b) / 2
    $

  + $
      #r img & integral_0^oo 1 / (x (x^2 + 1)) x / (x^2 + p^2) dif x \
      = & pi / 2 1 / (p (p + 1)) \
      = & pi / 2 (1 / p - 1 / (p + 1)) \
      isimgof & pi / 2 (eta(t) - e^(-t) eta(t)) quad (t > 0)
    $
    对于 $t < 0$ 的情况同理，因此
    $
      #r = pi / 2 (1 - e^(- abs(t))) op("sgn") t
    $
]

#prob[
  求解下列积分方程，其中 $alpha$ 是已知复数，$f(t)$ 是已知函数，$u(xi)$ 是未知函数。
  $
    f(t) = integral_0^t u(xi) / (t - xi)^alpha dif xi, wide t > 0, wide 0 < Re alpha < 1
  $
][
  注意到右侧为卷积形式，因此可以利用 Laplace 变换的卷积定理，有
  $
    RHS = & integral_(-oo)^oo eta(t - xi) eta(xi) u(xi) / (t - xi)^alpha dif xi \
    = & (u(t) eta(t)) convolve (t^(-alpha) eta(t)) \
    img & cal(L){u(t)}(p) Gamma(1 - alpha) / p^(1 - alpha)
  $
  令
  $
    LHS img cal(L){f(t)}(p) := F(p)
  $
  从而有
  $
    cal(L){u(t)}(p) = (F(p) p^(1 - alpha)) / Gamma(1 - alpha)
  $
  反演得到
  $
    u(t) img & 1 / (Gamma(1 - alpha) Gamma(alpha - 1)) F(p) Gamma(alpha - 1) / p^(alpha - 1) \
    isimgof & 1 / (Gamma(1 - alpha) Gamma(alpha - 1)) (f(t) eta(t)) convolve (t^(alpha - 1) eta(t)) \
    = & 1 / ((- alpha) Gamma(-alpha) Gamma(alpha - 1)) (f(t) eta(t)) convolve (t^(alpha - 1) eta(t)) \
    = & (sin pi alpha) / (pi alpha) integral_0^t f(tau) (t - tau)^(alpha - 1) dif tau
  $
]
