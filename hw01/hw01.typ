#import "@preview/cetz:0.2.2": canvas, draw, plot
#import "@preview/numbly:0.1.0": numbly
#import "@preview/physica:0.9.3": pdv

#import "../lib.typ": *

#show: config("第一周作业")

#let hwprob(_, p, s, .._args) = {
  prob(p, s)
}

#hwprob[
  习题 1.
][
  由 $2 times 2$ 实矩阵组成的集合
  $
    {mat(x, y; -y, x): x in RR, y in RR}
  $
  其中矩阵之间的加法和乘法满足线性代数中介绍的通常的矩阵运算规则。证明这个集合构成一个域，且与复数域同构。
][
  观察矩阵乘法
  $
    mat(x_1, y_1; -y_1, x_1) mat(x_2, y_2; -y_2, x_2) = mat(x_1 x_2 - y_1 y_2, x_1 y_2 + x_2 y_1; -x_1 y_2 - x_2 y_1, x_1 x_2 - y_1 y_2)
  $
  可知映射
  $
    f: mat(x, y; -y, x) |-> x + i y
  $
  保证乘法，简单验证知加法亦成立，故 $f$ 是题中集合与复数域的一个同构映射。
]

#hwprob[
  习题 2.
][
  计算下列表达式的值
  #grid(
    columns: (50%,) * 2,
    align: left + horizon,
    stack(
      dir: ltr,
      [(1)],
      $
        ((1 + i) / (2 - i))^2;
      $,
    ),
    stack(
      dir: ltr,
      [(2)],
      $
        (1 + i)^n + (1 - i)^n,
      $,
      [其中 $n$ 为整数],
    ),
  )
][
  (1)
  $
    ((1 + i) / (2 - i))^2 =& (((1 + i)(2 + i)) / ((2 - i)(2 + i)))^2 \
    =& ((1 + 3i) / 5)^2 \
    =& - 8 / 25 + 6 / 25 i
  $

  (2)
  由 $1 plus.minus i = sqrt(2) e^(plus.minus i pi / 4)$ 得
  $
    (1 + i)^n + (1 - i)^n =& sqrt(2)^n e^(i n pi / 4) + sqrt(2)^n e^(-i n pi / 4) \
    =& 2^(n slash 2 + 1) cos((n pi) / 4) \
    =& cases(
      2^(n slash 2 + 1)\, quad & n = 0 mod 8,
      2^((n + 1) slash 2)\, quad & n = 1 mod 8,
      0\, quad & n = 2 mod 8,
      - 2^((n + 1) slash 2)\, quad & n = 3 mod 8,
      - 2^(n slash 2 + 1)\, quad & n = 4 mod 8,
      - 2^((n + 1) slash 2)\, quad & n = 5 mod 8,
      0\, quad & n = 6 mod 8,
      2^((n + 1) slash 2)\, quad & n = 7 mod 8,
    )
  $
]

#hwprob[
  习题 3.
][
  写出下列复数的实部、虚部、模和辐角：
  $
    1 - cos alpha + i sin alpha, 0 <= alpha < 2 pi
  $
][
  - 实部：$1 - cos alpha$

  - 虚部：$sin alpha$

  - 模：$sqrt((1 - cos alpha)^2 + sin^2 alpha) = sqrt(2 - 2 cos alpha) = 2 |sin(alpha / 2)|$

  - 辐角：$arctan((sin alpha) / (1 - cos alpha)) = pi / 2 - alpha / 2$
]

