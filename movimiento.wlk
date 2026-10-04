import wollok.game.*
import personajes.*

object aleatorio {
  var position =game.at(8, 8)
  method position()=position

  method nuevaPosicion(){
    // calculo corrdenadas aleatorias dentro de la pantall
    const x=0.randomUpTo(game.width())
    const y=0.randomUpTo(game.height())
    position=game.at(x,y)

  }

}

// direcciones en las que se puede mover el personaje
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
  method estaDentro(posicion) =
    posicion.x().between(0, game.width() - 1) && posicion.y().between(0, game.height() - 1)
}