#import "../lib.typ": config, prob

#import "@preview/xarrow:0.3.0": xarrow

#show: config("第三周作业")

#let Re = math.op("Re")
#let Im = math.op("Im")
#let dcases(..x) = math.cases(..x.pos().map(x => math.display(x)))

#prob[
  //   z = x + iyßÆ)¤ºÍf (z) = u(x, y) + iv(x, y)¢‹u(x, y)Xeß¡¶—)¤º
  // Íf (z)µ
  // (1) ey cos x; (2) x
  // x2 + y2 ;
  设 $z = x + i y$, 已知解析函数 $f(z) = u(x, y) + i v(x, y)$ 的实部 $u(x, y)$ 如下, 试求出解析函数 $f(z)$:

  #grid(columns: (50%, 50%), row-gutter: 1em)[
    1. $e^y cos x$
  ][
    2. $x / (x^2 + y^2)$
  ]
][
  由 Cauchy-Riemann 条件
  $
    (diff u) / (diff x) =& (diff v) / (diff y) \
    (diff u) / (diff y) =& -(diff v) / (diff x)
  $
  可得

  =
  $
    & (diff v) / (diff y) = (diff u) / (diff x) = -e^y sin x \
    => & v(x, y) = integral^y -e^y sin x dif y + X(x) = -e^y sin x + X(x)
  $
  $
    & (diff v) / (diff x) = -(diff u) / (diff y) = -e^y cos x \
    => & X'(x) = 0 => X(x) = C
  $
  从而对应的 $f(z) = e^y cos x + i (-e^y sin x + C)$ 即为待求解析函数, 化为 $z$ 的函数即
  $
    f(z) =& e^y (cos x - i sin x) + i C \
    =& e^(y - i x) + i C \
    =& e^(-i z) + i C
  $
  其中 $C in RR$ 为任意常数.

  #pagebreak()

  =
  $
    & (diff v) / (diff y) = (diff u) / (diff x) = (y^2 - x^2) / (x^2 + y^2)^2 \
    => & v(x, y) = integral^y (y^2 - x^2) / (x^2 + y^2)^2 dif y + X(x) = - y / (x^2 + y^2) + X(x)
  $
  $
    & (diff v) / (diff x) = -(diff u) / (diff y) = (2 x y) / (x^2 + y^2)^2 \
    => & X'(x) = 0 => X(x) = C
  $
  从而对应的 $f(z) = x / (x^2 + y^2) + i (-y / (x^2 + y^2) + C)$ 即为待求解析函数, 化为 $z$ 的函数即
  $
    f(z) =& (x - i y) / (x^2 + y^2) + i C \
    =& z^ast / (z z^ast) + i C \
    =& 1 / z + i C
  $
  其中 $C in RR$ 为任意常数.
]

#prob[
  设 $z = x + i y$, 已知解析函数 $f(z) = u(x,y) + i v(x,y)$ 的实部为
  $
    u = sin x cosh y.
  $

  试求 $f'(z)$:
][
  由 Cauchy-Riemann 条件
  $
    & (diff v) / (diff y) = (diff u) / (diff x) = cos x cosh y \
    => & v(x, y) = integral^y cos x cosh y dif y + X(x) = cos x sinh y + X(x)
  $
  $
    & (diff v) / (diff x) = -(diff u) / (diff y) = -sin x sinh y \
    => & X'(x) = 0 => X(x) = C
  $
  因此
  $
    f(z) =& sin x cosh y + i (cos x sinh y + C) \
    =& (e^(i x) - e^(- i x)) / (2 i) (e^y + e^(-y)) / 2 + i (e^(i x) + e^(- i x)) / 2 (e^y - e^(-y)) / 2 + i C \
    =& i / 2 e^(y - i x) - i / 2 e^(- y + i x) + i C \
    =& sin (x + i y) + i C \
    =& sin z + i C, C in RR
  $
  从而有
  $
    f'(z) = cos z
  $
]

