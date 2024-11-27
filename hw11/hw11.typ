#import "../lib.typ": config, prob, sub
#import "@preview/slashion:0.1.1": slash-frac as sfrac

#let Re = math.op("Re")
#let Res = math.op("Res")
#let Im = math.op("Im")
#let dcases = (..args) => math.cases(..args.named(), ..args.pos().map(math.display))
#let LHS = "LHS"
#let RHS = "RHS"
#let r = "原式"

#let TBD = align(center, text(fill: red, weight: "bold", size: 2em)[TBD 没写完 TBD 没写完 TBD])

#show: config("第十一周作业")

#show math.equation.where(block: true): set block(breakable: true)

#prob[
  求证：
  $
    Gamma (
      z
    ) = integral_L e^(-t) t^(z - 1) dif t, med Re z > 0, med L "是自原点发出的射线", med 0 < abs(t) < oo, abs(arg t) < pi / 2
  $
][
  构造积分环路
  $
    L': 0 ->^(Im(z) = 0) rho ->^(abs(z) = rho) rho e^(i abs(arg t)) ->^(arg z = arg t) 0
  $
  显然在 $rho$ 有限时该环路所围区域内 $f(t) = e^(-t) t^(z - 1)$ 解析，又有在 $rho -> oo$ 时
  $
    integral.cont.ccw_L' f(
      t
    ) dif t = & integral_0^oo e^(-t) t^(z - 1) dif t - integral_L e^(-t) t^(z - 1) dif t + lim_(rho -> oo) integral_0^(arg t) e^(-rho e^(i theta)) (
      rho e^(i theta)
    )^(z - 1) i rho e^(i theta) dif theta \
    = & Gamma(z) - integral_L e^(-t) t^(z - 1) dif t + lim_(rho -> oo) i integral_0^(arg t) e^(-rho cos theta) rho^z e^(i (
      z theta - rho sin theta
    )) dif theta \
    := & Gamma(z) - integral_L e^(-t) t^(z - 1) dif t + R(z)
  $
  注意到 $abs(arg t) < pi / 2$，则有被积函数中 $cos theta > 0$，从而 $Re z > 0$ 时有
  $
    abs(R(z)) <= lim_(rho -> oo) abs(arg t) max_(0 <= theta <= abs(arg t)) abs(e^(-rho cos theta) rho^z) = 0
  $
  从而有 $R(z) = 0 med forall z "s.t." Re z > 0$，即
  $
    Gamma(z) = integral_L e^(-t) t^(z - 1) dif t
  $
]

#prob[
  将下列连乘积用 $Gamma$ 函数表示出来：
  #sub(columns: 1)[
    1. $(2n)!!$;
  ][
    2. $(1 + nu)(2 + nu)(3 + nu) dots.c (n + nu)$.
  ][
    3. $[n (n + 1) - nu (nu + 1)][(n - 1) n - nu (nu + 1)] dots.c [0 - nu (nu + 1)]$.
  ]
][
  + 显然有
    $
      (2 n)!! = 2^n n! = 2^n Gamma(n + 1)
    $

  + 假设该函数为 $f_(n)(nu)$ 由 $Gamma(z + 1) = z Gamma(z)$，并利用归纳法证明
    $
      f_(n)(nu) = Gamma(nu + n + 1) / Gamma(nu + 1)
    $
    + $f_1(nu) = Gamma(nu + 2) / Gamma(nu + 1) = nu + 1$ 满足
    + 假设 $f_(n)(nu)$ 满足要求，则
      $
        (f_(n + 1)(nu)) / (f_(n)(nu)) = Gamma(nu + n + 2) / Gamma(nu + n + 1) = nu + n + 1
      $
      从而 $f_(n + 1)(nu) = (nu + n + 1) f_(n)(nu)$，即 $f_(n + 1)(nu)$ 满足要求
    即证明了
    $
      (1 + nu)(2 + nu)(3 + nu) dots.c (n + nu) = Gamma(nu + n + 1) / Gamma(nu + 1)
    $

  + 注意到
    $
      a (a + 1) - b (b + 1) = (a - b) (a + b + 1)
    $
    则原式可化为
    $
      ((n - nu)(n - 1 - nu) dots.c (0 - nu)) ((n + nu + 1)(n + nu) dots.c (1 + nu))
    $
    由上问结论可化为 $f_(n + 1)(- nu - 1) f_(n + 1)(nu)$ 即
    $
      [n (n + 1) - nu (nu + 1)][(n - 1) n - nu (nu + 1)] dots.c [
        0 - nu (nu + 1)
      ] = (Gamma(n - nu + 1) Gamma(n + nu + 2)) / (Gamma(- nu) Gamma(nu + 1))
    $
]

