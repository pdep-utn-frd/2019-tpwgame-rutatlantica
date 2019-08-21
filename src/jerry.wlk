import wollok.game.*
import tom.*

object jerry{
	var posicionesPosibles = [game.at(6,2), game.at(8,1), game.at(16,3), game.at(1,1), game.at(18,8)]
	var property position = game.at(6, 2)
	method image() = "jerry.png"
	method movete(direccion){	}
	method cambiarDePosicion(){
		if (self.position() == game.at(18,8)){
			position = game.at(6,2)
		}
		else{
		if (self.position() == game.at(6,2)){
			position = game.at(16,3)
		}else
		if (self.position() == game.at(16,3)){
			position = game.at(1,1)
		}else
		if (self.position() == game.at(1,1)){
			position = game.at(18,8)
		}}
	
		}
		
	
	method puedePistarte(_) = true
	
}

