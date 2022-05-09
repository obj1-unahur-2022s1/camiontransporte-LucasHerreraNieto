object knightRider {

	method peso() =  500
	method peligrosidad() = 10
}

object bumblebee {
	var esRobot = false
	method transformar() {esRobot = !esRobot }
	method peso() = 800
	method peligrosidad() = if(esRobot){30}else{15}
}

object paqueteLadrillos{
	var property cantidadLadrillos 
	
	method peso() = cantidadLadrillos*2
	method peligrosidad() = 2
}


object arena {
	var property peso 
	
	method peligrosidad() = 1
}

object bateriaAntiaerea {
	var estaCargada  = false
	
	method cargar() {estaCargada = true}
	method peso() = if(estaCargada){300}else{200}
	method peligrosidad() = if(estaCargada){100}else{0}
	
}

object contenedor {
	var cosasContenidas = []
	
	method cosasContenidas() = cosasContenidas
	method agregarElemento(unElemento) { cosasContenidas.add(unElemento)}
	method sacarElemento(unElemento) { cosasContenidas.remove(unElemento)} 
	method peso() = 100 + cosasContenidas.sum({c=>c.peso()})
	method peligrosidad() = if(!cosasContenidas.isEmpty()){self.objetoMasPeligroso().peligrosidad()}else{0}
	method objetoMasPeligroso() = cosasContenidas.max({c=>c.peligrosidad()})
}

object residuosRadioactivos {
	var property peso 
	
	method peligrosidad() = 200
}

object embalajeSeguridad {
	var property objetoEnvuelto
	
	method peso() = objetoEnvuelto.peso()
	method peligrosidad() = objetoEnvuelto.peligrosidad()/2
}




