import wollok.game.*

class Ladrillo {
  var property image = "ladrillo.jpg"
  var property position = game.at(0, 0)
  method image() = image
  method position() = position
}



object camino {
  const posicionesOcupadas = []
  var property image = "ladrillo.jpg"
  var property position = game.at(0, 0)
  const posiciones = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  
  method image() = image
  
  method position() = position
  method columnaspares() = posiciones.filter({ columna => columna.even() })
  method columnasimpares() = posiciones.filter({ columna => columna.odd() })
  method filas() = posiciones.filter({ fila => fila.even() })

  method construccionCamino() {
    self.filas().forEach({ fila => self.recorridoColumna(fila) })
  }

  method recorridoColumna(fila) {
    if (fila == 0 || fila == 4 || fila == 8) {
      self.columnaspares().forEach({ columna => self.modificarEn(fila, columna) })
    } else {
      self.columnasimpares().forEach({ columna => self.modificarEn(fila, columna) })
    }
  }

  method modificarEn(fila, columna) {
    const posicion = game.at(columna, fila)
    posicionesOcupadas.add(posicion)
    game.addVisual(new Ladrillo(position = posicion))
  }

  method posicionEstaOcupada(posicion) = posicionesOcupadas.contains(posicion)
}
