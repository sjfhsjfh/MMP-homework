#import "../lib.typ": *
#import "@preview/slashion:0.1.1": slash-frac as sfrac
#import "@preview/physica:0.9.3": vb, dotproduct, eval

#show: config("第十五周作业")

#show math.equation.where(block: true): set block(breakable: true)

#prob[
  求三维空间中半径为 $a$，质量为 $m$，厚度可忽略的均匀薄圆盘的密度分布函数分别在直角坐标系、柱坐标系和球坐标系中的表达式。
][
  定义窗函数 $w(x) = cases(1\, quad abs(x) < 1, 0\, quad abs(x) > 1)$，则均匀薄圆盘的密度分布函数在直角坐标系中的表达式为
  $
    rho(x, y, z) = m / (pi a^2) w(sqrt(x^2 + y^2) / a) delta(z)
  $
  柱坐标系中的表达式为
  $
    rho(r, phi, z) = m / (pi a^2) w(r / a) delta(z)
  $
  球坐标系中有
  $
    dif m = & rho(r, phi, theta) r^2 sin theta dif r dif theta dif phi \
    = & m / (pi a^2) w(r' / a) delta(z) r' dif r' dif phi dif z \
    = & m / (pi a^2) w(r / a) delta(r cos theta) r sin theta (partial(r', phi, z) / partial(r, phi, theta)) dif r dif theta dif phi \
    = & m / (pi a^2) w(r / a) delta(r cos theta) r^2 sin theta dif r dif theta dif phi \
  $
  即得到球坐标系中的表达式为
  $
    rho(r, phi, theta) = m / (pi a^2) w(r / a) delta(r cos theta)
  $
]

