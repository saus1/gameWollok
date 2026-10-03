
import ladrillos.*

object tom {
  var property image = "tom.jpg"
  var property position = game.at(1, 0)
  
  method image() = image
  
  method position() = position

    method moverseA(nuevaPosicion) {
    // if (!ladrillos.hayEn(nuevaPosicion)) {
    if(!camino.posicionEstaOcupada(nuevaPosicion)){
       position = nuevaPosicion
     }
  }
}


