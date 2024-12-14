#import "../lib.typ": *

#import "@preview/physica:0.9.3": eval

#show: config("第六周作业")

#prob[
  计算下列积分:

  1. $display(integral.cont.ccw_(C) 1 / (z^2 - 1) sin (pi z) / 4 dif z)$, $C$ 分别为:
    #grid(
      columns: (1fr,) * 2,
      row-gutter: 1em
    )[
      1. $abs(z) = 1 / 2$;
    ][
      2. $abs(z - 1) = 1$;
    ][
      3. 心形曲线 $r = 2 (1 - sin theta)$;
    ][
      4. $abs(z) = R, R -> oo$;
    ]

  2. $display(integral.cont.ccw_(C) 1 / (z^2 + 1) e^(i z) dif z)$, $C$ 分别为:
    #grid(
      columns: (1fr,) * 2,
      row-gutter: 1em
    )[
      1. $abs(z - i) = 1$;
    ][
      2. $abs(z) = 2$;
    ][
      3. $abs(z + i) + abs(z - i) = 2 sqrt(2)$;
    ][
      4. 闭合曲线 $r = 3 - sin^2 theta / 4$;
    ]
][
  1. 复平面上有限远处仅有 $z = plus.minus 1$ 两个奇点, 留数分别为 $eval(1 / (z + 1) sin (pi z) / 4)_(z = 1) = sqrt(2) / 4$ 和 $eval(1 / (z - 1) sin (pi z) / 4)_(z = -1) = sqrt(2) / 4$, 根据留数定理:
    #grid(
      columns: (1fr,) * 2,
      row-gutter: 1em
    )[
      1. $0$;
    ][
      2. $2 pi i (sqrt(2) / 4) = pi sqrt(2) / 2 i$;
    ][
      3. $2 pi i (sqrt(2) / 4 + sqrt(2) / 4) = pi sqrt(2) i$;
    ][
      4. 同 3. 有 $2 pi i (sqrt(2) / 4 + sqrt(2) / 4) = pi sqrt(2) i$;
    ]
]

#show math.equation.where(block: true): block.with(width: 100%)

#prob[
  计算下列积分:
  #show enum: it => {
    set align(horizon)
    show math.equation: eq => {
      box(math.display(eq), inset: 0.2em, baseline: 40%)
    }
    it
  }
  #grid(
    columns: (1fr,) * 2,
    row-gutter: 1em
  )[
    1. $integral.cont.ccw_(abs(z) = 2) (cos z) / z dif z$;
  ][
    2. $integral.cont.ccw_(abs(z) = 2) (z^2 - 1) / (z^2 + 1) dif z$;
  ][
    3. $integral.cont.ccw_(abs(z) = 2) (sin(e^z)) / (z) dif z$;
  ][
    4. $integral.cont.ccw_(abs(z) = 2) (e^z) / (cosh z) dif z$;
  ][
    5. $integral.cont.ccw_(abs(z) = 2) (sin z) / z^2 dif z$;
  ][
    6. $integral.cont.ccw_(abs(z) = 2) (cosh z) / e^z dif z$;
  ]
][
  #grid(
    columns: (1fr,),
    row-gutter: 1em
  )[
    1. 被积函数在 $abs(z) = 2$ 内只有 $z = 0$ 一个奇点, 留数为 $eval(cos z)_0 = 1$, 根据留数定理:
      $
        integral.cont.ccw_(abs(z) = 2) (cos z) / z dif z = 2 pi i
      $
  ][
    2. 被积函数在 $abs(z) = 2$ 内只有 $z = plus.minus i$ 两个奇点, 留数分别为 $eval((z^2 - 1) / (z + i))_(z = i) = i$ 和 $eval((z^2 - 1) / (z - i))_(z = -i) = -i$, 根据留数定理:
      $
        integral.cont.ccw_(abs(z) = 2) (z^2 - 1) / (z^2 + 1) dif z = 2 pi i (i - i) = 0
      $
  ][
    3. 被积函数在 $abs(z) = 2$ 内只有 $z = 0$ 一个奇点, 留数为 $eval(sin(e^z))_0 = sin 1$, 根据留数定理:
      $
        integral.cont.ccw_(abs(z) = 2) (sin(e^z)) / (z) dif z = 2 pi i sin 1
      $
  ][
    4. 被积函数在 $abs(z) = 2$ 内只有 $z = plus.minus pi / 2 i$ 两个奇点, 留数分别为 $lim_(z -> pi / 2 i) (e^z) / (cosh z) (z - pi / 2 i) = e^(pi / 2 i) / sinh(pi / 2 i) = 1$ 和 $lim_(z -> -pi / 2 i) (e^z) / (cosh z) (z + pi / 2 i) = e^(-pi / 2 i) / sinh(-pi / 2 i) = 1$, 根据留数定理:
      $
        integral.cont.ccw_(abs(z) = 2) (e^z) / (cosh z) dif z = 2 pi i (1 + 1) = 4 pi i
      $
  ][
    5. 被积函数在 $abs(z) = 2$ 内只有 $z = 0$ 一个奇点, 留数为 $lim_(z -> 0) (sin z) / z^2 z = 1$, 根据留数定理:
      $
        integral.cont.ccw_(abs(z) = 2) (sin z) / z^2 dif z = 2 pi i
      $
  ][
    6. 被积函数在 $abs(z) = 2$ 内无奇点, 根据留数定理:
      $
        integral.cont.ccw_(abs(z) = 2) (cosh z) / e^z dif z = 0
      $
  ]
]

