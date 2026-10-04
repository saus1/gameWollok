
import ladrillos.*

object tom {
  var property image = "tom.jpg"
  var property position = game.at(1, 0)
  
  method image() = image
  
  method position() = position

    method moverseA(nuevaPosicion) {
   // se verifica si la nueva posición no está ocupada por un ladrillo antes de mover a Tom  
    if(!camino.posicionEstaOcupada(nuevaPosicion)){  
       position = nuevaPosicion
     } 
  }
}


