import wollok.game.*
import ladrillos.*
import movimiento.*

class Personaje {
  var imagen
  var property position = game.at(9, 9)

  method image() = imagen

  method mover(direccion) {
    self.moverseA(direccion.siguiente(position))
  }

  method moverseA(nuevaPosicion) {
    if (self.puedeMoverA(nuevaPosicion)) {
      position = nuevaPosicion
    }
  }

  method puedeMoverA(posicion) =
    tablero.estaDentro(posicion) &&
      !camino.posicionEstaOcupada(posicion)

  method direccionesPosibles() =
    [arriba, abajo, izquierda, derecha].filter({ direccion =>
      self.puedeMoverA(direccion.siguiente(position))
    })

  method moverAleatoriamente() {
    const opciones = self.direccionesPosibles()
    if (opciones.size() > 0) {
      self.mover(aleatorio.elegir(opciones))
    }
  }
}






object bomberman {
  var property position = game.at(1, 0)
   var orientacion = derecha
  // la imagen depende de hacia donde esta mirando
  method image() = orientacion.imagen()

  method mover(direccion) {
    orientacion = direccion.orientacionDesde(orientacion)
    self.moverseA(direccion.siguiente(position))
  }

  method moverseA(nuevaPosicion) {
    // solo se mueve si la nueva posición está dentro del tablero y no hay un ladrillo
    if (tablero.estaDentro(nuevaPosicion) && !camino.posicionEstaOcupada(nuevaPosicion)) {
      position = nuevaPosicion
    }
  }
}
