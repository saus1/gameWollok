import wollok.game.*

object aleatorio {
    method indiceHasta(cantidadMaxima) = 0.randomUpTo(cantidadMaxima).truncate(0).min(cantidadMaxima - 1)
    method elegir(opciones) = opciones.get(self.indiceHasta(opciones.size()))
    method conProbabilidad(probabilidad) = 0.randomUpTo(1) < probabilidad
    }