import game.*
import personajes.*
import movimiento.*
import ladrillos.*

object inicioGame {
  method iniciar() {
        self.configurarJuego()
        self.agregarPersonajes()
        self.camino()
        self.configurarTeclas()
        self.configurarAcciones()
        game.start()
  }
  
  method configurarJuego() {
    game.title("game")
    game.width(10)
    game.height(10)
    game.cellSize(70)
    ///game.boardGround("fondo.png")  // agegar fondo
  }
  
  method agregarPersonajes() {
    game.addVisual(bomberman)
  }
  
  method camino() {
    camino.construccionCamino()
  }
  
  method configurarTeclas() {
    keyboard.up().onPressDo({ bomberman.mover(arriba) })
    keyboard.down().onPressDo({ bomberman.mover(abajo) })
    keyboard.left().onPressDo({ bomberman.mover(izquierda) })
    keyboard.right().onPressDo({ bomberman.mover(derecha) })
  }
  
  method configurarAcciones() {
    game.onTick(1000, "mover aleatoriamente", { aleatorio.nuevaPosicion() })
  }
}