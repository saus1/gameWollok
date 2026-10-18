import wollok.game.*
import tablero.*
import direcciones.*
import escenario.*
import personajes.*
import partida.*

object inicioGame {
  method iniciar() {
    self.configurarJuego()
    self.construirEscenario()
    self.agregarPersonajes()
    self.configurarTeclas()
    self.configurarAcciones()
    game.start()
  }

  method configurarJuego() {
    game.title("Bomberman")
    game.width(15)
    game.height(11)
    game.cellSize(50)
    game.ground("fondo.png")
  }

  method construirEscenario() {
    camino.construccionCamino()
  }

  method agregarPersonajes() {
    tablero.agregar(bomberman)
    [new Enemigo(), new Enemigo()].forEach({enemigo => listaEnemigos.agregar(enemigo,camino.lugarLibreAlAzar())})
  }

  method configurarTeclas() {
    keyboard.up().onPressDo({partida.permitir ({bomberman.mover(arriba)})})
    keyboard.down().onPressDo({partida.permitir ({bomberman.mover(abajo)})})
    keyboard.left().onPressDo({partida.permitir ({bomberman.mover(izquierda)})})
    keyboard.right().onPressDo({partida.permitir ({bomberman.mover(derecha)})})
    keyboard.space().onPressDo({partida.permitir ({bomberman.plantarBomba()})})
  }

  method configurarAcciones() {
    game.tick(1000, {partida.permitir({listaEnemigos.seMueventodos()})}, false).start()// aca van a ir los movimientos de los enemigos (paso 3)
    game.onCollideDo(bomberman,{elemento => elemento.alTocarABomberman()})
  }
}
