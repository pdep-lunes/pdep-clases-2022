object pamela {
	var energia = 6000
	const inventario = ["algodón", "agua oxigenada", "cinta de papel", "cinta de papel"]
	
	method lucharContra(personaje) {
		energia += 400
	}
	
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
		return "Acá pasó la Pamela"
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

object pocardo {
	var energia = 5600
	const inventario = ["guitarra", "curitas", "cotonetes"]
	
	method lucharContra(personaje) {
		energia += 500
	}
	
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
		return "¡Siente el poder de la música!"
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

object tulipan {
	var energia = 8400
	const inventario = ["rastrillo", "maceta", "maceta", "manguera"]
	
	method lucharContra(personaje) {
		personaje.perderEnergia(personaje.energia() * 0.5)
	}
	
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
		return "Hora de cuidar a las plantas"
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

object toro {
	var energia = 7800
	const inventario = #{}
	
	method lucharContra(personaje) {
		personaje.perderEnergia(200 * personaje.cantidadDeElementos())
		inventario.add(personaje.ultimoElemento())
		personaje.perderUltimoElemento()
	}
	
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
		return "No se metan con el toro"
	}
	
	method perderEnergia(danio) {
		energia -= danio
	}
	
	method cantidadDeElementos() {
		return inventario.size()
	}
	
	method ultimoElemento() {
		return inventario.asList().last()
	}
	
	method perderUltimoElemento() {
		inventario.remove(self.ultimoElemento())
	}
}





