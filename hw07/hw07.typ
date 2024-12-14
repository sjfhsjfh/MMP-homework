#import "../lib.typ": *

#import "@preview/physica:0.9.3": eval

#show: config("第七周作业")

#prob[
  计算下列积分:
  #sub[
    1. $display(integral.cont.ccw_(abs(z) = 2) (sin z) / z^4 dif z)$;
  ][
    2. $display(integral.cont.ccw_(abs(z) = 2) (dif z) / (z^2 (z^2 + 16)))$;
  ][
    3. $display(integral.cont.ccw_(abs(z) = 2) (abs(z) e^z) / z^2 dif z)$.
  ]
][
  + 被积函数在 $abs(z) = 2$ 内仅有 $z = 0$ 一个奇点, 由 $sin z$ 的 Taylor 展开式
    $
      sin z = z - z^3 / 3! + z^5 / 5! - z^7 / 7! + dots.c
    $
    可得被积函数在 $z = 0$ 处的 Laurent 展开式为
    $
      (sin z) / z^4 = z^(-3) - 1 / 3! z^(-1) - 1 / 5! z^(-3) + 1 / 7! z^(-5) - dots.c
    $
    故在 $z = 0$ 处的留数为
    $
      eval(Res((sin z) / z^4))_(z = 0) = -1 / 3! = -1 / 6
    $
    由留数定理, 原积分等于
    $
      integral.cont.ccw_(abs(z) = 2) (sin z) / z^4 dif z = 2 pi i (-1 / 6) = - i pi / 3
    $

  + 被积函数在 $abs(z) = 2$ 内仅有 $z = 0$ 一个奇点, 注意到被积函数为偶函数, 故在 $z = 0$ 处的留数为 $0$, 由留数定理, 原积分等于 $0$.

  + 由积分路径 $abs(z) = 2$ 将原积分化为
    $
      integral.cont.ccw_(abs(z) = 2) (abs(z) e^z) / z^2 dif z = integral.cont.ccw_(abs(z) = 2) (2 e^z) / z^2 dif z
    $
    被积函数在 $abs(z) = 2$ 内仅有 $z = 0$ 一个奇点, 由 $e^z$ 的 Taylor 展开式
    $
      e^z = 1 + z + z^2 / 2! + z^3 / 3! + dots.c
    $
    可得被积函数在 $z = 0$ 处的 Laurent 展开式为
    $
      (2 e^z) / z^2 = 2 / z^2 + 2 / z + 2 / 2! + (2 z) / 3! + dots.c
    $
    故在 $z = 0$ 处的留数为
    $
      eval(Res((2 e^z) / z^2))_(z = 0) = 2
    $
    由留数定理, 原积分等于
    $
      integral.cont.ccw_(abs(z) = 2) (abs(z) e^z) / z^2 dif z = 2 pi i (2) = 4 pi i
    $

]

#prob[
  1. 计算积分 $display(integral.cont.ccw_(abs(z) = 1) e^z / z^3 dif z)$.

  2. $a$ 取何值时, 变上限积分 $display(F(z) = integral_(z_0)^z e^zeta (1 / zeta + a / zeta ^ 3)) dif zeta$ 在复平面上是单值的?
][
  + 被积函数在 $abs(z) = 1$ 内仅有 $z = 0$ 一个奇点, 由 $e^z$ 的 Taylor 展开式
    $
      e^z = 1 + z + z^2 / 2! + z^3 / 3! + dots.c
    $
    可得被积函数在 $z = 0$ 处的 Laurent 展开式为
    $
      e^z / z^3 = z^(-3) + z^(-2) + 1 / 2! z^(-1) + 1 / 3! + dots.c
    $
    故在 $z = 0$ 处的留数为
    $
      eval(Res(e^z / z^3))_(z = 0) = 1 / 2! = 1 / 2
    $
    由留数定理, 原积分等于
    $
      integral.cont.ccw_(abs(z) = 1) e^z / z^3 dif z = 2 pi i (1 / 2) = i pi
    $


  + 显然被积函数在复平面有限远处上仅有 $z = 0$ 一个奇点, 由 $e^z$ 在 $z = 0$ 处的 Taylor 展开式
    $
      e^z = 1 + z + z^2 / 2! + dots.c
    $
    知 $e^z (1 / z + a / z^3)$ 在 $z = 0$ 处的 Laurent 展开式为
    $
      e^z (1 / z + a / z^3) = dots.c + (1 + a / 2!) 1 / z + dots.c
    $
    由此可知当 $a = - 2! = -2$ 时, 积分的被积函数在复平面上的奇点的留数均为 $0$, 故积分在复平面上是单值的.
]

