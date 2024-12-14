#import "../lib.typ": *
#import "@preview/slashion:0.1.1": slash-frac as sfrac
#import "@preview/physica:0.9.3": vb, dotproduct, eval

#show: config("第十四周作业")


#show math.equation.where(block: true): set block(breakable: true)

#prob[
  求下列 Laplace 换式的原函数：
  #sub[
    1. $e^(- p tau) / (p^4 + 4 omega^4), quad tau > 0, omega > 0$；
  ][
    2. $1 / p (cosh (l - x) sqrt(p)) / (cosh l sqrt(p)), quad 0 < x < l$
  ]
][
  + 由普遍反演公式，
    $
      #r isimgof & 1 / (2 pi i) integral_(s - i oo)^(s + i oo) e^(- p tau) / (p^4 + 4 omega^4) e^(p t) dif p \
      = & eta(t - tau) sum_(Re z < omega) Res_(p = z_i) e^(p (t - tau)) / (p^4 + 4 omega^4) \
      = & (exp((1 + i) omega (t - tau)) / (omega^3 dot.c 2 i dot.c 2 dot.c (2 + 2 i)) + dots.c) eta(t - tau) \
      = & 1 / (4 omega^3) (cosh omega (t - tau) sin omega (t - tau) - sinh omega (t - tau) cosh omega (t - tau)) eta(t - tau)
    $

  + 由普遍反演公式，半径增大时可求留数之和
    $
      #r = & 1 / (2 pi i) integral_(s - i oo)^(s + i oo) 1 / p (cosh (l - x) sqrt(p)) / (cosh l sqrt(p)) e^(p t) dif p \
      = & sum_(Re z < 0) Res_(p = - pi^2 / 4 ((2 n + 1) / l)^2) 1 / p (cosh (l - x) sqrt(p)) / (cosh l sqrt(p)) e^(p t) \
      = & sum_(n = 0)^oo 1 / (- pi^2 / 4 ((2 n + 1) / l)^2) cos ((1 - x / l) (n + 1 / 2) pi) (-)^n ((2 n + 1) pi) / l^2 e^(- pi^2 / 4 ((2 n + 1) / l)^2 t) \
      = & 4 / pi sum_(n = 0)^oo (-)^(n + 1) / (2 n + 1) e^(- pi^2 / (4 l) (2 n + 1)^2 t) cos ((1 - x / l) (n + 1 / 2) pi)
    $
]

#prob[
  利用 Laplace 变换求解下列微分方程（组）或积分方程：
  + 如下图，合上开关 $K$ 的时刻记为 $t = 0$，已知 $i(0) = 0$，$q(0) = 0$，求 $i(t)$；
    #figure(
      block(width: 100%, image("fig/2.1.png", width: 150pt)),
    )

  + $f(t) + 2 integral_0^t f(tau) cos(t - tau) dif tau = 9 e^(2 t)$
][
  + 列出方程
    $
      i_R = - u_C / R = 1 / (C R) integral_0^t i_(C)(tau) dif tau \
      i_R + i_C = i \
      L (dif i) / (dif t) + R i_R = E
    $
    Laplace 变换后
    $
      I_R = - U_C / R = 1 / (C R) I_C / p \
      I_R + I_C = I \
      L p I + R I_R = E / p
    $
    解得
    $
      I = E / (L p + R / (1 + C R p)) = E / p (1 + C R p) / (C L R p^2 + L p + R)
    $
    反演得到
    $
      i(t) = dcases(
        E / R (1 - e^(- t / (2 C R)) (cosh sqrt(1 - 4 R^2 C / L) t / (2 C R) + (1 - 2 R^2 C / L) / sqrt(1 - 4 R^2 C / L) sinh sqrt(1 - 4 R^2 C / L) t / (2 C R))) \, quad & 4 R^2 C < L,
        E / R (1 - e^(- t / (2 C R)) (1 + t / (4 C R))) \, quad & 4 R^2 C = L,
        E / R (1 - e^(- t / (2 C R)) (cos sqrt(4 R^2 C / L - 1) t / (2 C R) + (1 - 2 R^2 C / L) / sqrt(4 R^2 C / L - 1) sin sqrt(4 R^2 C / L - 1) t / (2 C R))) \, quad & 4 R^2 C > L
      )
    $

  + Laplace 变换得到
    $
      & F(p) + 2 F(p) p / (p^2 + 1) = 9 / (p - 2) \
      => & F(p) = (9 (p^2 + 1)) / ((p - 2) (p + 1)^2) = F(p) = 5 / (p - 2) + 4 / (p + 1) - 6 / (p + 1)^2
    $
    反演得
    $
      f(t) = 5 e^(2 t) + 4 e^(- t) - 6 t e^(- t)
    $
]