#prob[
  计算下列积分：
  #sub(columns: 1)[
    1. $display(integral_0^oo x^(- alpha) sin x dif x\, quad 0 < alpha < 2)$;
      #v(1em)
      $display(integral_0^oo x^(- alpha) cos x dif x\, quad 0 < alpha < 1)$.
  ][
    2. $display(integral _ ( 0 ) ^ ( oo ) x ^ ( alpha - 1 ) upright( e ) ^ ( - x cos theta ) cos ( x sin theta ) upright( d ) x \, quad alpha > 0 \, quad - ( pi ) / ( 2 ) < theta < ( pi ) / ( 2 ))$;
      #v(1em)
      $display(integral _ ( 0 ) ^ ( oo ) x ^ ( alpha - 1 ) upright( e ) ^ ( - x cos theta ) sin ( x sin theta ) upright( d ) x \, quad alpha > 0 \, quad - ( pi ) / ( 2 ) < theta < ( pi ) / ( 2 ))$.
  ][
    3. $display(integral_(-1)^1 (1 - x)^p (1 + x)^q dif x\, quad Re p > -1\, Re q > -1)$.
  ][
    4. $display(integral_0^sfrac(pi / 2) tan^alpha theta dif theta\, quad integral_0^sfrac(pi / 2) cot^alpha theta dif theta\, quad 0 < alpha < 1)$.
  ]
][
  + 两积分可通过分别取下列积分的实部和虚部得到
    $
      I_1(alpha) := integral_0^oo x^(- alpha) e^(i x) dif x
    $
    同习题 1. 构造积分环路
    $
      L': 0 ->^(Im(z) = 0) rho ->^(abs(z) = rho) i rho ->^(Re(z) = 0) 0
    $
    由留数定理得到
    $
      0 = integral.cont.ccw_L' x^(- alpha) e^(i x) dif x = & I_1(alpha) - i integral_0^oo (
        i x
      )^(- alpha) e^(- x) dif x + lim_(rho -> oo) integral_0^(pi / 2) rho^(-alpha) e^(- i alpha theta) e^(i rho e^(i theta)) i rho e^(i theta) dif theta \
      = & I_1(alpha) - e^(i pi / 2 (1 - alpha)) Gamma(1 - alpha) + R(alpha)
    $
    对于 $R(alpha)$ 有
    $
      R(alpha) = lim_(rho -> oo) i rho^(1 - alpha) integral_0^(pi / 2) e^(i (
        (1 - alpha) theta + rho cos theta
      )) e^(- rho sin theta) dif theta
    $
    同理可得
    $
      abs(R(alpha)) <= lim_(rho -> oo) rho^(1 - alpha) integral_0^(pi / 2) e^(- rho sin theta) dif theta <=^(sin theta > 2 / pi theta) lim_(rho -> oo) rho^(1 - alpha) 2 / pi integral_0^1 e^(- rho t) dif t = 0
    $
    因此
    $
      I_1(alpha) = e^(i pi / 2 (1 - alpha)) Gamma(1 - alpha) = cos ((1 - alpha) / 2 pi) Gamma(1 - alpha) + i sin (
        (1 - alpha) / 2 pi
      ) Gamma(1 - alpha)
    $
    从而分别有
    $
      integral_0^oo x^(- alpha) sin x dif x = Im I_1(alpha) = sin ((1 - alpha) / 2 pi) Gamma(1 - alpha) & quad & (
        0 < alpha < 1 "or" 1 < alpha < 2
      ) \
      integral_0^oo x^(- alpha) cos x dif x = Re I_1(alpha) = cos ((1 - alpha) / 2 pi) Gamma(1 - alpha) & quad & (
        0 < alpha < 1
      )
    $
    对于 $alpha = 1$ 单独考虑，有
    $
      integral_0^oo x^(- 1) sin x dif x = pi / 2 = lim_(alpha -> 1) sin ( (1 - alpha) / 2 pi ) Gamma(1 - alpha)
    $
    综上所述
    $
      integral_0^oo x^(- alpha) sin x dif x = & dcases(
        pi / 2\, wide & alpha = 1,
        sin ((1 - alpha) / 2 pi) Gamma(1 - alpha)\, wide & 0 < alpha < 1 "or" 1 < alpha < 2
      ) \
      integral_0^oo x^(- alpha) cos x dif x = & cos ((1 - alpha) / 2 pi) Gamma(1 - alpha)\, wide 0 < alpha < 1
    $

  + 记
    $
      I_2(
        alpha
      ) := integral_0^oo x^(alpha - 1) e^(- x cos theta) e^(i x sin theta) dif x = integral_0^oo x^(alpha - 1) e^(- x e^(-i theta)) dif x
    $
    则上述积分可通过取实部和虚部得到，由习题 1. 结论知
    $
      I_2(alpha) = e^(i alpha theta) integral_L t^(alpha - 1) e^(- t) dif t = e^(i alpha theta) Gamma(alpha) = cos (
        alpha theta
      ) Gamma(alpha) + i sin (alpha theta) Gamma(alpha)
    $
    综上，当 $alpha > 0$，$- pi / 2 < theta < pi / 2$ 时有
    $
      integral_0^oo x^(alpha - 1) e^(- x cos theta) cos (x sin theta) dif x = & cos (alpha theta) Gamma(alpha) \
      integral_0^oo x^(alpha - 1) e^(- x cos theta) sin (x sin theta) dif x = & sin (alpha theta) Gamma(alpha)
    $

  + 换元 $t = (1 + x) / 2$
    $
      integral_(-1)^1 (1 - x)^p (1 + x)^q dif x = & integral_0^1 (2 (1 - t))^p (2 t)^q 2 dif t \
      = & 2^(p + q + 1) integral_0^1 (1 - t)^p t^q dif t \
      = & 2^(p + q + 1) Beta(p + 1, q + 1) \
    $

  + 由于 $tan theta = cot (pi / 2 - theta)$，题中两积分可通过换元 $theta' = pi / 2 - theta$ 互相转化，值相同，不妨计算第一个积分
    $
      integral_0^sfrac(pi / 2) tan^alpha theta dif theta = & 2 integral_0^sfrac(pi / 2) sin^alpha theta cos^(- alpha) theta dif theta \
      = & 2 integral_0^sfrac(pi / 2) sin^alpha theta cos^(- alpha - 1) dif (sin theta) \
      = & integral_0^1 t^((alpha - 1) / 2) (1 - t)^((- alpha - 1) / 2) dif t & quad & (t = sin^2 theta) \
      = & Beta((1 + alpha) / 2, (1 - alpha) / 2) \
      = & (Gamma((1 + alpha) / 2) Gamma((1 - alpha) / 2)) / Gamma(1) \
      = & pi / sin((1 + alpha) / 2 pi) = pi / cos(alpha / 2 pi)
    $
]

