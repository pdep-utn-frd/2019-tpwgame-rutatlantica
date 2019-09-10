import wollok.game.*
import tom.*
import reloj.*

object jerry{
	
	var posicionesPosibles = [game.at(6,2), game.at(8,1), game.at(16,3), game.at(1,1), game.at(18,8)]
	var property position = game.at(18,8)
	
	method image() = "jerry.png"
	method movete(direccion){	}
	method cambiarDePosicion(){ 
		position = posicionesPosibles.anyOne()
		reloj.restart()
	}
		
	
	method puedePisarte(_) = true
	
}