#prob[
  请证明 Fourier 变换的 Parseval 公式
  $
    integral_(-oo)^oo f(x) cal(F){g} (x) dif x = integral_(-oo)^oo cal(F){f} (x) g(x) dif x
  $
  其中
  $
    cal(F){f}(x) = 1 / sqrt(2 pi) integral_(-oo)^oo f(s) e^(- i s x) dif s
  $
][
  $
    LHS = & integral_(-oo)^oo f(x) cal(F){g} (x) dif x \
    = & integral_(-oo)^oo f(x) 1 / sqrt(2 pi) integral_(-oo)^oo g(s) e^(- i s x) dif s dif x \
    = & 1 / sqrt(2 pi) integral_(-oo)^oo g(s) integral_(-oo)^oo f(x) e^(- i s x) dif x dif s \
    = & integral_(-oo)^oo cal(F){f} (s) g(s) dif s \
    = & RHS
  $
]

#prob[
  已知氢原子的基态空间波函数为
  $
    psi(vb(r)) = 1 / sqrt(pi a_0^3) e^(- r / a_0)
  $
  其中 $a_0$ 是 Bohr 半径，$r = abs(vb(r))$，试计算它的 Fourier 换式
  $
    g(vb(p)) = 1 / (2 pi planck.reduce)^(3 / 2) integral.triple psi(vb(r)) e^(- i / planck.reduce vb(p) dotproduct vb(r)) dif x dif y dif z
  $
][
  变换体积分
  $
    g(vb(p)) = & 1 / (2 pi planck.reduce)^(3 / 2) integral_0^oo dif r integral_0^pi 2 pi r^2 sin theta dif theta psi(vb(r)) e^(- i / planck.reduce p r cos theta) \
    = & 1 / (2 pi planck.reduce)^(3 / 2) integral_0^pi sin theta dif theta integral_0^oo 2 pi r^2 1 / sqrt(pi a_0^3) e^(- r / a_0) e^(- i / planck.reduce p r cos theta) dif r \
    = & (4 sqrt(pi a_0^3)) / (2 pi planck.reduce)^(3 / 2) integral_0^pi (sin theta dif theta) / (1 + i p / planck.reduce a_0 cos theta)^3 \
    = & (8 sqrt(pi a_0^3)) / (2 pi planck.reduce)^(3 / 2) 1 / (1 + p^2 / planck.reduce^2 a_0^2)^2
  $
  其中 $p = abs(vb(p))$
]

#prob[
  原子核的电荷分布函数为 $rho(vb(r))$，已知它的 Fourier 变换（称为形状因子）
  $
    F(vb(k)) = 1 / (2 pi)^(3 / 2) integral.triple rho(vb(r)) e^(- i vb(k) dotproduct vb(r)) dif x dif y dif z = 1 / (2 pi)^(3 / 2) (1 + k^2 / a^2)^(-1)
  $
  其中 $r = abs(vb(r))$，$k = abs(vb(k))$，$a$ 为常数，试求 $rho(vb(r))$。
][
  逆变换给出
  $
    rho(vb(r)) = 1 / (2 pi)^(3 / 2) integral.triple F(vb(k)) e^(i vb(k) dotproduct vb(r)) dif k_x dif k_y dif k_z
  $
  同理进行体积分变换
  $
    rho(vb(r)) = & 1 / (2 pi)^(3 / 2) integral_0^oo dif k integral_0^pi 2 pi k^2 sin theta dif theta F(vb(k)) e^(i k r cos theta) \
    = & 1 / (2 pi)^3 integral_0^oo dif k (2 pi k^2) / (1 + k^2 / a^2) integral_0^pi sin theta e^(i k r cos theta) dif theta \
    = & 1 / (4 pi^2) integral_0^oo dif k k^2 / (1 + k^2 / a^2) (2 sin k r) / (k r) \
    = & a^2 / (2 pi^2 r) integral_0^oo dif u (u sin u) / (a^2 r^2 + u^2) \
    = & a^2 / (4 pi r) e^(- a r)
  $
]

