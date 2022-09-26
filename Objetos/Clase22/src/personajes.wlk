class Personaje { //clase abstracta
	var energia
	var inventario
	var energiaDeLucha
	var gritoDeVictoria
	
	//método abstracto
	method lucharContra(personaje) 
	
	//método concreto
	method lucharContraEquipo(equipo) {
		equipo.forEach({ unPersonaje => self.lucharContra(unPersonaje) })
	}
	
	method energia() {
		return energia
	}
	
	method tieneEnergia() {
		return energia > 0
	}
	
	method gritoDeVictoria() {
		return gritoDeVictoria
	}
	
	method perderEnergia(danio) {
		energia -= danio
	}
	
	method cantidadDeElementos() {
		return inventario.size()
	}
	
	method ultimoElemento() {
		return inventario.last()
	}
	
	method perderUltimoElemento() {
		inventario.remove(self.ultimoElemento())
	}	
}

class Sanador inherits Personaje { //clase concreta
	
	override method lucharContra(personaje) {
		energia += energiaDeLucha
	}

}

class UltraSanador inherits Sanador {
	
	override method lucharContraEquipo(equipo) {
		super(equipo)
		energia += 1000
	}
	
}

class Atacante inherits Personaje {
	
	override method lucharContra(personaje) {
		personaje.perderEnergia(personaje.energia() * energiaDeLucha)
	}
	
}

object toro inherits Personaje(
	energia = 7800, 
	inventario = #{}, 
	energiaDeLucha = 200, 
	gritoDeVictoria = "No se metan con el toro"
) {
	
	override method lucharContra(personaje) {
		personaje.perderEnergia(energiaDeLucha * personaje.cantidadDeElementos())
		inventario.add(personaje.ultimoElemento())
		personaje.perderUltimoElemento()
	}
		
	override method ultimoElemento() {
		return inventario.asList().last()
	}
	
}

const pamela = new Sanador(
	energia = 6000,
	inventario = ["algodón", "agua oxigenada", "cinta de papel", "cinta de papel"],
	energiaDeLucha = 400,
	gritoDeVictoria = "Acá pasó la Pamela"
)

const pocardo = new Sanador(
	energia = 5600,
	inventario = ["guitarra", "curitas", "cotonetes"],
	energiaDeLucha = 500,
	gritoDeVictoria = "¡Siente el poder de la música!"
)

const tulipan = new Atacante(
	energia = 8600,
	inventario = ["rastrillo", "maceta", "maceta", "manguera"],
	energiaDeLucha = 0.5,
	gritoDeVictoria = "Hora de cuidar a las plantas"
)

const primardo = new Atacante(
	energia = 7500,
	inventario = ["mascara", "short de lucha"],
	energiaDeLucha = 0.7,
	gritoDeVictoria = "¡¡Soy el mejoooooor!!"
)

const lordByron = new UltraSanador(
	energia = 4000,
	inventario = ["pócimas", "jeringas"],
	energiaDeLucha = 200,
	gritoDeVictoria = "Necesito veneno de serpientes"
)




