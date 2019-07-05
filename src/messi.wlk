import wollok.game.*
import direcciones.*

object messi {
	var position = new Position(4, 3)
	var direccion = arriba


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
	
	method image() = "jugador.png"
	method position() = position
	method position(_position) {
		position = _position
	} 
}