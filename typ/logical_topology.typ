#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge


#let bent-edge(from, to, ..args) = {
  let midpoint = (from, 50%, to)
  let vertices = (
    from,
    (from, "|-", to),
    (midpoint, "|-", to),
    to
  )
  edge(..vertices, "-|>", ..args)
}
#align(center)[
#diagram(
  node-stroke: .5pt,
  node-shape: rect,
  edge-corner-radius: 5pt,
  spacing: (10pt, 20pt),

  // Nodes
  node((0  ,1), [*Server 1* #linebreak() 10.10.1.1], name: <serv1>),
  node((1.5,2), [*Strona WWW*], name: <www>),
  node((1.5,3), [*Net-Boot*], name: <netboot>),
  node((-1 ,2), [*Onion*], name: <onion>),
  node((-1 ,3), [*Matrix*], name: <matrix>),
  node((3  ,1), [*Server 2* #linebreak() 10.10.1.2], name: <serv2>),
  node((4.5,2), [*Domena*], name: <domena>),
  node((4.5,3), [*Stary Matrix*], name: <old-matrix>),



  //Edges
  bent-edge(<serv1>, <www>),
  bent-edge(<serv1>, <netboot>),
  bent-edge(<serv1>, <onion>),
  bent-edge(<serv1>, <matrix>),

  bent-edge(<serv2>, <domena>),
  bent-edge(<serv2>, <old-matrix>),
)
]
// ]
