import tom.*
import jerry.*
import direcciones.*
import laberinto.*
import wollok.game.*
import reloj.*

object nivel1 {
	//var paredes = [new ParedH(1,2,3), ]
	const anchoVentana = game.width() - 1
	const largoVentana = game.height() - 1
	
	method dibujar(dibujo) {
		game.addVisual(dibujo)
	}
	
	method dibujarParedVertical(inicio, fin, posX){
		(inicio..fin).forEach{n => self.dibujar(new Laberinto(position = game.at(posX,n)))}
	}
	
	method dibujarParedHorizontal(inicio, fin, posY){
		(inicio..fin).forEach{n => self.dibujar(new Laberinto(position = game.at(n,posY)))}
	}
	
	method cargar() {
		
//	BORDES

	
		self.dibujarParedHorizontal(0,anchoVentana,largoVentana) // bordeArriba
		self.dibujarParedHorizontal(0,anchoVentana,0) // bordeAbajo
		self.dibujarParedVertical(0,largoVentana,0) // bordeIzq 
		self.dibujarParedVertical(0,largoVentana,anchoVentana)  // bordeDer
		
		
//PAREDES DONDE VA EL LABERINTO
		self.dibujarParedVertical(1,7,2)
		self.dibujarParedVertical(3,3,6)
		self.dibujarParedVertical(5,8,13)
		self.dibujarParedVertical(2,3,5)
		self.dibujarParedVertical(2,2,16)
		self.dibujarParedVertical(2,6,4)
		self.dibujarParedVertical(1,3,7)
		self.dibujarParedVertical(2,7,15)		
		self.dibujarParedVertical(2,8,17)
		self.dibujarParedHorizontal(9,13,1)
		self.dibujarParedHorizontal(9,14,3)
		self.dibujarParedHorizontal(6,12,5)
		self.dibujarParedHorizontal(4,11,7)
		
		
// JERRY
		game.addVisual(jerry)
		game.hideAttributes(jerry)
		
		
// TOM
		game.addVisual(tom)
		game.hideAttributes(tom)
		
// RELOJ
		
		game.addVisual(reloj)
		game.addVisual(segundosRestantes)


// TECLADO
		keyboard.up().onPressDo{ tom.irArriba() }
		keyboard.down().onPressDo{ tom.irAbajo() }
		keyboard.left().onPressDo{ tom.irIzquierda() }
		keyboard.right().onPressDo{ tom.irDerecha() }
		
		keyboard.space().onPressDo{tom.position(game.at(1,1))}
//		keyboard.any().onPressDo{ self.comprobarSiGano() }

		
		game.whenCollideDo(tom, { algo => tom.empuja(algo) })
		
		
	
		}
		
	method restart() {
			game.clear()
			self.cargar()
	}

}