#prob[
  设 $Psi(z) = (dif) / (dif z) ln Gamma(z) = (Gamma'(z)) / Gamma(z)$，证明：
  #sub[
    1. $Psi(1 - z) - Psi(z) = pi cot pi z$;
  ][
    2. $Psi(2 z) - Psi(z) - Psi(z + 1 / 2) = 2 ln 2$.
  ]
][
  + 对余元公式求导得
    $
      & Gamma(z) Gamma(1 - z) = pi / (sin (pi z)) \
      => & (Gamma'(z) Gamma(1 - z) - Gamma(z) Gamma'(1 - z)) = - pi^2 / (sin^2 (pi z)) cos (pi z) \
      => & (
        (Gamma'(z)) / Gamma(z) - (Gamma'(1 - z)) / Gamma(1 - z)
      ) = sfrac((- pi^2 / (sin^2 (pi z)) cos (pi z)) / (Gamma(z) Gamma(1 - z))) \
      => & Psi(1 - z) - Psi(z) = pi cot (pi z)
    $

  + 注意到
    $
      LHS = dif / (dif z) ln (Gamma(2 z) / (Gamma(z) Gamma(z + 1 / 2)))
    $
    利用 Legendre 乘法公式得
    $
      LHS = dif / (dif z) ln (2^(2 z - 1) / sqrt(pi)) = 2 ln 2 = RHS
    $
    故得证，下面补充证明 Legendre 乘法公式：
    $
      Beta(z, z) = & (Gamma^2 (z)) / Gamma(2 z) = integral_0^1 t^(z - 1) (1 - t)^(z - 1) dif t \
      = & 2^(1 - 2 z) integral_(-1)^1 (1 - u^2)^(z - 1) dif u & wide (t = (1 + u) / 2) \
      = & 2^(2 - 2 z) integral_0^1 (1 - u^2)^(z - 1) dif u \
      = & 2^(2 - 2 z) integral_0^1 (1 - v)^(z - 1) 1 / 2 v^(1 / 2 - 1) dif v & wide (u = sqrt(v)) \
      = & 2^(1 - 2 z) Beta(z, 1 / 2) = 2^(1 - 2 z) (sqrt(pi) Gamma(z)) / Gamma(z + 1 / 2) \
    $
    从而得到
    $
      Gamma(z) Gamma(z + 1 / 2) = 2^(1 - 2 z) sqrt(pi) Gamma(2 z)
    $
]

