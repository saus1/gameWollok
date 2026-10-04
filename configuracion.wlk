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
    game.addVisual(tom)
  }
  
  method camino() {
    camino.construccionCamino()
  }
  
  method configurarTeclas() {
    keyboard.up().onPressDo({ tom.moverseA(tom.position().up(1)) })
    keyboard.down().onPressDo({ tom.moverseA(tom.position().down(1)) })
    keyboard.left().onPressDo({ tom.moverseA(tom.position().left(1)) })
    keyboard.right().onPressDo({ tom.moverseA(tom.position().right(1)) })
  }
  
  method configurarAcciones() {
    game.onTick(1000, "mover aleatoriamente", { aleatorio.nuevaPosicion() })
  }
}