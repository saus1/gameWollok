import game.*
import personajes.*
import movimiento.*
import ladrillos.*

object inicioGame {
  var personajeEnemigo = new Personaje(imagen = "enemigo.png")
  var personajeEnemigo2 = new Personaje(imagen = "enemigo2.png")
  
  method iniciar() {
    self.configurarJuego()
    self.camino()
    self.agregarPersonajes()
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
    game.addVisual(personajeEnemigo)
    game.addVisual(personajeEnemigo2)
  }
  
  method camino() {
    camino.construccionCamino()
  }
  
  method configurarTeclas() {
    keyboard.up().onPressDo({ bomberman.mover(arriba) })
    keyboard.down().onPressDo({ bomberman.mover(abajo) })
    keyboard.left().onPressDo({ bomberman.mover(izquierda) })
    keyboard.right().onPressDo({ bomberman.mover(derecha) })
    keyboard.space().onPressDo({ bomberman.lanzarBomba() })

  }
  
  method configurarAcciones() {
    game.onTick(
      1000,
      "mover aleatoriamente",
      { personajeEnemigo.moverAleatoriamente() }
    )
    game.onTick(
      1000,
      "mover aleatoriamente",
      { personajeEnemigo2.moverAleatoriamente() }
    )
  }
}