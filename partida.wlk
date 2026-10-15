import wollok.game.*

object partida{
    var estado = activa

    method permitir(accion){
        estado.permitir(accion)
    }
    method ganar() {
        estado.terminar("GANASTE")
    }
    method finalizar(mensaje){
        estado = finPartida
        cartel.mostrar(mensaje)
    }
}

object activa{
    method permitir(accion){
        accion.apply()
    }
    method terminar(mensaje){
        partida.finalizar(mensaje)
    }
}

object finPartida{
    method permitir(accion) {}
    method terminar(mensaje) {}
}

object cartel{
    var property text = ""
    method position() = game.center()
    method textColor() = "FFFFFFFF"
    method alTocarABomberman() {}
    method mostrar(mensaje){
        text = mensaje
        game.addVisual(self)
    }
}