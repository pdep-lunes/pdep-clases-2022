class Estudiante {
	const notas = []
	const materiasCursadas = []
	
	method promedioDeNotas() {
    return notas.sum() / notas.size()
  }
  
  method esEjemplar() {
    return notas.all({ nota => nota >= 8 })
  }
  
  method cantidadDeExamenesDesaprobados() {
    return notas.count({ nota => nota < 6 })
  }
  
  method proximasMaterias() {
    return materiasCursadas.map({ materia => materia + "I" })
  }
  
  method agregarNota(unaNota) {
    notas.add(unaNota)
  }	
}

class Oyente {
  method esEjemplar() {
    return true
  }
  
  method promedioDeNotas() {
    return 10
  }
  
  method turnoDisponible() {
    return "Noche"
  }
}

const lucia = new Estudiante(notas = [8, 8, 8, 8], materiasCursadas = ["Análisis Matemático I", "Física II"])
const juan  = new Estudiante(notas = [4, 7, 9, 9], materiasCursadas = ["Programación II", "Sistemas Operativos I", "Análisis Matemático I"])
const perla = new Estudiante(notas = [4, 7, 9, 9], materiasCursadas = ["Programación II", "Sistemas Operativos I", "Análisis Matemático I"])
const ingresante = new Estudiante()
const otroIngresante = new Estudiante()
const unOyente = new Oyente()
