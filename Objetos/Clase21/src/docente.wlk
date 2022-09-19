import estudiante.*

object docente {
	var cfd = 3// Coeficiente de Felicidad Docente
	const estudiantes = #{}
	
	method estudiantesEjemplares() {
	  return estudiantes.filter({ estudiante => estudiante.esEjemplar() })
	}
	
	method promedioDelCurso() {
	  return estudiantes.sum({ estudiante => estudiante.promedioDeNotas() }) / estudiantes.size()
	}
	
	method evaluarEstudiantes() {
	  estudiantes.forEach({ estudiante => estudiante.agregarNota(self.notaDelExamenSorpresa()) })
	}
	
	method notaDelExamenSorpresa() {
	  return cfd + self.promedioDelCurso()
	}
}
