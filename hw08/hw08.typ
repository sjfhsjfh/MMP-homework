#import "../lib.typ": *

#import "@preview/physica:0.9.3": eval

#show: config("第十周作业")

#prob[
  证明级数 $sum_(n = 0)^oo (z^(n + 1) / (n + 1) - (2 z^(2 n + 3)) / (2 n  + 3))$ 的和函数在 $z = 1$ 点不连续. 这与 Abel 第二定理矛盾吗?
][
  将原级数写为标准的幂级数形式:
  $
    #r = & sum_(n = 0)^oo z^(n + 1) / (n + 1) - 2 sum_(n = 0)^oo z^(2 n + 3) / (2 n + 3) \
    =& 2 z + sum_(n = 1)^oo (-z)^n / n
  $
  该级数的和函数为 $f(z) = 2 z - ln (1 + z)$, 显然在 $z = -1$ 点不收敛, 因此原级数的收敛半径为 $1$, 因此 $z = 1$ 在收敛圆的圆周上, 该级数在 $z = 1$ 点不连续. Abel 第二定理要求级数在收敛圆内张角 $2 phi < pi$ 区域内连续, 因此该级数与 Abel 第二定理不矛盾.
]

#prob[
  将下列函数在指定点展开为 Taylor 级数, 并给出其收敛半径:
  #grid(
    columns: (50%,) * 2,
    [1. $1 / (1 + z + z^2)$, 在 $z = 0$ 展开;], [2. $sin z$, 在 $z = n pi$ 展开, $n = 0, plus.minus 1, plus.minus 2, dots.c$;],
  )
  3. $exp(1 / (1 - z))$, 在 $z = 0$ 展开(可只求前 4 项);

  + $arctan z$ 的主值, 在 $z = 0$ 展开.

  + $ln (1 + z) / (1 - z)$, 在 $z = oo$ 展开, 规定 $eval(ln (1 + z) / (1 - z))_(z = oo) = (2 k + 1) pi i$.
][
  + 设原函数展开为
    $
      f(z) = 1 / (1 + z + z^2) = sum_(n = 0)^oo a_n z^n
    $
    左右分别乘 $1 + z + z^2$, 有
    $
      1 = & sum_(n = 0)^oo a_n z^n + sum_(n = 0)^oo a_n z^(n + 1) + sum_(n = 0)^oo a_n z^(n + 2) \
      = & sum_(n = 0)^oo a_n z^n + sum_(n = 1)^oo a_(n - 1) z^n + sum_(n = 2)^oo a_(n - 2) z^n
    $
    给出 $a_0 = 1$, $a_1 = -1$, 后续递推关系为
    $
      a_n = - a_(n - 1) - a_(n - 2) forall n >= 2
    $
    特征方程 $lambda^2 + lambda + 1 = 0$ 给出 $lambda = (-1 plus.minus sqrt(3) i) / 2 = e^(plus.minus i (2 pi) / 3)$, 由 $a_0 = 1$, $a_1 = -1$ 解得通解为
    $
      a_n = - i / sqrt(3) (e^(i (2 pi) / 3 (n + 1)) + e^(-i (2 pi) / 3 (n + 1))) = 2 / sqrt(3) sin ((2 pi (n + 1)) / 3)
    $
    即展开为
    $
      1 / (1 + z + z^2) = sum_(n = 0)^oo 2 / sqrt(3) sin ((2 pi (n + 1)) / 3) z^n = sum_(n = 0)^oo ( z^(3 n) - z^(3 n + 1) )
    $

  + 由 $sin z$ 在 $z = 0$ 处展开
    $
      sin z = sum_(n = 0)^oo (-1)^n z^(2 n + 1) / (2 n + 1)!
    $
    和周期性 $sin (z + n pi) = (-1)^n sin z$ 给出展开为
    $
      sin z = sum_(m = 0)^oo (-1)^(m + n) (z - n pi)^(2 m + 1) / (2 m + 1)!
    $

  + 求导
    $
      f(z) = & exp(1 / (1 - z)) & => f(0) = & e \
      f'(z) = & 1 / (1 - z)^2 exp(1 / (1 - z)) & => f'(0) = & e \
      f''(z) = & (1 / (1 - z)^4 + 2 / (1 - z)^3) exp(1 / (1 - z)) & => f''(0) = & 3 e \
      f'''(z) = & (1 / (1 - z)^6 + 6 / (1 - z)^5 + 6 / (1 - z)^4) exp(1 / (1 - z)) & => f'''(0) = & 13 e \
      f''''(z) = & (1 / (1 - z)^8 + 12 / (1 - z)^7 + 36 / (1 - z)^6 + 24 / (1 - z)^5) exp(1 / (1 - z)) & => f''''( 0 ) = & 73 e
    $
    展开
    $
      exp(1 / (1 - z)) = e + e z + 3 / 2 e z^2 + 13 / 6 e z^3 + 73 / 24 e z^4 + dots.c
    $

  + 其导函数为 $1 / (1 + z^2)$, 展开为
    $
      1 / (1 + z^2) = sum_(n = 0)^oo (-1)^n z^(2 n)
    $
    取 $arctan z$ 主值, 则在 $z = 0$ 处展开为
    $
      arctan z = sum_(n = 0)^oo (-1)^n z^(2 n + 1) / (2 n + 1)
    $

  #pagebreak()

  5. 在 $z = oo$ 处展开即令 $w = 1 / z$, 并在 $w = 0$ 处展开
    $
      ln (1 + z) / (1 - z) = ln (1 + 1 / w) / (1 - 1 / w) = ln (- (1 + w) / (1 - w))
    $
    其导函数 $2 / (1 - w^2)$ 在 $w = 0$ 处展开为
    $
      2 / (1 - w^2) = 2 + 2 w^2 + 2 w^4 + 2 w^6 + dots.c
    $
    由于 $w = 0$ 时函数值为 $(2 k + 1) pi i$, 因此展开为
    $
      ln (- (1 + w) / (1 - w)) = (2 k + 1) pi i + sum_(n = 0)^oo 2 / (2 n + 1) w^(2 n + 1)
    $
    因此原函数在 $z = oo$ 处展开为
    $
      ln (1 + z) / (1 - z) = (2 k + 1) pi i + sum_(n = 0)^oo 2 / (2 n + 1) z^(-2 n - 1)
    $
]