#prob[
  计算积分 $integral.triple_V x^(alpha - 1) y^(beta - 1) z^(gamma - 1) dif x dif y dif z (alpha > 0, beta > 0, gamma > 0)$，其中积分区域 $V$ 为平面 $x = 0$，$y = 0$，$z = 0$ 及 $x + y + z = 1$ 所包围的体积。
][
  作换元 $u = x + y + z$，$v = x + y$ 得到
  $
    #r = & integral_0^1 dif u integral_0^u dif v integral_0^v dif x abs(partial(x, y, z) / partial(u, v, x)) x^(alpha - 1) (v - x)^(beta - 1) (u - v)^(gamma - 1) \
    = & integral_0^1 dif u integral_0^u dif v (u - v)^(gamma - 1) v^(alpha + beta - 1) integral_0^1 dif t t^(alpha - 1) (1 - t)^(beta - 1) & wide (t = x / v) \
    = & Beta(alpha, beta) integral_0^1 dif u u^(alpha + beta + gamma - 1) integral_0^1 dif s (1 - s)^(gamma - 1) s^(alpha + beta - 1) & wide (s = v / u) \
    = & Beta(alpha, beta) Beta(alpha + beta, gamma) dot.c 1 / (alpha + beta + gamma) \
    = & (Gamma(alpha) Gamma(beta)) / Gamma(alpha + beta) (Gamma(alpha + beta) Gamma(gamma)) / Gamma(alpha + beta + gamma) 1 / (alpha + beta + gamma) \
    = & (Gamma(alpha) Gamma(beta) Gamma(gamma)) / Gamma(alpha + beta + gamma + 1)
  $
]

