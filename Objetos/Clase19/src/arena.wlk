import luchadores.*

object arena {
	
	var luchadores = #{}
	var numeros1 = [1, 1, 2, 2]
	var numeros2 = #{1, 1, 2, 2}

	
	method luchadores () = luchadores	
	
	method agregarLuchador(unLuchador){
		luchadores.add(unLuchador)
	}
	
	method echarLuchador(unLuchador){
		luchadores.remove(unLuchador)
	}
	
	method nombresDeLosLuchadores(){
		return luchadores.map({unLuchador => unLuchador.nombre()})
	}
	
	//luchadores debiles (sin mucho poder) > cantidadDeLuchadores / 2
	
	method esAmateur(){
		return self.luchadoresDebiles().size() > (self.cantidadDeLuchadores() / 2)
	}
	
	method luchadoresDebiles(){
		return luchadores.filter({unLuchador => !unLuchador.tieneMuchoPoder()})
	}
	
	method cantidadDeLuchadores(){
		return luchadores.size()
	}
	
	method descansarTodosLosLuchadores(){
		luchadores.forEach({unLuchador => unLuchador.descansar()})
	}
	
	method combateSimple(){
		luchadores.forEach({unLuchador => self.atacarAlgunRival(unLuchador)})
	}
	
	method rivales(unLuchador){
		return luchadores.filter({otroLuchador => otroLuchador != unLuchador})
	}
	
	method algunRival(unLuchador){
		return self.rivales(unLuchador).asList().anyOne()
	}
	
	method atacarAlgunRival(unLuchador){
		self.algunRival(unLuchador).recibirAtaque(unLuchador.danioAtaqueSimple())
	}
	
	method luchadorGanador(){
		return luchadores.min({unLuchador => unLuchador.agotamiento()})
	}
	
}