#prob[
  求下列无穷级数之和, 注意给出相应的收敛区域:
  $
    sum_(n = 0)^oo sum_(m = 0)^oo sum_(k = 0)^oo (n + m + k)! / (n! m! k!) (z / 3)^(n + m + k)
  $
][
  考虑变换 $p = m + n$, 改变求和方式有
  $
    #r = & sum_(k = 0)^oo sum_(p = 0)^oo sum_(n = 0)^p (p + k)! / (n! (p - n)! k!) (z / 3)^(p + k) \
    = & sum_(k = 0)^oo sum_(p = 0)^oo (p + k)! / (p! k!) (z / 3)^(p + k) sum_(n = 0)^p binom(p, n) \
    = & sum_(k = 0)^oo sum_(p = 0)^oo (p + k)! / (p! k!) (2 / 3 z)^p (z / 3)^k
  $
  同理再令 $q = p + k$, 有
  $
    #r = & sum_(q = 0)^oo sum_(p = 0)^q q! / (p! (q - p)!) (2 / 3 z)^p (z / 3)^(q - p) \
    = & sum_(q = 0)^oo (2 / 3 z + z / 3)^q \
    = & sum_(q = 0)^oo z^q
  $
  所以原级数和为
  $
    sum_(n = 0)^oo sum_(m = 0)^oo sum_(k = 0)^oo (n + m + k)! / (n! m! k!) (z / 3)^(n + m + k) = 1 / (1 - z)
  $
  收敛要求 $n -> oo => u_n -> 0$, 因此收敛区域为 $|z| < 1$.
]

