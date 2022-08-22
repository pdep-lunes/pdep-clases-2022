import perros.*

object billy {
	const nombre = "Billy"
	var edad = 12
	var energia = 200
	var compania = poroto
	
	method jugar() {
	  energia -= 50
	  compania.jugar()
	}
	
	method energia() {
	  return energia
	}
	
	method compania() {
	  return compania
	}
}

object mandy {
  const nombre = "Mandy"
  var edad = 15
  var energia = 200
  var compania = poroto
  
  method jugar() {
    energia -= 30
    compania.jugar()
    compania.jugar()
  }
  
  method compania() {
    return compania
  }
}