#prob[
  设 $z = x + i y$, $x in RR$, $y in RR$, 函数 $f(z)$ 在复平面 $CC$ 内解析且不是常数函数, 已知 $f(z)$ 的实部 $Re f = u(x, y)$ 具有下列分离变量的形式, 即
  $
    u(x, y) = a(x) + b(y)
  $

  其中 $a$ 和 $b$ 都是未知的单变量实函数. 求满足上述要求的复平面 C 内的解析函数 $f(z)$.
][
  由 Cauchy-Riemann 条件
  $
    & (diff v) / (diff y) = (diff u) / (diff x) = a'(x) \
    => & v(x, y) = integral^y a'(x) dif y + X(x) = a'(x) y + X(x)
  $
  $
    & (diff v) / (diff x) = -(diff u) / (diff y) \
    => & a''(x) y + X'(x) = -b'(y)
  $
  对 $y$ 求导, 得
  $
    a''(x) = -b''(y)
  $
  左侧为 $x$ 的函数, 右侧为 $y$ 的函数, 相等则说明仅可能为常数, 则 $u$ 必然具有如下形式:
  $
    u(x, y) = A((x - x_0)^2 - (y - y_0)^2) + B, wide A, B, x_0, y_0 in RR, A != 0
  $
  或
  $
    u(x, y) = A x + B y + C, wide A, B, C in RR
  $
  因此
  $
    v(x, y) =& a'(x) y + integral^x (-a''(x) y - b'(y)) dif x \
    =& 2 A (x - x_0) y + integral^x (- 2 A y + 2 A (y - y_0)) dif x \
    =& 2 A (x y - x_0 y - y_0 x + x_0 y_0) + C, quad C in RR \
    =& 2 A (x - x_0) (y - y_0) + C
  $
  或当 $u(x, y) = A x + B y + C$ 时, 得
  $
    v(x, y) =& a'(x) y - b'(y) x + D \
    =& A y - B x + D, quad D in RR
  $
  从而有
  $
    f(z) =& A((x - x_0)^2 - (y - y_0)^2) + B + i (2 A (x - x_0) (y - y_0) + C), quad A, B, C, x_0, y_0 in RR \
    =& A (z - z_0)^2 + z_1, wide z_0, z_1 in CC, A in RR
  $
  或
  $
    f(z) =& (A - i B) z + z_1, wide A, B, in RR, z_1 in CC
  $
  满足在 $CC$ 上解析的 $f(z)$ 必有上述形式, 又要求其不是常数函数, 则 $A != 0$. 综上, 满足题目条件的 $f(z)$ 为
  $
    f(z) = A z^2 + z_1 z + z_2, wide A in RR, z_1, z_2 in CC
  $
]

#prob[
  若函数 $f(z)$ 在区域 $G$ 内解析, 且其模为常数, 证明 $f(z)$ 本身也必为常数.
][
  设 $z = x + i y in G$, $f(z) = u(x, y) + i v(x, y)$, $abs(f(z)) = A forall z in G$, 则有
  $
    (u(x, y))^2 + (v(x, y))^2 = A^2 forall z in G
  $
  求全微分得
  $
    & u dif u + v dif v = 0 \
    => & dcases(
      u (diff u) / (diff x) + v (diff v) / (diff x) = 0,
      u (diff u) / (diff y) + v (diff v) / (diff y) = 0,
    )
  $
  利用 Cauchy-Riemann 条件, 得
  $
    & u (diff u) / (diff x) + v (diff v) / (diff x) = - u (diff v) / (diff x) + v (diff u) / (diff x) = 0 \
    => & (u^2 + v^2) (diff u) / (diff x) = (u^2 + v^2) (diff v) / (diff x) = 0 \
    => & (diff u) / (diff x) = (diff v) / (diff x) = 0
  $
  同理可得 $(diff u) / (diff y) = (diff v) / (diff y) = 0$, 因此 $u$ 和 $v$ 均为常数. 因此 $f(z)$ 本身也必为常数.
]

#prob[
  解下列方程:
  1. $cos z = 4$
][
  =
  根据定义
  $
    & (e^(i z) + e^(-i z)) / 2 = 4 \
    xarrow(sym: ==>, z = x + i y) & (e^(i x - y) + e^(-i x + y)) / 2 = 4 \
    => & (e^(y) + e^(- y)) / 2 cos x - i (e^(y) - e^(- y)) / 2 sin x = 4 + 0 i \
    => & dcases(
      cosh y cos x = 4,
      sinh y sin x = 0,
    ) wide x, y in RR
  $
  对于 $y = 0$ 显然无解, 则 $sin x = 0$, 即 $x = n pi, n in ZZ$, 又有 $forall y in RR, cosh y >= 1$, 因此 $cosh y = 4$, $cos x = 1$, 得 $y = plus.minus cosh^(-1) 4 = plus.minus ln (4 + sqrt(15)), x = 2 n pi, n in ZZ$. 即该方程的解为
  $
    z = 2 n pi + plus.minus ln (4 + sqrt(15)), quad n in ZZ
  $
]