#prob[
  #set math.equation(numbering: "(1)")
  任意一个二阶线性常微分方程都可以写成
  $
    (dif^2 y(x)) / (dif x^2) + a(x) (dif y(x)) / (dif x) + b(x) y(x) = c(x)
  $ <2.1>
  其中 $a(x)$、$b(x)$ 和 $c(x)$ 都是已知函数。请将 @2.1 化成如下形式：
  $
    dif / (dif x) [p(x) (dif y(x)) / (dif x)] + q(x) y(x) = f(x)
  $ <2.2>
  即请将 $p(x)$、$q(x)$ 和 $f(x)$ 用 $a(x)$、$b(x)$ 和 $c(x)$ 表达。
][
  展开 @2.2 得到
  $
    & p'(x) y'(x) + p(x) y''(x) + q(x) y(x) = f(x) \
    => & y''(x) + (p'(x) / p(x)) y'(x) + (q(x) / p(x)) y(x) = f(x) / p(x) \
  $
  即
  $
    a(x) = (p'(x)) / p(x), quad b(x) = q(x) / p(x), quad c(x) = f(x) / p(x)
  $
  所以有
  $
    p(x) = & exp(integral_(x_0)^x a(x') dif x') \
    q(x) = & b(x) exp(-integral_(x_0)^x a(x') dif x') \
    f(x) = & c(x) exp(-integral_(x_0)^x a(x') dif x')
  $
  其中 $x_0$ 任取（在定义域内即可）
]

#prob[
  分析下列方程的奇点，并指出是否是正则奇点：

  + $z u'' + (b - z) u' - a u = 0$，其中 $a$，$b$ 是已知常数。

  + $(1 - z^2) v'' - 2 (m + 1) z v' + [lambda - m (m + 1)] v = 0$，其中 $m$，$lambda$ 是已知常数。
][
  + 标准化为
    $
      u'' + (b - z) / z u' - a / z u = 0 => p(z) = (b - z) / z, q(z) = - a / z
    $
    $z = 0$ 是正则奇点。对于无穷远处作变量替换 $z = 1 / t$，可知 $2 / t - 1 / t^2 p(1 / t)$ 在 $t = 0$ 处为奇点，正则要求 $2 - 1 / t p (1 / t)$ 和 $1 / t^2 q(1 / t)$ 在 $t = 0$ 处解析，分析知显然前者不解析，故 $z = oo$ 是非正则奇点。

  + 标准化为
    $
      v'' - (2 (m + 1)) / (1 - z^2) v' + [lambda - m (m + 1)] / (1 - z^2) v = 0 => p(z) = - (2 (m + 1)) / (1 - z^2), q(z) = (lambda - m (m + 1)) / (1 - z^2)
    $
    $z = plus.minus 1$ 均是正则奇点。对于无穷远处作变量替换 $z = 1 / t$，注意到 $1 / t^4 q(1 / t)$ 在 $t = 0$ 处为奇点，正则要求 $2 - 1 / t p (1 / t)$ 和 $1 / t^2 q(1 / t)$ 在 $t = 0$ 处解析，分析知两者均解析，故 $z = oo$ 是正则奇点。
]

#prob[
  计算下列方程在每个正则奇点处的指标：

  + $z (1 - z) (dif^2 u) / (dif z^2) + [gamma - (alpha + beta + 1) z] (dif u) / (dif z) - alpha beta u = 0$，其中 $alpha$，$beta$，$gamma$ 为已知常数。

  + $u'' - 2 z u' + 2 lambda u = 0$，其中 $lambda$ 是已知常数。

  + $(1 - z^2) v'' - 2 (m + 1) z v' + [lambda - m (m + 1)] v = 0$，其中 $m$，$lambda$ 是已知常数。

  + $(1 - z^2) (dif^2 w) / (dif z^2) - 2 z (dif w) / (dif z) + nu (nu + 1) w = 0$，其中 $nu$ 为已知常数。
][
  + 标准化为
    $
      u'' + (gamma - (alpha + beta + 1) z) / (z (1 - z)) u' - (alpha beta) / (z (1 - z)) u = 0 => p(z) = (gamma - (alpha + beta + 1) z) / (z (1 - z)), q(z) = - (alpha beta) / (z (1 - z))
    $
    正则奇点 $z = 0$ 和 $z = 1$，对于 $z = 0$ 有
    $
      a_0 & = lim_(z -> 0) z p(z) = gamma\
      b_0 & = lim_(z -> 0) z^2 q(z) = 0
    $
    解指标方程
    $
      rho (rho - 1) + a_0 rho + b_0 = 0 => rho_(1, 2) = 0, 1 - gamma
    $
    对于 $z = 1$ 有
    $
      a_0 & = lim_(z -> 1) (z - 1) p(z) = alpha + beta - gamma + 1\
      b_0 & = lim_(z -> 1) (z - 1)^2 q(z) = 0
    $
    解指标方程
    $
      rho (rho - 1) + a_0 rho + b_0 = 0 => rho_(1, 2) = 0, gamma - alpha - beta
    $

  + 有限远无正则奇点，无穷远不为正则奇点，故无需计算。

  + 标准化为
    $
      v'' - (2 (m + 1) z) / (1 - z^2) v' + [lambda - m (m + 1)] / (1 - z^2) v = 0 => p(z) = - (2 (m + 1) z) / (1 - z^2), q(z) = (lambda - m (m + 1)) / (1 - z^2)
    $
    正则奇点 $z = plus.minus 1$，对于 $z = plus.minus 1$ 有
    $
      a_0 & = lim_(z -> plus.minus 1) (z - plus.minus 1) p(z) = m + 1
      b_0 & = lim_(z -> plus.minus 1) (z - plus.minus 1)^2 q(z) = 0
    $
    解指标方程
    $
      rho (rho - 1) + a_0 rho + b_0 = 0 => rho_(1, 2) = 0, - m
    $

  + 标准化为
    $
      w'' + (2 z) / (z^2 - 1) - (nu (nu + 1)) / (z^2 - 1) w = 0 => p(z) = (2 z) / (z^2 - 1), q(z) = - (nu (nu + 1)) / (z^2 - 1)
    $
    正则奇点 $z = plus.minus 1$，对于 $z = plus.minus 1$ 有
    $
      a_0 & = lim_(z -> plus.minus 1) (z - plus.minus 1) p(z) = 1 \
      b_0 & = lim_(z -> plus.minus 1) (z - plus.minus 1)^2 q(z) = 0
    $
    解指标方程
    $
      rho (rho - 1) + a_0 rho + b_0 = 0 => rho_(1, 2) = 0
    $
]

#prob[
  求下列方程在 $z = 0$ 邻域内的两个线性无关的级数解：

  + $(1 + z + z^2) w''(z) + 2 (1 + 2 z) w'(z) + 2 w(z) = 0$；

  + $z w''(z) - z w'(z) + w(z) = 0$.
][
  + 构造 $w(z) = f(z) / (1 + z + z^2)$ 解得
    $
      f'' = 0 => f = c_1 z + c_2
    $
    两线性无关的解
    $
      w_1(z) = & A / (1 + z + z^2) = A sum_(k = 0)^oo (1 - z) z^(3 k) \
      w_2(z) = & (B z) / (1 + z + z^2) = B sum_(k = 0)^oo (1 - z) z^(3 k + 1)
    $

  + 标准化为
    $
      w'' - w' + w / z = 0 => p(z) = - 1, q(z) = 1 / z => rho_(1, 2) = 0, 1
    $
    两线性无关的解
    $
      w_1 = & z sum_(k = 0)^oo c_k z^k \
      w_2 = & g w_1 ln z + sum_(k = 0)^oo d_k z^k
    $
    先求出
    $
      k (k + 1) c_(k + 1) - k c_k + c_k = 0 => c_k = cases(c_0\, quad k = 0,0\, quad k > 0)
    $
    即
    $
      w_1(z) = A z
    $
    令 $f(z) = A^(-1) (w_2(z) - z ln z) = sum_(k = 0)^oo d_k z^k$，得
    $
      z f''(z) - z f'(z) + f(z) = z - 1 => d_k - (k - 1) d_(k - 1) - (k + 1) k d_(k + 1) = 0, d_0 = -1, d_2 = 1 / 2
    $
    解得
    $
      d_k = 1 / ((k - 1) Gamma(k + 1)), quad k >= 2
    $
    从而两线性无关的解
    $
      w_1(z) = & A z \
      w_2(z) = & A (z ln z - 1 + sum_(k = 2)^oo z^k / ((k - 1) Gamma(k + 1)))
    $
]

#prob[
  当参数 $lambda$ 取何值时 Laguerre 方程 $x y'' + (1 - x) y' + lambda y = 0$ 在 $x = 0$ 处有一解截断为多项式？并求出此多项式解。
][
  标准化为
  $
    y'' + (1 - x) / x y' + lambda / x y = 0 => p(x) = (1 - x) / x, q(x) = lambda / x
  $
  指标方程为
  $
    rho (rho - 1) + a_0 rho + b_0 = 0 => rho_(1, 2) = 0
  $
  求无对数项解
  $
    w(z) = sum_(k = 0)^oo c_k z^k => & c_(k + 1) k (k + 1) + (k + 1) c_(k + 1) - k c_k + lambda c_k = 0 \
    => & c_(k + 1) = (k - lambda) / (k + 1)^2 c_k quad forall k >= 1
  $
  因此对于任意自然数 $lambda$，该解都截断为多项式。可得
  $
    c_k = ((-)^(k - 1) Gamma(lambda)) / (Gamma(lambda - k + 1) Gamma^2(k + 1)) c_1 quad forall 1 < k <= lambda
  $
  又由于
  $
    c_1 = - lambda c_0
  $
  该多项式解为
  $
    w(z) = c_0 (1 + sum_(k = 1)^lambda ((-)^(k - 1) Gamma(lambda)) / (Gamma(lambda - k + 1) Gamma^2(k + 1)) z^k)
  $
]

#prob[
  在量子力学中讨论 Stark 效应时会得到常微分方程
  $
    dif / (dif z) (z (dif w) / (dif z)) + (1 / 2 E z + alpha - m^2 / (4 z) - 1 / 3 F z^2) w = 0, wide m >= 0
  $
  其中 $alpha$，$m$，$E$ 和 $F$ 都是已知常数。试求此方程在 $z = 0$ 点的有界解。
][
  标准化为
  $
    z w'' + w' + (1 / 2 E z + alpha - m^2 / (4 z) - 1 / 3 F z^2) w = 0 => p(z) = 1 / z, q(z) = 1 / z (1 / 2 E z + alpha - m^2 / (4 z) - 1 / 3 F z^2)
  $
  指标方程为
  $
    rho (rho - 1) + rho - m^2 / 4 = 0 => rho_(1, 2) = m / 2, - m / 2
  $
  有界解为
  $
    w(z) = z^(m / 2) sum_(k = 0)^oo c_k z^k,
  $
  似乎得不出比较初等的形式...
]