#prob[
  求下列函数在指定点 $z_0$ 处的留数：
  #sub[
    1. $display(1 / (z - 1) exp(z^2)\, med z_0 = 1)$;
  ][
    2. $display(1 / (z - 1)^2 exp(z^2)\, med z_0 = 1)$;
  ][
    3. $display((z / (1 - cos z))^2\, med z_0 = 0)$;
  ][
    4. $display(1 / (z^2 sin z)\, med z_0 = 0)$.
  ][
    5. $display(e^z / (z^2 - 1)^2\, med z_0 = 1)$.
  ][
    6. $display(Psi(z)\, med z_0 = - n\, med n in NN)$.
  ][
    7. $display(1 / (cosh sqrt(z))\, med z_0 = - ((2 n + 1) / 2 pi)^2\, med n in NN)$.
  ]
][
  若待求函数未命名，则记作 $f(z)$

  + 注意到
    $
      lim_(z -> z_0) (z - z_0) f(z) = lim_(z -> 1) exp(z^2) = exp(1)
    $
    因此 $z = 1$ 处的留数为 $e$

  + 将 $exp(z^2)$ 在 $z = z_0 = 1$ 处展开得到
    $
      exp(z^2) = exp(1) + 2 exp(1) (z - 1) + 3 exp(1) (z - 1)^2+ dots.c
    $
    因此 $z = z_0 = 1$ 处 $f(z)$ 的 Laurent 展开式为
    $
      f(z) = e / (z - 1)^2 + (2 e) / (z - 1) + 3 e + dots.c
    $
    因此 $z = 1$ 处的留数为 $2 e$

  + 该函数显然为偶函数，因此 $z = 0$ 处的留数为 $0$

  + 由于 $sin z = z - z^3 / 3! + z^5 / 5! - dots.c$，因此
    $
      1 / (z^2 sin z) = 1 / z^2 (1 / z (1 / (1 - z^2 / 6 + z^4 / 120 - dots.c))) = 1 / z^3 (1 + z^2 / 6 + dots.c)
    $
    因此 $z = 0$ 处的留数为 $1 / 6$

  + 将 $exp(z)$ 在 $z = z_0 = 1$ 处展开得到
    $
      exp(z) = e (1 + (z - 1) + (z - 1)^2 / 2 + dots.c)
    $
    因此 $z = z_0 = 1$ 处 $f(z)$ 的 Laurent 展开式为
    $
      f(z) = & e / (z + 1)^2 (1 / (1 - z)^2 + 1 / 2 1 / (1 - z) + dots.c) \
      = & e / 4 (1 / (z - 1)^2 + 1 / 4 + dots.c)
    $
    因此 $z = 1$ 处的留数为 $0$

  + 注意到对于 $z_0 = - n, n in NN$ 有
    $
      Psi(z = z_0 + delta) = dif / (dif z) ln Gamma(z) = dif / (dif delta) ln Gamma(z_0 + delta) = & dif / (dif z) ln (
        1 / (z_0 + delta) Gamma(z_0 + 1 + delta)
      ) \
      = & dif / (dif delta) ln product_(k = 0)^n (delta + k - n)^(-1) Gamma(delta + 1) \
      = & dif / (dif delta) (sum_(k = 0)^n (- ln (delta + k - n)) + ln Gamma(delta + 1)) \
      = & Psi(delta + 1) - sum_(k = 0)^n 1 / (delta + k - n)
    $
    显然求和中仅有 $k = n$ 项对留数有贡献，因此 $z = - n$ 处的留数为 $- 1$

  + 直接分析 $z_0 != 0$ （显然题中所有点符合该条件）为中心的幂级数
    $
      f(z = z_0 (1 + delta)) = 1 / (cos ((n + 1 / 2) pi sqrt(1 + delta)))
    $
    求下列极限
    $
      lim_(z -> z_0) (z - z_0) f(z) = & lim_(delta -> 0) (z_0 delta) / (cos (
        (n + 1 / 2) pi sqrt(1 + delta)
      )) =^"L'Hospital" lim_(delta -> 0) - z_0 / (sin ((n + 1 / 2) pi sqrt(1 + delta)) (
        n + 1 / 2
      ) pi 1 / (2 sqrt(1 + delta))) \
      = & (-)^n (2 n + 1) pi
    $
    存在，则 $z = z_0$ 处的留数为 $(-)^n (2 n + 1) pi$
]