#hwprob[
  习题 4.
][
  把下列关系用几何图形表示出来

  #set enum(numbering: "(1)")

  + $1 < "Im" z < 2$

  + $0 < arg(1 - z) < pi / 4$

  + $|z - a| = |z - b|$，$a$，$b$ 为常数

  + $|z - a| + |z - b| = c$，这里 $a$，$b$，$c$ 均为常数，$c > |a - b|$
][
  #let style = (stroke: black, fill: rgb("#5d9bff4b"))
  #let size = (5,) * 2

  #grid(
    columns: (45%,) * 2,
    column-gutter: 5%,
    row-gutter: 3em,
    figure(
      canvas({
        plot.plot(
          size: size,
          y-min: 0,
          y-max: 3,
          x-tick-step: 0.5,
          y-tick-step: 0.5,
          {
            plot.add-fill-between(
              style: style,
              domain: (-1.5, 1.5),
              x => 1,
              x => 2,
            )
          },
        )
      }),
      caption: [(1) 题图],
    ),
    figure(
      canvas({
        plot.plot(
          size: size,
          y-min: -1.5,
          y-max: 1.5,
          x-min: -1.5,
          x-max: 1.5,
          x-tick-step: 0.5,
          y-tick-step: 0.5,
          {
            plot.add-fill-between(
              style: style,
              domain: (-1.5, 1),
              x => 0,
              x => calc.tan(calc.pi / 4) * (x - 1),
            )
          },
        )
      }),
      caption: [(2) 题图],
    ),
    figure(
      canvas({
        let a = (0.4, 0.1)
        let b = (-0.1, 0.2)
        let (k, x0, y0) = (
          -(a.at(0) - b.at(0)) / (a.at(1) - b.at(1)),
          (a.at(0) + b.at(0)) / 2,
          (a.at(1) + b.at(1)) / 2,
        )
        plot.plot(
          size: size,
          name: "plot",
          y-min: -1.5,
          y-max: 1.5,
          x-min: -1.5,
          x-max: 1.5,
          x-tick-step: 0.5,
          y-tick-step: 0.5,
          {
            plot.add-anchor("a", a)
            plot.add-anchor("b", b)
            plot.add(
              (a, b),
              mark: "*",
              style: (stroke: (dash: "dotted")),
            )
            plot.add(
              style: style,
              domain: (-1.5, 1.5),
              x => k * (x - x0) + y0,
            )
          },
        )
        draw.content("plot.a", $a$, anchor: "west", padding: .2)
        draw.content("plot.b", $b$, anchor: "east", padding: .2)
      }),
      caption: [(3) 题图],
    ),
    figure(
      canvas({
        let a = (0.4, -0.1)
        let b = (-0.6, 0.2)
        let c = 2
        let (k, x0, y0) = (
          -(a.at(0) - b.at(0)) / (a.at(1) - b.at(1)),
          (a.at(0) + b.at(0)) / 2,
          (a.at(1) + b.at(1)) / 2,
        )
        plot.plot(
          size: size,
          name: "plot",
          y-min: -1.5,
          y-max: 1.5,
          x-min: -1.5,
          x-max: 1.5,
          x-tick-step: 0.5,
          y-tick-step: 0.5,
          {
            plot.add-anchor("a", a)
            plot.add-anchor("b", b)
            plot.add(
              (a, b),
              mark: "*",
              style: (stroke: none),
            )
            plot.add-contour(
              x-domain: (-1.5, 1.5),
              x-samples: 100,
              y-domain: (-1.5, 1.5),
              y-samples: 100,
              style: style,
              fill: false,
              z: (c,),
              op: "<",
              (x, y) => (
                calc.sqrt(calc.pow(x - a.at(0), 2) + calc.pow(y - a.at(1), 2)) + calc.sqrt(calc.pow(
                  x - b.at(0),
                  2,
                ) + calc.pow(y - b.at(1), 2))
              ),
            )
          },
        )
        draw.content("plot.a", $a$, anchor: "west", padding: .2)
        draw.content("plot.b", $b$, anchor: "east", padding: .2)
      }),
      caption: [(4) 题图],
    )
  )
]

#hwprob[
  习题 5.
][
  求下列序列 ${z_n}$ 的聚点和极限，如果是实数序列，则同时求出上极限和下极限：
  #grid(
    columns: (50%,) * 2,
    align: left + horizon,
    stack(
      dir: ltr,
      [(1)],
      $
        z_( n ) = (1 + ( i ) / ( n )) sin ( n pi ) / ( 6 ) ;
      $,
    ),
    stack(
      dir: ltr,
      [(2)],
      $
        z_( n ) = (1 + ( 1 ) / ( 2 n )) cos ( n pi ) / ( 3 ).
      $,
    ),
  )
][
  (1)
  $sin (n pi) / 6$ 有界，则
  $
    lim_(n -> oo) i / n sin (n pi) / 6 = 0
  $
  则原式极限不存在，聚点为 $- 1$，$- sqrt(3) / 2$，$- 1 / 2$，$0$，$1 / 2$，$sqrt(3) / 2$，$1$

  (2)
  同理 $cos (n pi) / 3$ 有界，故
  $
    lim_(n -> oo) 1 / (2 n) cos (n pi) / 3 = 0
  $
  则原式极限不存在，聚点为 $- 1$，$- 1 / 2$，$1 / 2$，$1$

  该序列为实数序列，上极限为 $1$，下极限为 $- 1$
]

