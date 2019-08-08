import tom.*
import jerry.*
import direcciones.*
import laberinto.*
import wollok.game.*

object nivel1 {
	var veces = 0
	method cargar() {
		
//	PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
	
		var posParedes = []
		(0 .. ancho).forEach{ n => posParedes.add(new Position(n, 0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posParedes.add(new Position(n, largo)) } // bordeArriba 
		(0 .. largo).forEach{ n => posParedes.add(new Position(0, n)) } // bordeIzq 
		(0 .. largo).forEach{ n => posParedes.add(new Position(ancho, n)) } // bordeDer
		
//PAREDES DONDE VA EL LABERINTO
		posParedes.addAll([new Position(2,1),new Position(2,2), new Position(2,3), new Position(2,4), new Position(2,5), new Position(2,6), new Position(2,7)])
		posParedes.addAll([new Position(4,7), new Position(4,6), new Position(5,7), new Position(6,7), new Position(7,7), new Position(8,7), new Position(9,7), new Position(10,7), new Position(11,7)])
		posParedes.addAll([new Position(13,7), new Position(13,8), new Position(13,6), new Position(13,5), new Position(12,5), new Position(11,5)])
		posParedes.addAll([new Position(10,5), new Position(9,5), new Position(8,5), new Position(7,5), new Position(6,5)])
		posParedes.addAll([new Position(4,5), new Position(4,3), new Position(4,2), new Position(5,2), new Position(5,3), new Position(4,4)])
		posParedes.addAll([new Position(6,3), new Position(7,3), new Position(7,2), new Position(7,1), new Position(9,3), new Position(9,1)])
		posParedes.addAll([new Position(10,1), new Position(11,1), new Position(12,1), new Position(13,1)])
		posParedes.addAll([new Position(10,3), new Position(11,3), new Position(12,3), new Position(13,3), new Position(14,3), new Position(15,3)])
		posParedes.addAll([new Position(15,2), new Position(15,4), new Position(15,4), new Position(15,5), new Position(15,6), new Position(15,7)])
		posParedes.addAll([new Position(17,8), new Position(17,7), new Position(17,6), new Position(17,5), new Position(17,4), new Position(17,3)])
		posParedes.addAll([new Position(16,2), new Position(17,2)])
		posParedes.forEach { p => self.dibujar(new Laberinto(p)) }	
		
// JERRY
		game.addVisual(jerry)
		
// TOM
		game.addVisual(tom)

// TECLADO
		keyboard.up().onPressDo{ tom.irArriba() }
		keyboard.down().onPressDo{ tom.irAbajo() }
		keyboard.left().onPressDo{ tom.irIzquierda() }
		keyboard.right().onPressDo{ tom.irDerecha() }
		
		keyboard.space().onPressDo{tom.position(new Position(1,1))}
		keyboard.any().onPressDo{ self.comprobarSiGano() }

		
		game.whenCollideDo(tom, { algo => tom.empuja(algo) })
		
		
	
		}
		method dibujar(dibujo) {
			game.addVisual(dibujo)
			return dibujo
				}
		method restart() {
			game.clear()
			self.cargar()
		}
		method comprobarSiGano(){
			//var veces = 1
			if (tom.position()==jerry.position()){
				jerry.cambiarDePosicion()
				game.say(jerry,"MUY LENTO")
				veces = veces + 1
				if (veces == 4){
					game.whenCollideDo(tom, tom.declararseGanador())
					
				}
			}
		}
		}

