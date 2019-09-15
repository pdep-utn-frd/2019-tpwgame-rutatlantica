class Laberinto {
	var property position
	
	
	method movete() {
		throw new Exception(message = "No se pueden atravesar las paredes")
	}
	
	method puedePisarte(_) = false
	method image() = "laberinto.png"
}