#prob[
  证明 $delta$ 函数的下列性质：
  #sub(
    ..((..n) => n.pos())[
      1. $delta(x) = delta(-x)$；
    ][
      2. $x delta(x) = 0$；
    ][
      3. $g(x) delta(x) = g(0) delta(x)$；
    ][
      4. $x delta'(x) = - delta(x)$；
    ][
      5. $delta(a x) = 1 / a delta(x), quad a > 0$；
    ][
      6. $g(x) delta'(x) = g(0) delta'(x) - g'(0) delta(x)$；
    ],
    grid.cell(colspan: 2)[
      7. $delta(x^2 - a^2) = 1 / (2 a) (delta(x - a) + delta(x + a)), quad a > 0$；
    ],
  )
][
  $delta$ 函数的等式应在积分意义下理解：

  + 注意到
    $
      integral_(-oo)^oo delta(x) f(x) dif x = f(0) = integral_(-oo)^oo delta(x) f(-x) dif x = integral_(-oo)^oo delta(-x') f(x') dif x'
    $
    从而
    $
      delta(x) = delta(-x)
    $

  + 由定义 $integral_(-oo)^oo delta(x) f(x) dif x = f(0)$，取 $f(x) = x g(x)$ 可得
    $
      x delta(x) = 0
    $

  + 连续函数性质结合 $delta$ 函数定义可得
    $
      integral_(-oo)^oo g(x) delta(x) f(x) dif x = g(0) f(0) = integral_(-oo)^oo g(0) delta(x) f(x) dif x
    $
    从而
    $
      g(x) delta(x) = g(0) delta(x)
    $

  + 分部积分
    $
      integral_(-oo)^oo x delta'(x) f(x) dif x = - integral_(-oo)^oo delta(x) (f(x) + x f'(x)) dif x
    $
    注意到
    $
      x delta(x) = 0
    $
    从而
    $
      x delta'(x) = - delta(x)
    $

  + 积分定义
    $
      integral_(-oo)^oo delta(a x) f(x) dif x = integral_(-oo)^oo delta(u) f(u / a) (dif u) / a = f(0) / a = integral_(-oo)^oo 1 / a delta(x) f(x) dif x
    $
    即
    $
      delta(a x) = 1 / a delta(x), quad a > 0
    $

  + 分部积分
    $
      integral_(-oo)^oo g(x) delta'(x) f(x) dif x = - integral_(-oo)^oo (g'(x) f(x) + g(x) f'(x)) delta(x) dif x \
      integral_(-oo)^oo g(0) delta'(x) f(x) dif x = - integral_(-oo)^oo g(0) f'(x) delta(x) dif x
    $
    作差有
    $
      g(x) delta'(x) - g(0) delta'(x) = - g'(x) delta(x) = - g'(0) delta(x)
    $
    可得
    $
      g(x) delta'(x) = g(0) delta'(x) - g'(0) delta(x)
    $

  + 对于 $a > 0$，分析给定 $epsilon$ 满足 $0 < epsilon < a$ 时
    $
      integral_(-oo)^oo delta(x^2 - a^2) f(x) dif x = integral_(-a - epsilon)^(-a + epsilon) f(x) delta((x - a) (x + a)) dif x + integral_(a - epsilon)^(a + epsilon) f(x) delta((x - a) (x + a)) dif x
    $
    令 $epsilon -> 0$，可知 $f(-a) / (2 (a + epsilon)) < integral_(-a - epsilon)^(-a + epsilon) f(x) delta((x - a) (x + a)) dif x < f(-a) / (2 (a - epsilon))$，从而
    $
      integral_(-oo)^oo delta(x^2 - a^2) f(x) dif x = f(a) / (2 a) + f(-a) / (2 a)
    $
    易知
    $
      RHS = integral_(-oo)^oo 1 / (2 a) (delta(x - a) + delta(x + a)) f(x) dif x
    $
    从而得到
    $
      delta(x^2 - a^2) = 1 / (2 a) (delta(x - a) + delta(x + a)), quad a > 0
    $
]

#prob[
  利用 Laplace 变换，求解下列常微分方程边值问题：
  $
    (dif^2 y(x)) / (dif x^2) - k^2 y(x) = delta(x - x'), wide x > 0, thick k > 0, thick x' > 0\
    y(0) = 0, wide eval(y)_(x -> oo) = 0.
  $
][
  直接对原方程 Laplace 变换得
  $
    LHS img & integral_0^oo e^(- p x) ((dif^2 y) / (dif x^2) - k^2 y) dif x \
    = & -k^2 F(p) - y'(0) + p^2 F(p) \
    = & (p^2 - k^2) F(p) - y'(0) \
    RHS img & e^(- p x')
  $
  求得
  $
    F(p) = (y'(0) + e^(- p x')) / (p^2 - k^2) isimgof y'(0) (sinh k x) / k + (sinh k (x - x')) / k eta(x - x') = y(x)
  $
  要求 $eval(y)_(x -> oo) = 0$，则有
  $
    y'(0) e^(k x) + e^(k (x - x')) = 0 => y'(0) = - e^(- k x')
  $
  解得原问题的解为
  $
    y(x) = dcases(
      - 1 / k e^(- k (x - x')) sinh k x \, quad & x < x',
      - 1 / k (e^(- k (x - x')) sinh k x - sinh k (x - x')) \, quad & x > x'
    )
  $
]
