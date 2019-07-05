class Laberinto {
	var property position
	
	constructor(_position) {
		position = _position
	}
	
	method movete(direccion) {
		throw new Exception("No se pueden atravesar las paredes")
	}
	
	method puedePisarte(_) = false
	method image() = "laberinto.png"
}