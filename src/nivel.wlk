import tom.*
import jerry.*
import direcciones.*
import laberinto.*
import wollok.game.*

object nivel1 {
	var veces = 0
	var posParedes = []
	var posBordes = []
	var paredes = [new ParedH(1,2,3), ]
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
	
	method dibujarBordes2(inicioX,inicioY){
		(inicioX .. anchoVentana).forEach { n => self.dibujar(new Laberinto(position = game.at(n, inicioY))) }
	}
	method dibujarParedes(){
		posParedes.forEach { p => self.dibujar(new Laberinto(position = p)) }
	}
	
	method cargar() {
		
//	PAREDES

	
		self.agregarBordeHorizontal(0,0) // bordeAbajo
		self.agregarBordeHorizontal(0,largoVentana) // bordeArriba 
		self.agregarBordeVertical(0,0) // bordeIzq 
		self.agregarBordeVertical(anchoVentana,0)  // bordeDer
		self.dibujarBordes()
		
		
//PAREDES DONDE VA EL LABERINTO
		(1..7).forEach{n => posParedes.add(game.at(2,n))}
		//alguien.paredVertical(1,7,2)
		
		(4..11).forEach{n => posParedes.add(game.at(n,7))}

		(5..8).forEach{n => posParedes.add(game.at(13,n))}
		//alguien.paredVertical(4,11,13)


		(6..12).forEach{n => posParedes.add(game.at(n,5))}
		(2..6).forEach{n => posParedes.add(game.at(4,n))}
		(1..3).forEach{n => posParedes.add(game.at(7,n))}
		(9..13).forEach{n => posParedes.add(game.at(n,1))}
		(9..14).forEach{n => posParedes.add(game.at(n,3))}
		(2..7).forEach{n => posParedes.add(game.at(15,n))}
		(2..8).forEach{n => posParedes.add(game.at(17,n))}
		
		posParedes.addAll([game.at(16,2), game.at(6,3), game.at(5,2), game.at(5,3)])
		self.dibujarParedes()	
		
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

