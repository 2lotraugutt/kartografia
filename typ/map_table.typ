#let mapa = csv("/mapa.tsv", delimiter: "\t");

#set table(
  stroke: none,
  gutter: -0.04em, // fix missaligment
  fill: (x, y) => {
      if y == 0 {
        navy
      } else if not calc.odd(y) {
        gray.lighten(80%)
      }
  },
  inset: (right: 1.5em),
)

#show table.cell: it => {
  if it.y == 0 {
    set text(fill: white)
    strong(it)
  } else if it.x == 0 {
    strong(it)
  } else if it.x == 1{
    it
  } else if it.x == 2{
    it
  } else if it.x == 3{
    it
  } else if it.x == 4{
    set text(font: "IBM Plex Mono", size: 9pt)
    if(it.body.text == "TRUNK") {
      set text(fill:green.darken(45%))
      strong(it)      
    } else {
      set text(fill:blue.darken(45%))
      it
    }
  } else if it.x == 5{
    emph(it)
  }
}


#table( columns: 6,
[Obszar], [Port], [Sala], [Gniazdo], [VLAN], [Komentarz],
..mapa.flatten()
)
