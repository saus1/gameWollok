import wollok.game.*
import tablero.*
import direcciones.*
import partida.*

class Bomba {
    const property position
    const alcance

    method image() = "bomba2.png"
    method esAtravesable() = false
    method recibirExplosion() { }

    method plantar() {
        tablero.agregar(self)
        game.schedule(2000, { self.explotar() })
    }

    method explotar(){
        tablero.sacar(self)
        self.golpear(position)
        new Fuego(position = position, image = "fuego_centro.png").enLlamas()
        [arriba,abajo,izquierda,derecha].forEach({direccion => self.expandirse(direccion.siguiente(position),direccion,alcance)})
    }

    method expandirse(posicion,direccion,restoAlcance) {
        if(restoAlcance > 0){
            if(tablero.esAtravesable(posicion)){
                self.golpear(posicion)
                new Fuego (position = posicion, image = self.imgFuego(posicion,direccion,restoAlcance)).enLlamas()
                self.expandirse(direccion.siguiente(posicion), direccion, restoAlcance - 1)
            } else{
                self.golpear(posicion) // pared o ladrillo recibe la explosion pero no se crea fuego
            }
        }
    }

    method golpear(posicion){
        tablero.elementosEn(posicion).forEach({elemento => elemento.recibirExplosion()})
    }

    method ultimaCelda(posicion,direccion,restoAlcance) = restoAlcance == 1 || !tablero.esAtravesable(direccion.siguiente(posicion))

    method imgFuego(posicion,direccion,restoAlcance) = 
    if(self.ultimaCelda(posicion, direccion, restoAlcance)){
        direccion.imgBorde()
        } else {
            direccion.imgParte()
        }
    
    method alTocarABomberman(){
        partida.finalizar("PERDISTE")
    } //perdemos
}

    class Fuego {
    const property position
    const property image

    method esAtravesable() = true
    method recibirExplosion() { }

    method enLlamas() {
        tablero.agregar(self)
        game.schedule(600, { tablero.sacar(self) })
    }

    method alTocarABomberman(){} //perdemos
}
