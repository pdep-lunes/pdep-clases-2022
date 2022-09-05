//mario, link, sora

object mario {
	var nombre = "Mario"
	var agotamiento = 0
	var ataque = "Salto"
	
	method nombre() = nombre
	
	method ataque() = ataque
	
	method agotamiento() = agotamiento
	
	method recibirAtaque(unDanio){
		agotamiento += unDanio
	}
	
	method descansar(){
		agotamiento = 0
	}
	
	method evolucionar(){
		ataque = "Bola de agua"
	}
	
	method danioAtaqueSimple(){
		return ataque.size()
	}
	
	method tieneMuchoPoder() = true
	
}

object link {
	var nombre = "Link"
	var agotamiento = 0
	var armas = #{"Espada del heroe", "Escudo Hyliano", "Arco"}
	
	method nombre() = nombre
	
	method agotamiento() = agotamiento
	
	method armas() = armas
	
	method recibirAtaque(unDanio){
		agotamiento += unDanio
	}
	
	method descansar(){
		agotamiento = 0
	}
	
	
	method evolucionar(){
		self.perderArma("Espada del heroe")
		self.obtenerArma("Espada Maestra")
		self.obtenerArma("Gancho")
		self.obtenerArma("Bombas")
	}
	
	method obtenerArma(unArma){
		armas.add(unArma)
	}
	
	method perderArma(unArma){
		armas.remove(unArma)
	}
	
	method danioAtaqueSimple(){
		return armas.size() * 2
	}
	
	method tieneMuchoPoder(){
		return armas.size() > 3
	}
	
}

object sora {
	var nombre = "Sora"
	var agotamiento = 0
	var comandos = #{"Pyro", "Hielo", "Electro"}
	var nivel = 1
	
	method nombre() = nombre
	
	method agotamiento() = agotamiento
	
	method comandos() = comandos
	
	method nivel() = nivel
	
	method recibirAtaque(unDanio){
		agotamiento += unDanio
	}
	
	method descansar(){
		agotamiento = 0
	}
	
	method evolucionar(){
		nivel++
		comandos = comandos.map({unComando => unComando + "+"}).asSet()
	}
	
	method danioAtaqueSimple(){
		return comandos.size() * nivel
	}
	
	method tieneMuchoPoder(){
		return comandos.contains("Pyro++")
	}
}