#prob[
  判断下列级数的收敛性与绝对收敛性:
  #sub[
    1. $display(sum_(n = 2)^oo i^n / (ln n))$;
  ][
    2. $display(sum_(n = 1)^oo i^n / n)$;
  ]
][
  + 令 $a_n = i^n$, $v_n = 1 / (ln n)$, 显然 $sum a_n$ 有界, 且 $lim_(n -> oo) v_n = 0$, 即显然有 $sum (v_n - v_(n + 1))$ 绝对收敛, 由 Dirichlet 判别法, $sum a_n v_n$ 收敛, 即原级数收敛. 又有 $abs(i^n / (ln n)) = 1 / (ln n) < 1 / (n - 1)$, 求和显然发散, 故原级数不绝对收敛.

  + 令 $a_n = i^n$, $v_n = 1 / n$, 显然 $sum a_n$ 有界, 且 $lim_(n -> oo) v_n = 0$, 即显然有 $sum (v_n - v_(n + 1))$ 绝对收敛, 由 Dirichlet 判别法, $sum a_n v_n$ 收敛, 即原级数收敛. 又有 $abs(i^n / n) = 1 / n$, 求和显然发散, 故原级数不绝对收敛.
]

#prob[
  #v(.5em)
  证明级数 $display(sum_(n = 1)^oo z^(n - 1) / ((1 - z^n) (1 - z^(n + 1)))), med abs(z) != 1$ 收敛, 并求其和
][
  裂项有
  $
    z^(n - 1) / ((1 - z^n) (1 - z^(n + 1))) = 1 / (z (z - 1)) (1 / (1 - z^(n + 1)) - 1 / (1 - z^n))
  $
  则部分和
  $
    s_n = sum_(k = 1)^n z^(k - 1) / ((1 - z^k) (1 - z^(k + 1))) = 1 / (z (z - 1)) (1 / (1 - z^(n + 1)) - 1 / (1 - z))
  $
  对于 $abs(z) < 1$, 有 $z^(n + 1) -> 0$, 故
  $
    lim_(n -> oo) s_n = 1 / (z (z - 1)) (- z / (1 - z)) = 1 / (z - 1)^2
  $
  对于 $abs(z) > 1$, 有 $z^(n + 1) -> oo$, 故
  $
    lim_(n -> oo) s_n = 1 / (z (z - 1)^2)
  $
  综上所述, 原级数收敛, 且和为
  $
    sum_(n = 1)^oo z^(n - 1) / ((1 - z^n) ( 1 - z^(n + 1) )) = dcases(
      1 / (z - 1)^2\, wide & abs(z) < 1,
      1 / (z (z - 1)^2)\, wide & abs(z) > 1
    )
  $
]

