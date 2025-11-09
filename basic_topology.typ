#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge


#let bent-edge(from, to, ..args) = {
  let midpoint = (from, 50%, to)
  let vertices = (
    from,
    (from, "|-", midpoint),
    (midpoint, "-|", to),
    to,
  )
  edge(..vertices, "-|>", ..args)
}

#align(center)[
#diagram(
  node-stroke: .5pt,
  edge-corner-radius: 5pt,
  spacing: (10pt, 20pt),

  // Nodes
  node((2.5,0), [*Router*], name: <router>),
  node((0.5,1), [*Serverownia 1*], name: <serv1>),
  node((2.5,1), [*Serverownia 2*], name: <serv2>),
  node((4.5,1), [*Serverownia 3*], name: <serv3>),
  node((0,2), [*Blok B*], name: <blok_b>),
  node((1,2), [*Biblioteka*], name: <biblioteka>),
  node((2.5,2), [*Sala Inf*], name: <sala_inf>),

  node((4,2), [*Blok A*], name: <blok_a>),
  node((5,2), [*WFisci*], name: <wfisci>),


  //Edges
  bent-edge(<router>, <serv1>),
  edge(<router>,<serv2>, "-|>"),
  bent-edge(<router>, <serv3>),
  bent-edge(<serv1>, <blok_b>),
  bent-edge(<serv1>, <biblioteka>),
  edge(<serv2>,<sala_inf>, "-|>"),
  bent-edge(<serv3>, <blok_a>),
  bent-edge(<serv3>, <wfisci>),
)
]