#hwprob[
  习题 6.
][
  试求从坐标原点到曲线 $|z + 1 / z| = a$ 上各点的最大与最小距离。
][
  设 $z = r e^(i theta)$，则有
  $
    sqrt(r^2 + 1 / r^2 + 2 cos 2 theta) = a \
    r^2 + 1 / r^2 = a^2 - 2 cos 2 theta
  $
  由于
  $
    r^2 + 1 / r^2 >= 2,\
    2 cos 2 theta in [- 2, 2]
  $
  从而 $r_min^2, r_max^2$ 为方程
  $
    x + 1 / x = a^2 + 2
  $
  的根，即坐标原点到该曲线上各点的最大距离 $r_max$ 与最小距离 $r_min$ 为
  $
    r_max =& sqrt((a^2 + 2 + sqrt(a^4 + 4 a^2)) / 2) \
    r_min =& sqrt((a^2 + 2 - sqrt(a^4 + 4 a^2)) / 2)
  $
]

#hwprob[
  习题 7.
][
  可否适当选择常数 $A$，使得函数
  $
    f(z) = cases(
      ([op("Re")(z^2)]^2) / z^2 \, quad & z != 0,
      A \, quad & z = 0
    )
  $
  在 $z = 0$ 点连续？
][
  为求 $f(z)$ 在 $z = 0$ 处的极限，考虑 $z = r e^(i theta)$，则
  $
    ([op("Re")(z^2)]^2) / z^2 = (r^2 cos 2 theta)^2 / r^2 e^(i 2 theta) = r^2 cos^2 2 theta e^(-i 2 theta)
  $
  显然
  $
    |f(z)| = r^2 cos^2 2 theta < r^2
  $
  从而在 $z = 0$ 的去心邻域内 $|f(z) - 0| < delta^2$，其中 $delta$ 为去心邻域的半径，故
  $
    lim_(z -> 0) f(z) = 0
  $
  因此取 $A = 0$，则 $f(z)$ 在 $z = 0$ 处连续。
]

