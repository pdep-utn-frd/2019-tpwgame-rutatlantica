import wollok.game.*
import tom.*
import reloj.*

object jerry{
	
	var posicionesPosibles = [game.at(6,2), game.at(8,1), game.at(16,3), game.at(1,1), game.at(18,8)]
	var property position = game.at(18,8)
	var muertes = 0
	
	method image() = "jerry.png"
	
	method movete(){	
		muertes =+1
		if (muertes < 4){
			self.cambiarDePosicion()
			game.say(self,"MUY LENTO")
		}
		else{
			tom.declararseGanador()
			muertes = 0
			game.stop()
		}
	}
	
	method cambiarDePosicion(){ 
		posicionesPosibles.filter{posiciones => posiciones != position}
		position = (posicionesPosibles.filter{posiciones => posiciones != position}).anyOne()
		reloj.restart()
	}
		
	
	method puedePisarte(_) = true
	
}





