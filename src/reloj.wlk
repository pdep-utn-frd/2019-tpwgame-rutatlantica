import wollok.game.*

class Digit {
	var property image
}

const nueve = new Digit(image = "9.png")
const ocho = new Digit(image = "8.png")
const siete = new Digit(image = "7.png")
const seis = new Digit(image = "6.png")
const cinco = new Digit(image = "5.png")
const cuatro = new Digit(image = "4.png")
const tres = new Digit(image = "3.png")
const dos = new Digit(image = "2.png")
const uno = new Digit(image = "1.png")
const cero = new Digit(image = "0.png")

object reloj{
	var property position = game.at(1,9)
	var nro = 0
	var listaNumeros = [nueve,ocho,siete,seis,cinco,cuatro,tres,dos,uno,cero]
	var property image = "nueve.png"
	
	method restart(){
		nro = 0
		self.startCounting()
	}
	method avanzar(){
		game.addVisual(self)
		image = listaNumeros.get(nro).image()
		nro +=1	
		game.schedule(900,{game.removeVisual(self)})
		
	}
	method startCounting(){
		game.onTick(1000, "cuenta regresiva", {self.avanzar()})
	}
}