#hwprob[
  习题 8.
][
  判断下列函数在何处可导（并求出其导数），在何处解析：
  #grid(
    columns: (50%,) * 2,
    row-gutter: 1em,
    align: left + horizon,
    stack(
      dir: ltr,
      [(1)],
      $
        |z|
      $,
    ),
    stack(
      dir: ltr,
      [(2)],
      $
        z^ast
      $,
    ),
    stack(
      dir: ltr,
      [(3)],
      $
        z op("Re") z
      $,
    ),
    stack(
      dir: ltr,
      [(4)],
      $
        (x^2 + 2 y) + i (x^2 + y^2)
      $,
    ),
    stack(
      dir: ltr,
      [(5)],
      $
        3 x^2 + 2 i y^3
      $,
    ),
    stack(
      dir: ltr,
      [(6)],
      $
        (x - y)^2 + 2 i (x + y)
      $,
    ),
  )
][
  根据 Cauchy-Riemann 条件判断是否可导

  #set enum(numbering: "(1)")

  + 根据 $|z| = sqrt(x^2 + y^2)$，$u = sqrt(x^2 + y^2)$，$v = 0$，则
    $
      pdv(u, x) = x / sqrt(x^2 + y^2) = x / (|z|), quad pdv(v, y) = 0 \
      => pdv(u, x) != pdv(v, y)
    $
    故 $|z|$ 在 $CC$ 上不可导，不解析

  + 有 $z^ast = x - i y$，$u = x$，$v = - y$，则
    $
      pdv(u, x) = 1, quad pdv(v, y) = - 1 \
      => pdv(u, x) != pdv(v, y)
    $
    故 $z^ast$ 在 $CC$ 上不可导，不解析

  + 有 $z op("Re") z = x^2 + i x y$，$u = x^2$，$v = x y$，则
    $
      pdv(u, x) = 2 x, quad pdv(v, y) = x \
      => pdv(u, x) = pdv(v, y) <=> x = 0
    $
    又有
    $
      pdv(u, y) = 0, quad pdv(v, x) = y \
      => pdv(u, y) = -pdv(v, x) <=> y = 0
    $
    仅可能在 $z = 0$ 处可导，单独检查有
    $
      lim_(z -> 0) (z op("Re") z) / z = lim_(z -> 0) x = 0
    $
    故该函数仅在 $z = 0$ 处可导，在 $CC$ 上不解析

  + 验证 Cauchy-Riemann 条件，有
    $
      pdv(u, x) = 2 x, quad pdv(v, y) = 2 y \
      => pdv(u, x) = pdv(v, y) <=> x = y
    $
    又有
    $
      pdv(u, y) = 2, quad pdv(v, x) = 2 x \
      => pdv(u, y) = -pdv(v, x) <=> x = -1
    $
    仅可能在 $z = -1 - i$ 处可导，单独检查有
    $
      & lim_(rho -> 0) (((1 + rho cos theta)^2 + 2 (1 + rho sin theta)) + i ( (1 + rho cos theta)^2 + (1 + rho sin theta)^2 ) - (3 + 2 i)) / (rho e^(i theta)) \
      =& lim_(rho -> 0) (2 cos theta + 2 sin theta + 2 i cos theta + 2 i sin theta) e^(-i theta) \
      =& 2 (1 + i) lim_(rho -> 0) (cos theta + sin theta) e^(-i theta)
    $
    与 $theta$ 有关，故该函数在 $CC$ 上不可导，不解析

  + 验证 Cauchy-Riemann 条件，有
    $
      pdv(u, x) = 6 x, quad pdv(v, y) = 6 y^2 \
      => pdv(u, x) = pdv(v, y) <=> x = y^2 \
      pdv(u, y) = 0, quad pdv(v, x) = 0 \
      => pdv(u, y) = -pdv(v, x)
    $
    故该函数仅当 $x = y^2$ 时可导，对于 $z = (r + i) r, r in RR$ 有
    $
      & lim_(rho -> 0) (3 (r^2 + rho cos theta)^2 + 2 i (r + rho sin theta)^3 - (3 r^4 + 2 i r^3)) / (rho e^(i theta)) \
      =& lim_(rho -> 0) (6 r^2 cos theta + 6 i r^2 sin theta) e^(-i theta) \
      =& 6 r^2 (cos theta + i sin theta) e^(-i theta) = 6 r^2
    $
    上式与 $theta$ 无关，为 $6 r^2$

    故该函数仅在 $z = (r + i) r, r in RR$ 处可导，导数为 $6 r^2$，在 $CC$ 上不解析

  + 验证 Cauchy-Riemann 条件，有
    $
      pdv(u, x) = 2 (x - y), quad pdv(v, y) = 2 \
      => pdv(u, x) = pdv(v, y) <=> x = y + 1 \
      pdv(u, y) = -2 (x - y), quad pdv(v, x) = 2 \
      => pdv(u, y) = -pdv(v, x) <=> x = y + 1
    $
    故该函数仅当 $x = y + 1$ 时可导，对于 $z = 1 + (1 + i) r, r in RR$ 有
    $
      & lim_(rho -> 0) ((1 + rho cos theta - rho sin theta)^2 + 2 i (1 + 2 r + rho cos theta + rho sin theta) - ( 1 + 2 i (1 + 2 r) )) / (rho e^(i theta)) \
      =& lim_(rho -> 0) (2 cos theta - 2 sin theta + 2 i cos theta + 2 i sin theta) e^(-i theta) \
      =& 2 (1 + i) lim_(rho -> 0) (cos theta + i sin theta) e^(-i theta) = 2 (1 + i)
    $
    与 $theta$ 无关，故该函数仅在 $z = 1 + (1 + i) r, r in RR$ 处可导，导数为 $2 (1 + i)$，在 $CC$ 上不解析
]

