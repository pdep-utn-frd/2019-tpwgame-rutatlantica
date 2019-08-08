import wollok.game.*
import direcciones.*
import nivel.*

object tom {
	var position = new Position(1, 1)
	var direccion = arriba

	method empuja(unElemento) {
		try
			unElemento.movete(direccion)
		catch e {
			self.retrocede()
		}
	}
	method declararseGanador(){
		game.say(self, "GANADOR")
		nivel1.restart()
		return " "
	}
	
	method retrocede() {
		position = direccion.opuesto().siguiente(position)
	}
	
	method irArriba() {
		direccion = arriba
		self.avanzar()
	}

	method irAbajo() {
		direccion = abajo
		self.avanzar()
	}

	method irIzquierda() {
		direccion = izquierda
		self.avanzar()
	}

	method irDerecha() {
		direccion = derecha
		self.avanzar()
	}
	
	method avanzar() {
		position = direccion.siguiente(position)
	}
	
	method setDireccion(unaDireccion) {
		direccion = unaDireccion
	}
	
	method image() = "tom.png"
	method position() = position
	method position(_position) {
		position = _position
	} 
}