#import "../lib.typ": config, prob, sub

#import "@preview/physica:0.9.3": eval

#let Res = math.op("Res")
#let Re = math.op("Re")
#let dcases(..c) = math.cases(..c.pos().map(math.display))
#let r = text(font: "Source Han Serif SC")[原式]

#show: config("第九周作业")

#prob[
  求下列函数的 Laurent 展开:
  #sub[
    1. $1 / (z^2 (z - 1))$, 在 $z = 1$ 附近展开;
  ][
    2. $1 / (z^2 (z - 1))$, 展开区域为 $1 < abs(z) < oo$.
  ][
    3. $((z - 1) (z - 2)) / ((z - 3) (z - 4))$, 展开区域为 $3 < abs(z) < 4$.
  ][
    4. $((z - 1) (z - 2)) / ((z - 3) (z - 4))$, 展开区域为 $4 < abs(z) < oo$.
  ][
    5. $1 / (1 - cos z)$ 在 $z = 2 n pi$ 附近展开(可只求出不为 $0$ 的前四项系数).
  ]
][
  + 计算
    $
      1 / (z^2 (z - 1)) - 1 / (z - 1) = - (1 + z) / z^2 = - 1 / ((z - 1) + 1)^2 - 1 / ((
        z - 1
      ) + 1) = - 2 + sum_(n = 1) (-1)^(n - 1) (n + 2) (z - 1)^n
    $
    从而有
    $
      1 / (z^2 (z - 1)) = 1 / (z - 1) - 2 + sum_(n = 1) (-1)^(n - 1) (n + 2) (z - 1)^n
    $

  + 计算
    $
      1 / (z^2 (z - 1)) + 1 / z^2 + 1 / z = 1 / (z - 1) = sum_(n = 1) z^(-n)
    $
    从而有
    $
      1 / (z^2 (z - 1)) = sum_(n = 3) z^(-n)
    $

  + 注意到
    $
      ((z - 1) (z - 2)) / ((z - 3) (z - 4)) = 1 + 6 / (z - 4) - 2 / (z - 3)
    $
    对于 $3 < abs(z) < 4$ 有
    $
      6 / (z - 4) = & - 3 / 2 sum_(n = 0) (z / 4)^n \
      2 / (z - 3) = & 2 / 3 sum_(n = 1) (z / 3)^(-n)
    $
    因此
    $
      ((z - 1) (z - 2)) / ((z - 3) (z - 4)) = - 1 / 2 - 3 / 2 sum_(n = 1) (z / 4)^n - 2 / 3 sum_(n = 1) (z / 3)^(-n)
    $

  + 同理当 $4 < abs(z) < oo$ 时
    $
      6 / (z - 4) = & 3 / 2 sum_(n = 1) (z / 4)^(-n) \
      2 / (z - 3) = & 2 / 3 sum_(n = 0) (z / 3)^(-n)
    $
    因此
    $
      ((z - 1) (z - 2)) / ((z - 3) (z - 4)) = 1 + sum_(n = 1) (3 / 2 times 4^n - 2 / 3 times 3^n) z^(-n)
    $

  + 由周期性, 分析 $z = 0$ 处展开即可
    $
      1 / (1 - cos z) = 2 / z^2 + 1 / 6 + 1 / 120 z^2 + 1 / 3024 z^4 + dots.c
    $
    因此在 $z = 2 n pi$ 附近展开有
    $
      1 / (1 - cos z) = 2 / (z - 2 n pi)^2 + 1 / 6 + 1 / 120 (z - 2 n pi)^2 + 1 / 3024 (z - 2 n pi)^4 + dots.c
    $
]
