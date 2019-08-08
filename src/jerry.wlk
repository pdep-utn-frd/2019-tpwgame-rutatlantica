import wollok.game.*
import tom.*

object jerry{
	var posicionesPosibles = [new Position(6,2), new Position(8,1), new Position(16,3), new Position(1,1), new Position(18,8)]
	var property position = new Position(18, 8)
	method image() = "jerry.png"
	method movete(direccion){	}
	method cambiarDePosicion(){
		if (self.position() == new Position(18,8)){
			position = new Position(6,2)
		}
		else{
		if (self.position() == new Position(6,2)){
			position = new Position(16,3)
		}else
		if (self.position() == new Position(16,3)){
			position = new Position(1,1)
		}else
		if (self.position() == new Position(1,1)){
			position = new Position(18,8)
		}}
	
		}
		
	
	method puedePistarte(_) = true
	
}

