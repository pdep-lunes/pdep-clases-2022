class Juego {
  const categoria
  const nombre
  const precio
  
  method esDeCategoria(unaCategoria) {
    return unaCategoria == categoria
  }

  method seLlama(unNombre) {
    return unNombre == nombre
  }

  method esBarato() {
    return precio < 30
  }
}

class JuegoViolento inherits Juego {
  method afectarA(unUsuario, unasHoras) {
    unUsuario.reducirHumor(10 * unasHoras)
  }
}

class JuegoMOBA inherits Juego {
  method afectarA(unUsuario, unasHoras) {
    unUsuario.comprarSkins()
  }
}

class JuegoDeTerror inherits Juego {
  method afectarA(unUsuario, unasHoras) {
    unUsuario.tirarTodoAlCarajo()
  }
}

class JuegoDeEstrategia inherits Juego {
  method afectarA(unUsuario, unasHoras) {
    unUsuario.aumentarHumor(5 * unasHoras)
  }
}


// Herencia
// - Estatica
// - Sólo permite implementar un tipo
// ++++ Es más simple

// vs.

// Composicion
// + Dinámica
// + Permite implementar múltiples tipos
// ---- Es más dificil