#prob[
  求下列函数在复平面 $CC$ 内所有的孤立奇点处以及无穷远点的留数
  #sub(
    columns: 3,
    ..(
      ((..c) => c.pos())[
        1. $display(e^z / (1 - cos z))$;
      ][
        2. $display((1 - cos z) / e^z)$;
      ][
        3. $display(sin z / (1 + z))$;
      ][
        4. $display(sqrt(z) / (sin sqrt(z)))$;
      ][
        5. $display(1 / ((1 - e^(i z)) sin z))$;
      ][
        6. $display(exp[1 / 2 (z - 1 / z)])$;
      ][
        7. $display(z^i / (z^2 - 1))$;
      ][
        8. $display(1 / ((z - 1) ln z))$;
      ][
        9. $display(sqrt((z - 1) (z - 2)))$;
      ]
    ) + (
      grid.cell(colspan: 3)[
        10. $display(1 / z [1 + 1 / (z + 1) + 1 / (z + 1)^2 + dots.c + 1 / (z + 1)^n])$.
      ],
    ),
  )
][
  + $z_0 = 2 n pi, n in ZZ$ 为孤立奇点，留数为 $2 e^(2 n pi)$，无穷远处不为孤立奇点

  + 无孤立奇点，无穷远点的留数为 $0$

  + 孤立奇点 $z_0 = -1$，留数为 $-cos 1$，无穷远点的留数为 $cos 1$

  + $z_0 = n^2 pi^2, n in NN^+$ 为孤立奇点，留数为 $(-)^n 2 n^2 pi^2$，$z_0 = 0$ 为可去奇点，无穷远点不为孤立奇点

  + 注意到
    $
      (1 - e^(i z)) sin z = 4 sin^3 (z / 2) cos (z / 2) + i sin^2 z
    $
    对奇偶性不同的 $z$ 讨论有 $z = n pi, n in ZZ$ 为孤立奇点，留数为 $(-)^n 1 / 2$，无穷远点不为孤立奇点

  + 孤立奇点为 $z_0 = 0$
    $
      f(z) = sum_(n = 0)^oo (1 / 2)^n (z - 1 / z)^n / n! => Res f_(z = 0) = sum_(k = 0)^oo (1 / 2)^(2 k + 1) (
        -
      )^k / (k! (k + 1)!) = J_1(1)
    $
    无穷远点留数 $Res f_(z = oo) = - Res f_(z = 0) = - sum_(k = 0)^oo (1 / 2)^(2 k + 1) (-)^k / (k! (k + 1)!) = - J_1(1)$，其中 $J_(n)(x)$ 为 $n$ 阶 Bessel 函数

  + 孤立奇点为 $z_0 = plus.minus 1$，留数为 $plus.minus 1 / 2 (plus.minus 1)^i$，其中 $i$ 次幂为多值函数，取与定义相同的一枝，无穷远点不为孤立奇点

  + 孤立奇点为 $z_0 = 1$，留数为 $1 / 2$，$z_0 = 0$ 和无穷远点不为孤立奇点

  + 无孤立奇点，无穷远点的留数为 $plus.minus 1 / 8$，正负由多值函数分支决定

  + 该幂级数的收敛区域为 $abs(z + 1) > 1$，其和延拓到其他位置得（$z_0 = -1$ 此时为可去奇点）
    $
      1 / z 1 / (1 - 1 / (z + 1)) = 1 / z + 1 / z^2
    $
    因此 $z = 0$ 为孤立奇点，留数为 $1$，无穷远点的留数为 $-1$
]

