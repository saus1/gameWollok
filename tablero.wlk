import wollok.game.*

object tablero {
const elementos = []

method agregar(elemento) {
  elementos.add(elemento)
  game.addVisual(elemento)
}

method sacar(elemento) {
  elementos.remove(elemento)
  game.removeVisual(elemento)
}

method estaDentro(posicion) = posicion.x().between(0,game.width() - 1) && posicion.y().between(0, game.height() - 1)

method elementosEn(posicion) = elementos.filter({elemento => elemento.position() == posicion})

method bloqueantesEn(posicion) = self.elementosEn(posicion).filter({elemento => !elemento.esAtravesable()})

method esAtravesable(posicion) = self.estaDentro(posicion) && self.bloqueantesEn(posicion).isEmpty()
}

/*
NOTAS:
-> el tablero es el unico que agrea y saca elementos -> es el que tiene la lista de elementos del juego
-> lo que es atravesable es la posicion, siempre que este dentro del tablero y no haya ningun elemento que la bloquee
-> encapsulamiento, ya que solo el tablero puede agregar y sacar elementos -> no hay que mantener dos listas sinc 
-> polimorfismo: pared y bomberman entienden esAtravesable() y c/u responde a su manera
*/
