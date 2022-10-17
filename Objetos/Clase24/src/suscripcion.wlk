object premium {
  method permiteJugar(unJuego) {
    return true
  }
  
  method costo() {
    return 50
  }
}

object base {
  method permiteJugar(unJuego) {
    return unJuego.esBarato()
  }
  
  method costo() {
    return 25
  }
}

class SuscripcionCategorica {
  method permiteJugar(unJuego) {
    return unJuego.esDeCategoria(self.categoria())
  }
  
  method categoria()
}

object prueba inherits SuscripcionCategorica {
  override method categoria() {
    return "Demo"
  }
  
  method costo() {
    return 0
  }
}

object infantil inherits SuscripcionCategorica {
  override method categoria() {
    return "Infantil"
  }
  
  method costo() {
    return 10
  }
}