#prob[
  求下列函数(取主值分枝)在 $z = 0$ 点附近的级数展开:
  #grid(
    columns: (50%,) * 2,
    [1. $- ln (1 - z) ln (1 + z)$;], [2. $ln (1 + z^2) arctan z$;],
  )
][
  + 对于 $ln (1 plus.minus z)$ 分别展开, 有
    $
      ln(1 plus.minus z) = - sum_(n = 1)^oo (minus.plus z)^n / n
    $
    则对于二者乘积, 有
    $
      - ln (1 - z) ln (1 + z) = & sum_(n = 1)^oo sum_(m = 1)^oo - (z^n (-z)^m) / (n m) \
      = & sum_(p = 2)^oo sum_(m = 1)^(p - 1) (-)^(m + 1) z^p / (m (p - m)) \
      = & sum_(p = 2)^oo z^p sum_(m = 1)^(p - 1) 1 / 2 ((-)^(m + 1) / (m (p - m)) + (-)^(p - m + 1) / ((p - m) m))
    $
    注意到右侧求和当 $p = 2 n + 1$ 时显然为 $0$, 可写为
    $
      - ln (1 - z) ln (1 + z) = & sum_(n = 1)^oo z^(2 n) sum_(m = 1)^(2 n - 1) (-)^(m + 1) / (m (2 n - m)) \
      = & sum_(n = 1)^oo z^(2 n) / (2 n) sum_(m = 1)^(2 n - 1) (-)^(m + 1)(1 / m + 1 / (2 n - m)) \
      = & sum_(n = 1)^oo z^(2 n) / n sum_(m = 1)^(2 n - 1) (-)^(m + 1) / m
    $
    此为较简形式, 令
    $
      a_(2n) := 1 / n sum_(m = 1)^(2 n - 1) (-)^(m + 1) / m
    $
    则有
    $
      - ln (1 - z) ln (1 + z) = sum_(n = 1)^oo a_(2n) z^(2 n)
    $
    可计算前几项:
    $
      - ln (1 - z) ln (1 + z) = z^2 + 5 / 12 z^4 + 47 / 180 z^6 + dots.c
    $

  + 两者分别展开为
    $
      ln (1 + z^2) = sum_(n = 1)^oo (-1)^(n + 1) z^(2 n) / n \
      arctan z = sum_(n = 0)^oo (-1)^n z^(2 n + 1) / (2 n + 1)
    $
    则
    $
      ln (1 + z^2) arctan z = & sum_(n = 0)^oo sum_(m = 1)^oo (-1)^(m + n + 1) z^(2 m + 2 n + 1) / (m (2 n + 1)) \
      = & sum_(p = 1)^oo sum_(m = 1)^p (-1)^(p + 1) z^(2 p + 1) / (m (2 p - 2 m + 1)) \
      = & sum_(p = 1)^oo (2 z^(2 p + 1)) / (2 p + 1) (-)^(p + 1) sum_(m = 1)^(p - 1) (1 / (2 m) + 1 / (2 p - 2 m + 1)) \
      = & sum_(p = 1)^oo (2 z^(2 p + 1)) / (2 p + 1) (-)^(p + 1) sum_(n = 1)^(2 p - 1) 1 / n
    $
    令
    $
      a_(2p + 1) := (2 (-)^(p + 1)) / (2 p + 1) sum_(n = 1)^(2 p - 1) 1 / n
    $
    则有
    $
      ln (1 + z^2) arctan z = sum_(p = 1)^oo a_(2p + 1) z^(2 p + 1)
    $
    可计算前几项:
    $
      ln (1 + z^2) arctan z = z^3 - 5 / 6 z^5 + 7 / 10 z^7 - 761 / 1260 z^9 + dots.c
    $
]
