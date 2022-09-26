import personajes.*

object arena {
	const equipoRojo = #{pamela, toro}
	const equipoAzul = #{pocardo, tulipan}
	
	method combatir() {
		self.pelearEntre(equipoRojo, equipoAzul)
		self.pelearEntre(equipoAzul, equipoRojo)
	}
	
	method pelearEntre(unEquipo, otroEquipo) {
		unEquipo.forEach({ unPersonaje => unPersonaje.lucharContraEquipo(otroEquipo) })
	}
	
	method equipoGanador() {
		return [equipoRojo, equipoAzul].max({ unEquipo => self.energiaDeEquipo(unEquipo) })
	}
	
	method energiaDeEquipo(unEquipo) {
		return unEquipo.sum({ unPersonaje => unPersonaje.energia() })
	}
	
	method victoria() {
		return self.ganadoresConEnergia().map({ unPersonaje => unPersonaje.gritoDeVictoria() })
	}
	
	method ganadoresConEnergia() {
		return self.equipoGanador().filter({ unPersonaje => unPersonaje.tieneEnergia() })
	}
}