#prob[
  计算下列积分值：
  #sub[
    1. $display(integral.cont.ccw_(abs(z - 1) = 1) 1 / (1 + z^4) dif z)$;
  ][
    2. $display(integral.cont.ccw_(abs(z - 1) = 2) 1 / (1 + z^4) dif z)$;
  ][
    3. $display(integral.cont.ccw_(abs(z - 1) = 1) 1 / (z^2 - 1) sin (pi z) / 4 dif z)$;
  ][
    4. $display(integral.cont.ccw_(abs(z) = 3) 1 / (z^2 - 1) sin (pi z) / 4 dif z)$;
  ][
    5. $display(integral.cont.ccw_(abs(z) = 1) exp((z + 1) / z) dif z)$;
  ][
    6. $display(integral.cont.ccw_(abs(z) = 2) 1 / (z^3 (z^10 - 2)) dif z)$;
  ][
    7. $display(integral.cont.ccw_(abs(z) = 1) e^z / z^3 dif z)$;
  ][
    8. $display(integral.cont.ccw_(abs(z) = R) z^2 / (e^(2 pi i z^3) - 1) dif z\, \ med n < R^3 < n + 1\, med n in NN^+)$;
  ][
    9. $display(integral_0^pi (dif theta) / (1 + sin^2 theta)^2)$.
  ]
][
  + 路径内包含 $z_(plus.minus) = (1 plus.minus i) / sqrt(2)$ 两个孤立奇点，留数分别为
    $
      Res f_(z = z_(plus.minus)) = - (1 plus.minus i) / (4 sqrt(2))
    $
    因此该积分为
    $
      integral.cont.ccw_(abs(z - 1) = 1) 1 / (1 + z^4) dif z = 2 pi i (
        Res f_(z = z_+) + Res f_(z = z_-)
      ) = - (pi i) / sqrt(2)
    $

  + 路径内包含全部四个孤立奇点，留数分别为
    $
      Res f_(z = z_i) = - z_i / 4
    $
    其中
    $
      z_(1, 4) = & (1 plus.minus i) / sqrt(2) \
      z_(2, 3) = & (- 1 plus.minus i) / sqrt(2)
    $
    因此该积分为
    $
      integral.cont.ccw_(abs(z - 1) = 2) 1 / (1 + z^4) dif z = 2 pi i (
        Res f_(z = z_1) + Res f_(z = z_2) + Res f_(z = z_3) + Res f_(z = z_4)
      ) = 0
    $

  + 路径内包含 $z = 1$ 一个孤立奇点，留数为 $sqrt(2) / 4$，因此该积分为
    $
      integral.cont.ccw_(abs(z - 1) = 1) 1 / (z^2 - 1) sin (pi z) / 4 dif z = 2 pi i Res f_(z = 1) = sqrt(2) / 2 pi i
    $

  + 相较于上题，路径中额外包含 $z = - 1$ 一个孤立奇点，留数也为 $sqrt(2) / 4$，因此该积分为
    $
      integral.cont.ccw_(abs(z) = 3) 1 / (z^2 - 1) sin (pi z) / 4 dif z = 2 pi i (
        Res f_(z = 1) + Res f_(z = - 1)
      ) = sqrt(2) pi i
    $

  + 路径内包含 $z = 0$ 一个孤立奇点，留数为 $e$，因此该积分为
    $
      integral.cont.ccw_(abs(z) = 1) exp((z + 1) / z) dif z = 2 pi i Res f_(z = 0) = 2 pi i e
    $

  + 路径内包含 $z = 0$ 和 $z_n = 2^sfrac(1 / 10) e^(i n sfrac((2 pi) / 10)), n = 0, 1, 2, dots.c, 9$ 共十一个孤立奇点，留数分别为
    $
      Res f_(z = 0) = & 0 \
      Res f_(z = z_n) = & 1 / z_n^3 product_(p != n) 1 / (z_n - z_p) = 2^(- 11 / 5) / 5 e^(- i n sfrac((2 pi) / 5))
    $
    因此该积分为
    $
      integral.cont.ccw_(abs(z) = 2) 1 / (z^3 (z^10 - 2)) dif z = 2 pi i (
        Res f_(z = 0) + sum_(n = 0)^9 Res f_(z = z_n)
      ) = 2 pi i 2^(- 11 / 5) / 5 sum_(n = 0)^9 e^(- i n sfrac((2 pi) / 5)) = 0
    $

  + 路径内包含 $z = 0$ 一个孤立奇点，留数为 $1 / 2$，因此该积分为
    $
      integral.cont.ccw_(abs(z) = 1) e^z / z^3 dif z = 2 pi i Res f_(z = 0) = pi i
    $

  + 被积函数孤立奇点 $z_p$ 要求 $z_p^3 in ZZ$，对于非零的 $z_p$，留数为
    $
      Res f_(z = z_p) = 1 / (6 pi i)
    $
    单独考虑 $z = 0$，留数为 $1 / (2 pi i)$，因此该积分为
    $
      integral.cont.ccw_(abs(z) = R) z^2 / (e^(2 pi i z^3) - 1) dif z = 2 pi i (
        Res f_(z = 0) + sum_(abs(z_p) < R) Res f_(z = z_p)
      ) = 2 pi i (1 / (2 pi i) + (2 n) / (6 pi i)) = 1 + 2 / 3 n
    $

  + 由三角函数对称性
    $
      #r = & 1 / 2 integral_0^(2 pi) (dif theta) / (1 + sin^2 theta)^2 = 1 / 2 integral.cont.ccw_(abs(z) = 1) sfrac((dif z) / (i z), parens: #false) / (1 - (z - sfrac(1 / z))^2 / 4)^2 \
      = & 8 integral.cont.ccw_(abs(z) = 1) (dif z) / (i z) z^4 / (z^4 - 6 z^2 + 1)^2
    $
    注意到此时被积函数有孤立奇点 $z = plus.minus sqrt(3 + 2 sqrt(2))$ 和 $z = plus.minus sqrt(3 - 2 sqrt(2))$，而在积分路径内的为 $z = plus.minus sqrt(3 - 2 sqrt(2))$，留数分别为
    $
      Res f_(z = plus.minus sqrt(3 - 2 sqrt(2))) = - 3 / 256 sqrt(2) i
    $
    因此该积分为
    $
      #r = 8 dot.c 2 pi i (
        Res f_(z = sqrt(3 - 2 sqrt(2))) + Res f_(z = - sqrt(3 - 2 sqrt(2)))
      ) = 3 / 8 sqrt(2) pi
    $
]
