object knightRider {

	method peso() =  500
	method peligrosidad() = 10
	method cantBultos() = 1
	method consecuenciaDeCarga() {}
}

object bumblebee {
	var esRobot = false
	
	method esRobot() = esRobot
	method transformar() {esRobot = !esRobot }
	method peso() = 800
	method peligrosidad() = if(esRobot){30}else{15}
	method cantBultos() = 2
	method consecuenciaDeCarga() {esRobot = true}
}

object paqueteLadrillos{
	var property cantidadLadrillos = 0
	
	method peso() = cantidadLadrillos*2
	method peligrosidad() = 2
	method cantBultos() = if(cantidadLadrillos.between(0,100)){1}else if(cantidadLadrillos.between(101,300)){2}else{3}
	method consecuenciaDeCarga() {cantidadLadrillos += 12}
}


object arena {
	var property peso = 0
	
	method cantBultos() = 1
	method peligrosidad() = 1
	method consecuenciaDeCarga(){peso += 20}
}

object bateriaAntiaerea {
	var estaCargada  = false
	
	method estaCargada() = estaCargada
	method cargar() {estaCargada = true}
	method peso() = if(estaCargada){300}else{200}
	method peligrosidad() = if(estaCargada){100}else{0}
	method cantBultos() = if(estaCargada){2}else{1}
	method consecuenciaDeCarga() {estaCargada = true}
}

object contenedor {
	var cosasContenidas = []
	
	method cosasContenidas() = cosasContenidas
	method agregarElemento(unElemento) { cosasContenidas.add(unElemento)}
	method sacarElemento(unElemento) { cosasContenidas.remove(unElemento)} 
	method peso() = 100 + cosasContenidas.sum({c=>c.peso()})
	method peligrosidad() = if(!cosasContenidas.isEmpty()){self.objetoMasPeligroso().peligrosidad()}else{0}
	method objetoMasPeligroso() = cosasContenidas.max({c=>c.peligrosidad()})
	method cantBultos() = 1 + cosasContenidas.cantBultos()
	method consecuenciaDeCarga() {cosasContenidas.forEach({c=>c.consecuenciaDeCarga()})}
}

object residuosRadioactivos {
	var property peso = 0
	
	method cantBultos() = 1
	method peligrosidad() = 200
	method consecuenciaDeCarga() {peso += 15}
}

object embalajeSeguridad {
	var property objetoEnvuelto
	
	method peso() = objetoEnvuelto.peso()
	method peligrosidad() = objetoEnvuelto.peligrosidad()/2
	method cantBultos() = 2
	method consecuenciaDeCarga() {}
}


