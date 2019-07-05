import messi.*
import copa.*
import direcciones.*
import laberinto.*
import direcciones.*
import wollok.game.*

object nivel1 {
	
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
		posParedes.addAll([new Position(1,1), new Position(1,2), new Position(1,6), new Position(1,7), new Position(1,8), new Position(1,9), new Position(1,10)])
		posParedes.addAll([new Position(2,4), new Position(2,10), new Position(2,12)])
		posParedes.addAll([new Position(3,2), new Position(3,3), new Position(3,4), new Position(3,6), new Position(3,8), new Position(3,12)])
		posParedes.addAll([new Position(4,6), new Position(4,8), new Position(4,9), new Position(4,10)])
		posParedes.addAll([new Position(5,1), new Position(5,2), new Position(5,3), new Position(5,4), new Position(5,6), new Position(5,12), new Position(5,13)])
		posParedes.addAll([new Position(6,4), new Position(6,6), new Position(6,7), new Position(6,8), new Position(6,10), new Position(6,11), new Position(6,12), new Position(6,13)])
		posParedes.addAll([new Position(7,2), new Position(7,4), new Position(7,7), new Position(7,10)])
		posParedes.addAll([new Position(8,2), new Position(8,4), new Position(8,5), new Position(8,6), new Position(8,7), new Position(8,9), new Position(8,10), new Position(8,12)])
		posParedes.addAll([new Position(9,2), new Position(9,7), new Position(9,12)])
		posParedes.addAll([new Position(10,2), new Position(10,3), new Position(10,4), new Position(10,5), new Position(10,7), new Position(10,8), new Position(10,9), new Position(10,10), new Position(10,11), new Position(10,12)])
		posParedes.addAll([new Position(11,3), new Position(11,11)])
		posParedes.addAll([new Position(12,1), new Position(12,4), new Position(12,5), new Position(12,6), new Position(12,7), new Position(12,8), new Position(12,9), new Position(12,11), new Position(12,13)])
		posParedes.addAll([new Position(13,2), new Position(13,6), new Position(13,11), new Position(13,13)])
		posParedes.addAll([new Position(14,4), new Position(14,6), new Position(14,8), new Position(14,10), new Position(14,11)])
		posParedes.addAll([new Position(15,1), new Position(15,2), new Position(15,3), new Position(15,4), new Position(15,6), new Position(15,8), new Position(15,11), new Position(15,12)])
		posParedes.addAll([new Position(16,6), new Position(16,9)])
		posParedes.addAll([new Position(17,2), new Position(17,3), new Position(17,4), new Position(17,5), new Position(17,6), new Position(17,7), new Position(17,9), new Position(17,10), new Position(17,11), new Position(17,12)])
		posParedes.addAll([new Position(18,2)])
		posParedes.forEach { p => self.dibujar(new Laberinto(p)) }	
		
// MESSI EL MAS GRANDE
		game.addVisual(messi)
		
// LA COPA DO MUNDO MANO KKKKKKK
	
		
		}
		
		


		method dibujar(dibujo) {
			game.addVisual(dibujo)
			return dibujo
		}
	
}