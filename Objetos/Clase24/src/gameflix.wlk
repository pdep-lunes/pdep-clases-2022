object gameflix {
  const juegos = #{}
  const usuarios = #{}
  
  method agregarJuego(unJuego) {
    juegos.add(unJuego)
  }
  
  method juegosDeCategoria(unaCategoria) {
    return juegos.filter({ unJuego => unJuego.esDeCategoria(unaCategoria) })
  }

  method juegoQueSeLlama(nombre) {
    return juegos.findOrElse({ unJuego => unJuego.seLlama(nombre) }, { throw new Exception(message = "No existe un juego con ese nombre") })
  }

  method juegoAlAzar() {
    return juegos.asList().anyOne()
  }

  method cobrar() {
    usuarios.forEach({ usuario => usuario.pagarSuscripcion() })
  }
}
