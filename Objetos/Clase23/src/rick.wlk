import familiar.*
import error.*

class Rick {
  var demencia
  var acompaniante

  method irseDeAventuras() {
    acompaniante.irDeAventurasCon(self)
  }
  
  method enloquecer(unaCantidad) {
    demencia += unaCantidad
  }
  
  method tranquilizar(unaCantidad) {
    demencia -= unaCantidad
  }
}