#hwprob[
  习题 9.
][
  证明平面极坐标系 $(rho, phi)$ 下的 Cauchy-Riemann 方程：
  $
    pdv(u, rho) = 1 / rho pdv(v, phi), quad pdv(v, rho) = - 1 / rho pdv(u, phi)
  $
][
  由 $z = rho e^(i phi) = x + i y$，$f(z) = u + i v$，有全微分
  $
    dif u = pdv(u, x) dif x + pdv(u, y) dif y = pdv(u, rho) dif rho + pdv(u, phi) dif phi \
    dif v = pdv(v, x) dif x + pdv(v, y) dif y = pdv(v, rho) dif rho + pdv(v, phi) dif phi \
    vec(dif rho, dif phi) = (diff (rho, phi)) / (diff (x, y)) vec(dif x, dif y)
  $
  计算 Jacobi 矩阵
  $
    (diff (rho, phi)) / (diff ( x, y )) = mat(pdv(rho, x), pdv(rho, y); pdv(phi, x), pdv(phi, y)) = mat(cos phi, sin phi; - (sin phi) / rho, (cos phi) / rho)
  $
  得到
  $
    pdv(, x) = pdv(, rho) cos phi - (sin phi) / rho pdv(, phi), quad pdv(, y) = pdv(, rho) sin phi + (cos phi) / rho pdv(, phi) \
  $
  从而可将 Cauchy-Riemann 方程
  $
    pdv(u, x) = pdv(v, y), quad pdv(u, y) = - pdv(v, x)
  $
  转化为
  $
    pdv(u, rho) cos phi - (sin phi) / rho pdv(u, phi) = pdv(v, rho) sin phi + (cos phi) / rho pdv(v, phi), \
    pdv(u, rho) sin phi + (cos phi) / rho pdv(u, phi) = - pdv(v, rho) cos phi + (sin phi) / rho pdv(v, phi)
  $
  联立解得
  $
    pdv(u, rho) = 1 / rho pdv(v, phi), quad pdv(v, rho) = - 1 / rho pdv(u, phi)
  $
]

#hwprob[
  习题 10.
][
  已知 $z = rho e^(i phi)$，$f(z) = u + i v$，利用平面极坐标系 $(rho, phi)$ 下的 Cauchy-Riemann 方程证明：
  $
    f'(z) = rho / z (pdv(u, rho) + i pdv(v, rho)) = 1 / z (pdv(v, phi) - i pdv(u, phi))
  $
][
  若 $z = x + i y$ 则由定义有
  $
    f'(z) = pdv(u, x) + i pdv(v, x) = - i pdv(u, y) + pdv(v, y)
  $
  由 习题 9. 中结果知
  $
    pdv(, x) = pdv(, rho) cos phi - (sin phi) / rho pdv(, phi), quad pdv(, y) = pdv(, rho) sin phi + (cos phi) / rho pdv(, phi)
  $
  结合极坐标下的 Cauchy-Riemann 方程
  $
    pdv(u, rho) = 1 / rho pdv(v, phi), quad pdv(v, rho) = - 1 / rho pdv(u, phi)
  $
  带入上式得
  $
    pdv(u, x) + i pdv(v, x) &=& f'(z) =& - i pdv(u, y) + pdv(v, y) \
    pdv(u, rho) cos phi - (sin phi) / rho pdv(u, phi) + i (pdv(v, rho) cos phi - (sin phi) / rho pdv(v, phi)) &=&=& -i ( pdv(u, rho) sin phi + (cos phi) / rho pdv(u, phi) ) + pdv(v, rho) sin phi + (cos phi) / rho pdv(v, phi) \
    (cos phi - i sin phi) / rho (pdv(v, phi) - i pdv(u, phi)) &=&=& (cos phi - i sin phi) ( pdv(u, rho) + i pdv(v, rho) ) \
    1 / z (pdv(v, phi) - i pdv(u, phi)) &=&=& rho / z (pdv(u, rho) + i pdv(v, rho))
  $
  从而证得在 $z = rho e^(i phi)$，$f(z) = u + i v$ 时
  $
    f'(z) = rho / z (pdv(u, rho) + i pdv(v, rho)) = 1 / z (pdv(v, phi) - i pdv(u, phi))
  $

]