#prob[
  判断哪些是多值函数, 哪些是函数：

  #grid(columns: (50%, 50%), row-gutter: 1em)[
    1. $sqrt(z^2 - 1)$,
  ][
    2. $z + sqrt(z - 1)$
  ][
    3. $sin sqrt(z)$,
  ][
    4. $cos sqrt(z)$
  ][
    5. $(sin sqrt(z)) / sqrt(z)$,
  ][
    6. $(cos sqrt(z)) / sqrt(z)$
  ]
][
  =
  多值函数, 对于 $z = 2$ 有 $w_1 = sqrt(3)$, $w_2 = -sqrt(3)$ 与之对应

  =
  多值函数, 对于 $z = 2$ 有 $w_1 = 3$, $w_2 = 1$ 与之对应

  =
  多值函数, 对于 $z = pi^2 slash 4$ 有 $w_1 = 1$, $w_2 = -1$ 与之对应

  =
  函数, 已知 $cos x$ 是函数, 假设 $cos sqrt(z_1) != cos sqrt(z_2)$ 则给出 $sqrt(z_1) != sqrt(z_2)$, 即 $sqrt(z_1) = -sqrt(z_2)$ 或 $z_1 != z_2$, 又由于 $cos x$ 是偶函数, $sqrt(z_1) = -sqrt(z_2)$ 时 $cos sqrt(z_1) = cos sqrt(z_2)$, 与假设矛盾, 因此 $cos sqrt(z_1) != cos sqrt(z_2)$ 可推得 $z_1 != z_2$, 因此 $cos sqrt(z)$ 是函数.

  =
  函数, 已知 $g(x) = (sin x) / x$ 是函数, 假设 $g(sqrt(z_1)) != g(sqrt(z_2))$ 则给出 $sqrt(z_1) != sqrt(z_2)$, 即 $sqrt(z_1) = -sqrt(z_2)$ 或 $z_1 != z_2$, 又由于 $g(x)$ 是偶函数, $sqrt(z_1) = -sqrt(z_2)$ 时 $g(sqrt(z_1)) = g(sqrt(z_2))$, 与假设矛盾, 因此 $(sin sqrt(z_1)) / sqrt(z_1) != (sin sqrt(z_2)) / sqrt(z_2)$ 可推得 $z_1 != z_2$, 因此 $g(x)$ 是函数.

  =
  多值函数, 对于 $z = pi^2$ 有 $w_1 = 1 / pi$, $w_2 = -1 / pi$ 与之对应

]

#pagebreak()

#prob[
  #set math.equation(numbering: "(1)")
  $n$ 为任意给定的整数, 由
  $
    e^(1 + 2n pi i) = e
  $

  等量替换, 有
  $
    (e^(1 + 2n pi i))^(1 + 2n pi i) = e^(1 + 2n pi i) = e
  $ <eq7.2>

  又
  $
    e^(1 + 2n pi i) = e^((1 + 2n pi i)(1 + 2n pi i)) = e^(1 + 4n pi i - 4n^2 pi^2) = e dot.c e^(-4n^2 pi^2)
  $ <eq7.3>

  比较 @eq7.2 和 @eq7.3, 得
  $
    e^(-4n^2 pi^2) = 1, n = 0, plus.minus 1, plus.minus 2, dots
  $

  以上推导, 哪里出问题了? 请分析如何修正才能得到一致的结果.
][
  复数指数的定义利用了 Euler 公式, 即
  $
    x^(a + b i) = exp(ln(x^(a + b i))) := exp((a + b i) ln(x)) = x^a exp(b i ln(x))
  $
  而 $ln(x)$ 是一个多值函数, 有
  $
    x^(a + b i) = x^a exp(b i (ln(x) + 2 n pi i))
  $
  因此复数幂实际上是多值函数, 例如为满足幂律
  $
    (x y)^(a + b i) = x^(a + b i) y^(a + b i)
  $
  应当注意在取 $x$, $y$ 及 $x y$ 的辐角时, $x y$ 的辐角应取为 $x$, $y$ 辐角之和. 对于题目中
  $
    (e^(1 + 2n pi i))^(1 + 2n pi i) = e^(1 + 2n pi i)
  $
  这一步中等价关系并不成立, 左侧的 $e^(1 + 2n pi i)$ 在此处的辐角应当取为 $2 n pi$, 从而在复数幂计算中的分支应当取为保持幂律 $(z^a)^b = z^(a b)$ 的分支, 即
  $
    (e^(1 + 2n pi i))^(1 + 2n pi i) = e^(1 + 4n pi i - 4n^2 pi^2)
  $
]

#pagebreak()

