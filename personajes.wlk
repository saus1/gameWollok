import wollok.game.*
import tablero.*
import direcciones.*
import bomba.*
import aleatorio.*
import partida.*


object bomberman {
  var property position = game.at(1, 1)
  var property alcance = 1
  var orientacion = derecha

  // la imagen depende de hacia donde esta mirando
  method image() = orientacion.imagen()
  method esAtravesable() = true

  method mover(direccion) {
    orientacion = direccion.orientacionDesde(orientacion)
    self.moverseA(direccion.siguiente(position))
  }

  method moverseA(nuevaPosicion) {
    if(tablero.esAtravesable(nuevaPosicion)){
      position = nuevaPosicion
    }
  }

  method plantarBomba(){
    if(!tablero.esAtravesable(position)) self.error("aca ya hay bomba")
    new Bomba(position = position,alcance = alcance).plantar()
  }

  method recibirExplosion(){
    partida.finalizar("PERDISTE")
  }
}

class Enemigo {
  var property position = game.at (0,0)
  method image() = "enemigo.png"
  method esAtravesable() = true
  method recibirExplosion(){
    listaEnemigos.sacar(self)
  }
  method direccionesLibres() = [arriba,abajo,izquierda,derecha].filter({direccion => tablero.esAtravesable(direccion.siguiente(position))})
  method moverAleatorio(){
    const opciones = self.direccionesLibres()
    if(!opciones.isEmpty()) position = aleatorio.elegir(opciones).siguiente(position)
  }
    method alTocarABomberman(){
      partida.finalizar("PERDISTE")
    } // perdemos
}

object listaEnemigos{ // coleccion de enemigos que hay en el juego
  const vivos = []

  method agregar(enemigo,lugar){
    enemigo.position(lugar)
    vivos.add(enemigo)
    tablero.agregar(enemigo)
  }

  method sacar(enemigo){
    vivos.remove(enemigo)
    tablero.sacar(enemigo)
  }

  method seMueventodos(){
    vivos.forEach({enemigo => enemigo.moverAleatorio()})
  }
}