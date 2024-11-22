#import "../lib.typ": config, prob

#import "@preview/physica:0.9.3": eval

#show: config("第五周作业")

#set figure(caption: [])

#let Re = math.op("Re")
#let Im = math.op("Im")

#prob[
  求下列多值函数在指定点 $z = 1$, $i$, $-1$, $(1 + i)$ 的全部可能取值:
  #grid(columns: (1fr,) * 2)[
    1. $z^i$,
  ][
    2. $ln(z^i)$
  ]
][
  #set table(
    columns: 5,
    column-gutter: 0.5em,
    row-gutter: 0.5em,
    stroke: none,
  )
  =
  $
    z^i = e^(i ln z) = e^(i ln |z| - arg z - 2 k pi), wide "where" k in ZZ
  $

  #figure(
    table(
      table.vline(x: 1),
      $z$, $1$, $i$, $-1$, $(1 + i)$,
      $z^i$, $e^(-2 k pi)$, $e^(-pi / 2 - 2 k pi)$, $e^(- pi - 2 k pi)$, $e^(i 1 / 2 ln 2-pi / 4 - 2 k pi)$,
    ),
    caption: none,
  )
  其中 $k in ZZ$.

  =
  $
    ln(z^i) = ln (
      e^(i ln |z| - arg z - 2 k pi)
    ) + 2 k' pi i = i ln abs(z) - arg z - 2 k pi + 2 k' pi i, wide "where" k, k' in ZZ
  $

  #figure(
    table(
      table.vline(x: 1),
      $z$, $1$, $i$, $-1$, $(1 + i)$,
      $ln(z^i)$, $2 pi (-k + k' i)$, $2 pi (-k + k' i - 1 / 4)$, $2 pi (-k + k' i - 1 / 2)$, $2 pi (
          -k + k' i - 1 / 8
        ) + i / 2 ln 2$,
    ),
    caption: none,
  )
  其中 $k, k' in ZZ$.
]

#prob[
  已知 $f(z) = sqrt(1 - 4z^2) + ln frac(1 + 2z, 1 - 2z)$, 规定 $f(0) = -1 + 4pi i$, 求 $f(3)$.

  1. 若沿下图中的路径 $C_1$ 从 $z = 0$ 点到达 $z = 3$ 点;

  2. 若沿下图中的路径 $C_2$ 从 $z = 0$ 点到达 $z = 3$ 点.

  #set image(width: 75%)
  #figure(
    grid(
      columns: (1fr, 1fr),
      column-gutter: 2em,
      image("fig/2-1.png"), image("fig/2-2.png"),
    ),
  )
  #pagebreak()
][
  设 $g(z) = sqrt(1 - 4 z^2) = sqrt(1 + 2 z) sqrt(1 - 2 z)$, $h(z) = ln (1 + 2 z) / (1 - 2 z) = ln (z + 1 / 2) - ln (- z + 1 / 2)$, 则 $f(z) = g(z) + h(z)$. 规定 $g(0) = -1$, 则 $h(0) = 4 pi i$

  =
  沿 $C_1$ 有 $g(3) = i sqrt(35)$, $h(3) = ln 7 / 5 + 5 pi i$, 故 $f(3) = i sqrt(35) + ln 7 / 5 + 7 pi i$.

  =
  沿 $C_2$ 有 $g(3) = -i sqrt(35)$, $h(3) = ln 7 / 5 + 3 pi i$, 故 $f(3) = -i sqrt(35) + ln 7 / 5 + 3 pi i$.
]

#prob[
  已知 $w = ln(1 - z^2)$, 规定 $w(0) = 0$, 试讨论当沿图中 (a) 和 (b) 中的 $w(3)$ 值. 若作割线如图 (c), 则在割线上, 下岸 $z = 3$ 处 $w$ 又取何值？

  #figure({
    set figure(supplement: [], numbering: none)
    grid(
      columns: (1fr,) * 3,
      column-gutter: 1em,
      figure(image("fig/3-a.png"), caption: "(a)"),
      figure(image("fig/3-b.png"), caption: "(b)"),
      figure(image("fig/3-c.png"), caption: "(c)"),
    )
  })
][
  显然 $w(z) = ln((1 + z)(1 - z))$, 注意到对于三种情形的割线, $arg(1 + z)$ 在 $z = 0$ 处与 $z = 3$ 相同

  =
  $
    Delta arg (1 - z) = pi => w(3) = ln 8 + pi i
  $

  =
  $
    Delta arg (1 - z) = - pi => w(3) = ln 8 - pi i
  $

  =
  上岸同 (b) 有
  $
    Delta arg (1 - z) = - pi => w(3) = ln 8 - pi i
  $
  下岸同 (a) 有
  $
    Delta arg (1 - z) = pi => w(3) = ln 8 + pi i
  $
]

#pagebreak()