#prob[
  找出下列多值函数的分支点, 并讨论 $z$ 统一个分支点移动一周回到原处后函数值的变化. 如果同时绕两个, 三个, 乃至更多个分支点一周, 函数值又如何变化? 欢迎有兴趣的同学做成动画展示

  #grid(columns: (50%, 50%), row-gutter: 1em)[
    1. $z + sqrt(1 - z^3);$
  ][
    2. $root(3, 1 - z^3);$
  ]
][
  = <8.1>
  分支点有
  $
    z_1 = 1, z_2 = omega, z_3 = omega^2, z_4 = oo, wide "where" omega = e^(i (2 pi) / 3)
  $
  显然对于分支点 $z = 1$ 附近有
  $
    z + sqrt(1 - z^3) = z + sqrt(omega - z) sqrt(omega^2 - z) sqrt(1 - z), wide "where" omega = e^(i (2 pi) / 3)
  $
  绕 $z = 1$ 一周后 $sqrt(1 - z)$ 获得 $pi$ 的辐角, 即
  $
    z + sqrt(1 - z^3) => z + sqrt(1 - z^3) e^(i pi) = z - sqrt(1 - z^3)
  $
  若绕 $n$ 个分支点一周, 则有 $n$ 个根式因子获得 $pi$ 的辐角, 因此
  $
    z + sqrt(1 - z^3) => z + sqrt(1 - z^3) e^(i n pi) = z + (-1)^n sqrt(1 - z^3)
  $

  =
  分支点有
  $
    z_1 = 1, z_2 = omega, z_3 = omega^2, wide "where" omega = e^(i (2 pi) / 3)
  $
  同 @8.1 有
  $
    root(3, 1 - z^3) = root(3, omega - z) root(3, omega^2 - z) root(3, 1 - z), wide "where" omega = e^(i (2 pi) / 3)
  $
  绕 $n$ 个分支点一周, 则有 $n$ 个根式因子获得 $2 / 3 pi$ 的辐角, 因此
  $
    root(3, 1 - z^3) => root(3, 1 - z^3) e^(i (2 n pi) / 3) = root(3, 1 - z^3) e^(
      i 2 pi / 3
    )^n = omega^n root(3, 1 - z^3)
  $
  其中 $omega = e^(i (2 pi) / 3)$
]

#prob[
  规定 $0 <= arg z < 2 pi$, 求 $w = sqrt(z)$ 在 $z = -i$ 处的导数值. 如果规定 $-pi <= arg z < pi$, 那么 $w = sqrt(z)$ 在 $z = -i$ 处的导数值又是多少?
][
  由定义 $sqrt(z) = e^(1/2 ln z)$, 导函数为
  $
    w' = 1 / 2 1 / z e^(1 / 2 ln z) = w / (2 z)
  $
  因此在 $0 <= arg z < 2 pi$ 时
  $
    w(- i) = e^(i (3 pi) / 4) = (-1 + i) / sqrt(2), w'(- i) = - (1 + i) / (2 sqrt(2))
  $
  在 $-pi <= arg z < pi$ 时
  $
    w(- i) = e^(- i pi / 4) = (1 - i) / sqrt(2), w'(- i) = (1 + i) / (2 sqrt(2))
  $
]

#prob[
  #grid(columns: (50%, 50%))[
    已知多值函数 $w = z root(3, z - 2)$, 如右图作割线, 规定在割线上岸宗量 $z - 2$ 的辐角为 0, 试求在割线下岸 $z = 3$ 处的 $w$ 的数值.

    又问：这个多值函数有几个单值分支? 求出在其他几个单值分支中割线下岸 $z = 3$ 处的 $w$ 值.

    若规定 $w(1) = 1 / 2 - i sqrt(3) / 2$, 求这时的 $w(3) = ?$. 这相当于上面哪个单值分支?
  ][
    #figure(image("fig/10.png"), caption: [])
  ]
][
  割线下岸的 $z - 2$ 的辐角为 $2 pi$, 因此
  $
    w = 3 root(3, 3 - 2) e^(i (2 pi) / 3) = 3 e^(i (2 pi) / 3) = -3 / 2 + 3 / 2 sqrt(3) i
  $
  由于根式为 $3$ 次, 显然有 $3$ 个单值分支, 割线上岸 $z - 2$的辐角分别为 $0$, $2 pi$, $4 pi$, 因此在割线下岸 $z = 3$ 处的 $w$ 的数值分别为
  $
    w_0 =& 3 root(3, 3 - 2) e^(i (2 pi) / 3) = 3 e^(i (2 pi) / 3) = -3 / 2 + 3 / 2 sqrt(3) i \
    w_1 =& 3 root(3, 3 - 2) e^(i (4 pi) / 3) = 3 e^(i (4 pi) / 3) = -3 / 2 - 3 / 2 sqrt(3) i \
    w_2 =& 3 root(3, 3 - 2) e^(i (6 pi) / 3) = 3 e^(i (6 pi) / 3) = 3
  $
  若 $w(1) = 1 / 2 - i sqrt(3) / 2$, 则可知此时 $arg (z - 2) = 3 arg w(1) = - pi$, 因此上岸的 $z - 2$ 的辐角为 $- 2 pi$, 故
  $
    w(3) = w_2 = 3
  $
]
