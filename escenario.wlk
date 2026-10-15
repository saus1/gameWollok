import wollok.game.*
import tablero.*
import aleatorio.*
import partida.*

class Pared {
  const property position
  method image() = "pared.png"
  method esAtravesable() = false //las paredes son los limites del mapa
  method recibirExplosion() {}
    method alTocarABomberman(){}
}

class Ladrillo {
  const property position
  var contenido = nada
  method image() = "ladrillo.png"
  method esAtravesable() = false
  method esconder(algo) { contenido = algo }
  method recibirExplosion() {
    tablero.sacar(self)
    contenido.aparecerEn(position)
  }
  method alTocarABomberman(){}
}

object nada { 
  method aparecerEn(posicion) {}
  method alTocarABomberman(){} 
}

object puerta {
  var property position = game.at(0, 0)
  method image() = "puerta.png"
  method esAtravesable() = true
  method recibirExplosion() { }
  method aparecerEn(posicion) {
    position = posicion
    tablero.agregar(self)
  }
  method alTocarABomberman(){
    partida.ganar()
  }
}

object camino {
  const columnas = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
  const filas = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  const lugaresLibres = []
  const ladrillos = []

  method construccionCamino() {
    columnas.forEach({columna => self.constuirColumna(columna)})
    self.esconderPuerta()
  }

  method constuirColumna(columna){
    filas.forEach({fila => self.ocuparLugar(columna,fila)})
  }

  method ocuparLugar(columna,fila){
    if (self.vaPared(columna, fila)) tablero.agregar(new Pared(position=game.at(columna,fila)))
      else if (!self.zonaSegura(columna, fila)) self.ladrilloLibre(game.at(columna,fila))
  }

  method ladrilloLibre(lugar){
    if(aleatorio.conProbabilidad(0.4)){
      self.ponerLadrillo(lugar)
    }else{
      lugaresLibres.add(lugar)
    }
  }

  method ponerLadrillo(lugar){
    const ladrillo = new Ladrillo(position = lugar)
    ladrillos.add(ladrillo)
    tablero.agregar(ladrillo)
  }

  method esconderPuerta(){
    aleatorio.elegir(ladrillos).esconder(puerta)
  }

  method lugarLibreAlAzar(){
    const lugar = aleatorio.elegir(lugaresLibres)
    lugaresLibres.remove(lugar) // esto nos evita que dos enemigo caigan en el mismo lugar
    return lugar
  }

  method zonaSegura(columna,fila) = columna + fila <= 3 //posicion de arranque de bomberman

  method vaPared(columna,fila) = self.esBorde(columna,fila) || self.esColumnaFija(columna,fila)

  method esBorde(columna,fila) = self.esColumnaBorde(columna) || self.esFilaBorde(fila)

  method esColumnaBorde (columna) = columna == 0 || columna == game.width() - 1

  method esFilaBorde(fila) = fila == 0 || fila == game.height() - 1

  method esColumnaFija (columna,fila) = self.esPar(columna) && self.esPar(fila)

  method esPar(numero) = numero % 2 == 0
}

// escenario fijo: paredes en el borde y columnas en las celdas (par, par).
// Las listas tienen que coincidir con game.width() y game.height() de configuracion.