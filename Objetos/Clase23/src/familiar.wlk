import error.*
class Beth {
  var afectoPorRick
  
  method puedeIrseDeAventuras() {
    return true
  }  
  
  method irDeAventurasCon(unRick) {
    afectoPorRick += 10
    unRick.tranquilizar(20)
  }
}

class Summer inherits Beth {
  method esMiercoles() {
    return new Date().dayOfWeek() == wednesday 
  }
  
  override method irDeAventurasCon(unRick) {
    if(!self.esMiercoles()) throw new ExceptionIrseDeAventuras(message = "no puedo irme no es miercoles")
    
    super(unRick)
  }
}

class Morty {
  var saludMental
  
  method puedeIrseDeAventuras() {
    return true
  }
  
  method irDeAventurasCon(unRick) {
    saludMental -= 30
    unRick.enloquecer(50)
  }
}

object jerry {
  method puedeIrseDeAventuras() {
    return false  
  } 
  
  method irDeAventurasCon(unRick) {
    throw new ExceptionIrseDeAventuras (message = "Soy muy tonto y no puedo irme de aventuras")
  }
}