#prob[
  计算下列积分:

  1. $f(z) = integral.cont.ccw_(abs(zeta) = 2) ( (zeta^ast)^( 2 ) e^( zeta ) ) / ( zeta - z ) dif zeta$, 其中 $zeta^ast$ 是复数 $zeta$ 的复共轭, $z$ 是复数且 $abs(z) != 2$

  2. $integral.cont.ccw_(abs(z) = 1) ln ( 1 + 2 z ) / ( 1 - 2 z ) ( d z ) / ( z + 2 )$, 沿实轴从 $- 1 / 2$ 到 $1 / 2$ 作割线, 规定割线上岸 $arg (1 + 2 z) / (1 - 2 z) = 2 pi$

  #figure(
    image("fig/fig.png", width: 60%),
    caption: [第 3 (2) 题图],
  )
  #pagebreak()
][
  1. 在 $abs(zeta) = 2$ 的条件下 $zeta^ast = 4 / zeta$, 从而有
    $
      f(z) =& integral.cont.ccw_(abs(zeta) = 2) ( 16 e^( zeta ) ) / ( zeta^2 (zeta - z)) dif zeta \
      =& integral.cont.ccw_(abs(zeta) = 2) ( 16 e^( zeta ) ) / zeta 1 / z (1 / (zeta - z) - 1 / zeta) dif zeta \
    $
    在 $zeta = z$ 和 $zeta = 0$ 处分别有留数 $- 16 / z^2$ 和 $16 / z$, 因此
    $
      f( z ) = cases(
        (32 pi i) / z\, wide & abs(z) > 2,
        (32 pi i) / z - (32 pi i) / z^2\, wide & abs(z) < 2 且 z != 0,
        0\, wide & z = 0
      )
    $

  2. 在 $abs(z) = 1$ 以内, 割线以外的区域内无奇点, 因此
    $
      integral.cont.ccw_(abs(z) = 1) ln ( 1 + 2 z ) / ( 1 - 2 z ) ( d z ) / ( z + 2 ) =& integral_(- 1 / 2)^(1 / 2) ln ( 1 + 2 ( x + 0^- i )) / ( 1 - 2 (x + 0^- i)) ( d x ) / ( x + 2 ) + integral_(1 / 2)^(- 1 / 2) ln ( 1 + 2 (x + 0^+ i)) / ( 1 - 2 ( x + 0^+ i )) ( d x ) / ( x + 2 ) \
      =& 4 pi ln (5 slash 2) / (3 slash 2) + 2 pi ln (3 slash 2) / (5 slash 2) \
      =& 2 pi ln 5 / 3
    $
]
