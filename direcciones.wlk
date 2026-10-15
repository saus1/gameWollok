import wollok.game.*

object izquierda {
  method siguiente(posicion) = posicion.left(1)
  method orientacionDesde(orientacionActual) = self
  method imagen() = "bomberman_izquierda.png"
  method imgParte() = "fuego_horizontal.png"
  method imgBorde() = "fuego_borde_izq.png"
}

object derecha {
  method siguiente(posicion) = posicion.right(1)
  method orientacionDesde(orientacionActual) = self
  method imagen() = "bomberman_derecha.png"
  method imgParte() = "fuego_horizontal.png"
  method imgBorde() = "fuego_borde_der.png"
}

object arriba {
  method siguiente(posicion) = posicion.up(1)
  method orientacionDesde(orientacionActual) = orientacionActual
  method imgParte() = "fuego_vertical.png"
  method imgBorde() = "fuego_borde_arriba.png"
}

object abajo {
  method siguiente(posicion) = posicion.down(1)
  method orientacionDesde(orientacionActual) = orientacionActual
  method imgParte() = "fuego_vertical.png"
  method imgBorde() = "fuego_borde_abajo.png"
}

// Direcciones en las que se mueve un personaje y se expande una explosion.
// Son polimorficas: todas entienden siguiente(posicion), imgParte() e imgBorde().