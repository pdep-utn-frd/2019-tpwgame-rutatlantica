import tom.*
import jerry.*
import direcciones.*
import laberinto.*
import wollok.game.*

object nivel1 {
	var veces = 0
	var posParedes = []
	var posBordes = []
	const anchoVentana = game.width() - 1
	const largoVentana = game.height() - 1
	
	method dibujar(dibujo) {
		game.addVisual(dibujo)
	}
	
	method agregarBordeVertical(inicioX,inicioY){
		(inicioY .. largoVentana).forEach{ n => posBordes.add(game.at(inicioX, n)) }
	}
	
	method agregarBordeHorizontal(inicioX,inicioY){
		(inicioX .. anchoVentana).forEach{ n => posBordes.add(game.at(n, inicioY)) }
	}
	
	method dibujarBordes(){
		posBordes.forEach { p => self.dibujar(new Laberinto(position = p)) }
	}
	method cargar() {
		
//	PAREDES

	
		self.agregarBordeHorizontal(0,0) // bordeAbajo
		self.agregarBordeHorizontal(0,largoVentana) // bordeArriba 
		self.agregarBordeVertical(0,0) // bordeIzq 
		self.agregarBordeVertical(anchoVentana,0)  // bordeDer
		self.dibujarBordes()
		
		
//PAREDES DONDE VA EL LABERINTO
		posParedes.addAll([game.at(2,1),game.at(2,2), game.at(2,3), game.at(2,4), game.at(2,5), game.at(2,6), game.at(2,7)])
		posParedes.addAll([game.at(4,7), game.at(4,6), game.at(5,7), game.at(6,7), game.at(7,7), game.at(8,7), game.at(9,7), game.at(10,7), game.at(11,7)])
		posParedes.addAll([game.at(13,7), game.at(13,8), game.at(13,6), game.at(13,5), game.at(12,5), game.at(11,5)])
		posParedes.addAll([game.at(10,5), game.at(9,5), game.at(8,5), game.at(7,5), game.at(6,5)])
		posParedes.addAll([game.at(4,5), game.at(4,3), game.at(4,2), game.at(5,2), game.at(5,3), game.at(4,4)])
		posParedes.addAll([game.at(6,3), game.at(7,3), game.at(7,2), game.at(7,1), game.at(9,3), game.at(9,1)])
		posParedes.addAll([game.at(10,1), game.at(11,1), game.at(12,1), game.at(13,1)])
		posParedes.addAll([game.at(10,3), game.at(11,3), game.at(12,3), game.at(13,3), game.at(14,3), game.at(15,3)])
		posParedes.addAll([game.at(15,2), game.at(15,4), game.at(15,4), game.at(15,5), game.at(15,6), game.at(15,7)])
		posParedes.addAll([game.at(17,8), game.at(17,7), game.at(17,6), game.at(17,5), game.at(17,4), game.at(17,3)])
		posParedes.addAll([game.at(16,2), game.at(17,2)])
		posParedes.forEach { p => self.dibujar(new Laberinto(position = p)) }	
		
// JERRY
		game.addVisual(jerry)
		
// TOM
		game.addVisual(tom)

// TECLADO
		keyboard.up().onPressDo{ tom.irArriba() }
		keyboard.down().onPressDo{ tom.irAbajo() }
		keyboard.left().onPressDo{ tom.irIzquierda() }
		keyboard.right().onPressDo{ tom.irDerecha() }
		
		keyboard.space().onPressDo{tom.position(game.at(1,1))}
		keyboard.any().onPressDo{ self.comprobarSiGano() }

		
		game.whenCollideDo(tom, { algo => tom.empuja(algo) })
		
		
	
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
//					game.whenCollideDo(tom, {tom.declararseGanador()})
					tom.declararseGanador()
					
				}
			}
		}
		}

