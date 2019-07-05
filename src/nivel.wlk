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
		
		//FALTA GENERAR PAREDES DONDE VA EL LABERINTO
		posParedes.addAll([new Position(3,5), new Position(4,5), new Position(5,5)])
		
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