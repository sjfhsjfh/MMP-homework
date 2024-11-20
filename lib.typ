#import "@preview/ichigo:0.2.0"

#let config(name) = (
  doc => {
    show: ichigo.config.with(
      ..yaml("./info.yml"),
      serial-str: name,
      theme-name: "sketch",
    )
    set text(lang: "zh")
    set par(leading: 1em)
    set enum(numbering: "(1i)")
    show enum: it => {
      show math.equation.where(block: true): block.with(width: 100%)
      it
    }
    doc
  }
)

#let sub(columns: 2, ..probs) = grid(
  columns: (1fr,) * columns,
  row-gutter: 1.8em,
  ..probs
)

#import ichigo: prob