#prob[
  #grid(
    columns: (auto, 20%),
    column-gutter: 1em,
  )[
    反正切 $arctan z$ 的定义为
    $
      arctan z = frac(1, 2i) ln frac(1 + i z, 1 - i z)
    $

    若作割线如右图, 并规定
    $
      eval(arctan z)_(z=0) = pi,
    $
    求函数在 $z = 2$ 处的函数值和导数值. 此时当 $z -> oo$ 时, $arctan z$ 的极限存在吗？若存在, 极限值是多少？

    如果换一种割线作法, 沿虚轴连接 $z = i pi$, 在 $z = -i$ 处作割线, 规定函数在 $z = 2$ 处的函数值也上面求到的值, 新割线作法下, 当 $z -> oo$ 时, $arctan z$ 的极限存在吗？若存在, 极限值是多少？
  ][
    #figure(
      image("fig/4.png"),
    )
  ]
][
  函数值为
  $
    forall z in RR, w(z) = arctan z + eval(arctan z)_(z = 0) = arctan z + pi \
    => arctan 2 = pi + arctan 2
  $
  其中后者为实数中定义的反正切函数值, 导数有
  $
    (arctan z)' = 1 / (1 + z^2), wide z = 2 => 1 / (1 + z^2) = 1 / 5
  $
  极限值存在, 显然有
  $
    Delta arg(1 + i z) = theta + pi / 2, Delta arg(1 - i z) = theta - pi / 2
  $
  从而有
  $
    lim_(z -> oo) arctan z = pi / 2 + eval(arctan z)_(z = 0) = 3 pi / 2
  $
  若换题目中所述的割线作法, 则两分支点并没有通过无穷远点连接, 对于不同位置的 $z -> oo$ 极限不同 (例如 $z = i r, r -> oo$ 和 $z = -i r, r -> oo$).
]

#prob[
  试按给定的路径计算下列积分:

  1. $integral_(0)^(2 + i) Im z dif z$, 积分路径为:
    #grid(columns: (1fr,) * 2)[
      1. 线段 $[0, 2]$ 和 $[2, 2 + i]$ 组成的折线;
    ][
      2. 线段 $z = (2 + i)t$, $0 <= t <= 1$.
    ]

  2. $integral_C (dif z) / sqrt(z)$, 规定 $eval(sqrt(z))_(z = 1) = 1$, 积分路径为由 $z = 1$ 出发的:
    #grid(columns: (1fr,) * 2)[
      1. 逆时针单位圆周;
    ][
      2. 顺时针单位圆周.
    ]

  #pagebreak()
][
  #set enum(numbering: "(i)")
  =
  #grid(columns: (1fr,) * 2)[
    1. 显然 $[0, 2]$ 上 $Im z = 0$, $[2, 2 + i]$ 上有 $z = 2 + i y$
      $
        "原式" =& integral_(0)^(2) y dif (2 + i y) \
        =& i integral_(0)^(2) y dif y \
        =& 2 i
      $
  ][
    2. 由 $z = (2 + i)t$, $0 <= t <= 1$ 有
      $
        "原式" =& integral_(0)^(1) Im (2 + i t) dif (2 + i t) \
        =& i integral_(0)^(1) t dif t \
        =& 1 / 2 i
      $
  ]

  =
  #grid(columns: (1fr,) * 2)[
    1. 逆时针单位圆周上有 $z = e^(i theta)$, $0 <= theta <= 2 pi$, 则
      $
        "原式" =& integral_0^(2 pi) e^(-i theta / 2) dif e^(i theta) \
        =& 2 integral_0^(2 pi) dif e^(i theta / 2) \
        =& -4
      $
  ][
    2. 顺时针单位圆周上有 $z = e^(i theta)$, $0 <= theta <= 2 pi$, 则
      $
        "原式" =& integral_0^(2 pi) e^(i theta / 2) dif e^(-i theta) \
        =& 2 integral_0^(2 pi) dif e^(-i theta / 2) \
        =& -4
      $
  ]
]

#prob[
  计算下列积分:
  #grid(columns: (1fr,) * 2,
    row-gutter: 1em)[
    1. $integral.cont.ccw_(abs(z) = 1) (dif z) / z$;
  ][
    2. $integral.cont.ccw_(abs(z) = 1) abs(dif z) / z$;
  ][
    3. $integral.cont.ccw_(abs(z) = 1) (dif z) / abs(z)$;
  ][
    4. $integral.cont.ccw_(abs(z) = 1) abs((dif z) / z)$.
  ]
][
  #grid(columns: (1fr,) * 2)[
    =
    $
      "原式" =& integral_0^(2 pi) e^(-i theta) dif e^(i theta) \
      =& integral_0^(2 pi) i dif theta \
      =& 2 pi i
    $
  ][
    =
    $
      "原式" =& integral_0^(2 pi) e^(-i theta) abs(dif e^(i theta)) \
      =& integral_0^(2 pi) e^(-i theta) dif theta \
      =& 0
    $
  ][
    =
    $
      "原式" =& integral.cont.ccw_(abs(z) = 1) dif z \
      =& 0
    $
  ][
    =
    $
      "原式" =& integral.cont.ccw_(abs(z) = 1) abs(dif z) \
      =& integral_0^(2 pi) abs(i) dif theta \
      =& 2 pi
    $
  ]
]
