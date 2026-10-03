import wollok.game.*
import personajes.*

object aleatorio {
  var position =game.at(8, 8)
  method position()=position

  method nuevaPosicion(){
    // calculo corrdenadas aleatorias dentro de la pantall
    const x=0.randomUpTo(game.width())
    const y=0.randomUpTo(game.height())
    position=game.at(x,y)

  }

}