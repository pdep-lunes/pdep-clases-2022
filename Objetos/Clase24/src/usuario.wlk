import suscripcion.prueba
import suscripcion.infantil

class Usuario {
  var suscripcion
  var plataEnCuenta
  var humor

  method actualizarSuscripcion(unaSuscripcion) {
    suscripcion = unaSuscripcion
  }

  method puedeJugar(unJuego) {
    return suscripcion.permiteJugar(unJuego)
  }

  method pagarSuscripcion() {
    if(self.leAlcanzaParaPagar(suscripcion.costo())) {
      self.actualizarSuscripcion(prueba)
    } else {
      plataEnCuenta -= suscripcion.costo()
    }
  }
  
  method leAlcanzaParaPagar(unaCantidad) {
    return plataEnCuenta < unaCantidad
  }
  
  method jugar(unJuego, unasHoras) {
    if(!self.puedeJugar(unJuego)) throw new Exception(message = "No puedo jugar este juego!")
    
    unJuego.afectarA(self, unasHoras)
  }
  
  method reducirHumor(unaCantidad) {
    humor -= unaCantidad
  }
  
  method comprarSkins() {
    if(!self.leAlcanzaParaPagar(30)) throw new Exception(message = "No me alcanza la plata!")
    
    plataEnCuenta -= 30
  }
  
  method tirarTodoAlCarajo() {
    self.actualizarSuscripcion(infantil)
  }
  
  method aumentarHumor(unaCantidad) {
    humor += unaCantidad
  }
}