#prob[
  试确定下列级数的收敛区域:
  #sub[
    1. $display(sum_(n = 1)^oo z^(n!))$;
  ][
    2. $display(sum_(n = 1)^oo (z / (1 + z))^n)$.
  ][
    3. $display(sum_(n = 1)^oo (-)^n (z^2 + 2 z + 2)^n)$.
  ][
    4. $display(sum_(n = 1)^oo 2^n sin z / 3^n)$.
  ]
][
  + 该级数属于幂级数, 中心位于 $a = 0$, 对于 $z = 1$ 显然该级数发散, 而对于 $abs(z) < 1$ 的情形, 用比较判别法, 放缩至 $abs(z^(n!)) < abs(z^n) = abs(z)^n$ 可知该级数绝对收敛, 由 Abel 定理推得收敛区域为 $abs(z) < 1$

  + 由 (1) 知 $sum_(n = 1)^oo z^n$ 的收敛区域为 $abs(z) < 1$, 又由 $z / (z + 1)$ 在复平面上除了 $z = -1$ 处单值解析, 从而 $sum_(n = 1)^oo (z / (1 + z))^n$ 的收敛区域为 $abs(z / (1 + z)) < 1$, 即 $Re z > - 1 / 2$

  + 由 (1) 知 $sum_(n = 1)^oo z^n$ 的收敛区域为 $abs(z) < 1$, 又由 $- z^2 - 2 z - 2$ 在复平面上处处单值解析, 从而 $sum_(n = 1)^oo (-)^n (z^2 + 2 z + 2)^n$ 的收敛区域为 $abs(- z^2 - 2 z - 2) < 1$, 即 $abs(z^2 + 2 z + 2) < 1$

  + 对于任意给定的 $alpha > 0$ 有当 $0 < abs(z) < alpha$ 时 $abs(sin z) < beta abs(z)$, 其中 $beta$ 为任意大于 $max_(0 < abs(z) < alpha) abs((sin z) / z)$ 的正实数, 则对于 $alpha = abs(z)$, 设对应存在的 $beta$ 为 $beta_0$, 则
    $
      abs(2^n sin z / 3^n) < 2^n beta_0 abs(z) / 3^n = (2 / 3)^n beta_0 abs(z)
    $
    则可知该函数级数在复平面上任意一点都绝对收敛, 故收敛区域为整个复平面
]

#prob[
  试求下列幂级数的收敛半径:
  #sub[
    1. $display(sum_(n = 1)^oo 1 / n^n z^n)$;
  ][
    2. $display(sum_(n = 1)^oo 1 / (2^n n^n) z^n)$;
  ][
    3. $display(sum_(n = 1)^oo n! / n^n z^n)$;
  ][
    4. $display(sum_(n = 1)^oo (-)^n / (2^(2n) (n!)^2) z^n)$;
  ][
    5. $display(sum_(n = 1)^oo n^(ln n) z^n)$;
  ][
    6. $display(sum_(n = 1)^oo 1 / (2^(2n)) z^(2n))$;
  ][
    7. $display(sum_(n = 1)^oo (ln n) / n! z^n)$;
  ][
    8. $display(sum_(n = 1)^oo (1 - 1 / n)^n z^n)$.
  ]
][
  + 根据 Cauchy-Hadamard 公式, 有
    $
      R = lim_(n -> oo) (1 / (1 slash n^n))^(1 / n) = lim_(n -> oo) n = oo
    $

  + 根据 Cauchy-Hadamard 公式, 有
    $
      R = lim_(n -> oo) (1 / (1 slash (2^n n^n)))^(1 / n) = lim_(n -> oo) 2 n = oo
    $

  + 根据 Cauchy-Hadamard 公式, 有
    $
      R =& lim_(n -> oo) (n^n / n!)^(1 / n) \
      =& lim_(n -> oo) exp(ln n - 1 / n ln n!) \
      =& lim_(n -> oo) exp(ln n - ((1 + 1 / (2 n)) ln (n + 1 / 2) - (1 + 1 / (2 n)))) \
      =& e
    $

  + 根据 Cauchy-Hadamard 公式, 有
    $
      R = lim_(n -> oo) (1 / (1 slash (2^(2n) (n!)^2)))^(1 / n) = 4 lim_(n -> oo) ( n! )^(2 / n) = 4 / e^2 lim_(n -> oo) n^2 = oo
    $

  + 根据 Cauchy-Hadamard 公式, 有
    $
      R = lim_(n -> oo) (1 / n^(ln n))^(1 / n) = lim_(n -> oo) exp (- 1 / n ln^2 n) = 1
    $

  + 根据 Cauchy-Hadamard 公式, 有
    $
      R = 1 / (lim_(n -> oo) (1 / 2^(2n))^(1 / (2n))) = 1 / (1 / 2) = 2
    $

  + 根据 Cauchy-Hadamard 公式, 有
    $
      R = lim_(n -> oo) (n! / (ln n^n))^(1 / n) = lim_(n -> oo) (n slash e) / ((n ln n)^(1 / n)) = oo
    $

  + 根据 Cauchy-Hadamard 公式, 有
    $
      R = 1 / (lim_(n -> oo) (1 - 1 / n)^(n dot.c 1 / n)) = 1
    $
]
