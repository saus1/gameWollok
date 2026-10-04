import wollok.game.*
import ladrillos.*
import movimiento.*

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
