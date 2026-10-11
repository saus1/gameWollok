import wollok.game.*

      
object aleatorio {
  method elegir(opciones) = opciones.get(
    0.randomUpTo(opciones.size() - 1)
  )
}





object izquierda {
  method siguiente(posicion) = posicion.left(1)
  
  method orientacionDesde(orientacionActual) = self
  
  method imagen() = "bomberman_izquierda.png"
}

object derecha {
  method siguiente(posicion) = posicion.right(1)
  
  method orientacionDesde(orientacionActual) = self
  
  method imagen() = "bomberman_derecha.png"
}

object arriba {
  method siguiente(posicion) = posicion.up(1)
  
  // al subir o bajar sigue mirando para el mismo lado
  method orientacionDesde(orientacionActual) = orientacionActual
}

object abajo {
  method siguiente(posicion) = posicion.down(1)
  
  method orientacionDesde(orientacionActual) = orientacionActual
}

object tablero {
  method estaDentro(posicion) = posicion.x().between(
    0,
    game.width() - 1
  ) && posicion.y().between(0, game.height() - 1)
}