#import "../lib.typ": *
#import "@preview/physica:0.9.3": eval
#import "@preview/slashion:0.1.1": slash-frac as sfrac

#show: config("第十二周作业")

#show math.equation.where(block: true): set block(breakable: true)

#prob[
  #sub()[
    1. $integral_0^oo (cos x) / (1 + x^4) dif x$,
  ][
    2. $integral_(-oo)^(oo) x^(2 m) / (1 + x^(2 n)) dif x, med m, n in NN^+, n > m$,
  ][
    3. $integral_(-oo)^oo (x sin x) / (x^2 - 2 x + 2) dif x$,
  ][
    4. $integral_(-oo)^oo 1 / (1 + x^2)^(n + 1) dif x, med n in NN^+$,
  ][
    5. $integral_(-oo)^oo (dif x) / ((1 + x^2) cosh (pi x) / 2)$,
  ][
    6. $integral_0^oo (sin(a + 2 n) x - sin a x) / ((1 + x^2) sin x) dif x, med a > -1, med n in NN^+$,
  ]
][
  + 显然被积函数为偶函数，故可化为
    $
      #r = & 1 / 2 integral_(-oo)^oo (cos x) / (1 + x^4) dif x \
      = & 1 / 2 dot.c 2 pi i (Res_(z = (1 + i) / sqrt(2)) (cos z) / (1 + z^4) + Res_(z = (-1 + i) / sqrt(2)) (cos z) / (1 + z^4)) \
      = & pi / (2 sqrt(2)) (cos 1 / sqrt(2) + sin 1 / sqrt(2)) e^(-1 / sqrt(2))
    $

  + 同样利用留数定理
    $
      #r = & 2 pi i sum_(Im z > 0) Res z^(2 m) / (1 + z^(2 n)) \
      = & 2 pi i sum_(k = 0)^(n - 1) Res_(z = exp(i pi (2 k + 1) / (2 n))) z^(2 m) / (1 + z^(2 n)) \
      = & 2 pi i sum_(k = 0)^(n - 1) eval(z^(2 m - 2 n + 1) / (2 n))_(z = exp(i pi (2 k + 1) / (2 n))) \
      = & pi / (n sin(pi (2 m + 1) / (2 n)))
    $

  + 先进行转化
    $
      #r = & Im(integral_(-oo)^oo (x e^(i x)) / (x^2 - 2 x + 2) dif x) \
      = & Im(Res_(z = 1 + i) (z e^(i z)) / (z^2 - 2 z + 2)) \
      = & pi / e (cos 1 + sin 1)
    $

  // + 由被积函数解析性
  //   $
  //     #r = & lim_(delta -> 0) integral.cont.ccw_(abs(z - i) = delta) (dif z) / (1 + z^2)^(n + 1) \
  //     = & lim_(delta -> 0) integral_0^(2 pi) (delta e^(i theta) i dif theta) / (1 + (i + delta e^(i theta))^2)^(n + 1) \
  //     = & lim_(delta -> 0) integral_0^(2 pi) (delta e^(i theta) i dif theta) / (2 i delta e^(i theta) + delta^2 e^(2 i theta))^(n + 1) \
  //     = & lim_(delta -> 0) integral_0^(2 pi) (dif theta) / ((2 - i delta e^(i theta))(2 i delta e^(i theta) + delta^2 e^(2 i theta))^n)
  //   $

  + 分析 $z = i$ 处留数
    $
      1 / (1 + z^2)^(n + 1) = & 1 / ((z - i)^(n + 1) (z + i)^(n + 1)) \
      = & (z - i)^(- n - 1) 1 / ((z - i) + 2 i)^(n + 1) \
      = & (z - i)^(- n - 1) / (2 i)^(n + 1) 1 / (1 + (z - i) / (2 i))^(n + 1) \
      = & (z - i)^(- n - 1) / (2 i)^(n + 1) (dots.c + (-)^n (2 n)! / (n!)^2 ((z - i) / (2 i))^n + dots.c)
    $
    因此留数为
    $
      Res_(z = i) 1 / (1 + z^2)^(n + 1) = & (-)^n (2 n)! / (n!)^2 (2 i)^(-2 n -1) = - i 2^(-2 n - 1) (2 n)! / (n!)^2
    $
    从而
    $
      #r = & 2 pi i Res_(z = i) 1 / (1 + z^2)^(n + 1) \
      = & (pi (2 n)!) / (2^(2 n) (n!)^2)
    $

  + 分析可知半圆围道不过奇点而半径趋于无穷时，圆弧上的积分趋于 $0$，因此可求上半平面内留数和来求得积分
    $
      #r = & 2 pi i sum_(Im z > 0) Res 1 / ((1 + z^2) cosh (pi z) / 2) \
      = & 2 pi i (Res_(z = i) 1 / ((1 + z^2) cosh (pi z) / 2) + sum_(k = 1)^oo Res_(z = (2 k + 1) i) 1 / ((1 + z^2) cosh (pi z) / 2)) \
      = & 2 pi i (- i / (2 pi) + sum_(k = 1)^oo ((-)^k i) / (2 pi k (k + 1))) \
      = & 1 - (1 - 2 ln 2) \
      = & 2 ln 2
    $

  + 同理被积函数为偶函数，先化简，再利用留数定理：
    $
      #r = & 1 / 2 integral_(-oo)^oo (sin(a + 2 n) x - sin a x) / ((1 + x^2) sin x) dif x \
      = & integral_(-oo)^oo (cos (a + n) x) / (1 + x^2) (sin n x) / (sin x) dif x \
      = & Re(integral_(-oo)^oo exp(i (a + n) x) / (1 + x^2) (sin n x) / (sin x) dif x) \
      = & Re(2 pi i Res_(z = i) exp(i (a + n) x) / (1 + z^2) (sin n z) / (sin z)) \
      = & 2 pi i exp(- (a + n)) / (2 i) (sinh n) / (sinh 1) \
      = & pi e^(-a - n) (sinh n) / (sinh 1)
    $
]
