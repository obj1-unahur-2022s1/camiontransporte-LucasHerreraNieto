import cosas.*

object camion {
	var cosasCargadas  = []
	const property pesoTara = 1000
	
	method objetoMasPeligroso() = cosasCargadas.max({c=>c.peligrosidad()})
	method superaElNivelDePeligrosidad(unNivel) = self.objetoMasPeligroso().peligrosidad() > unNivel
	method pesoDeLaCarga() = cosasCargadas.sum({c=>c.peso()})
	method cargar(unaCosa) { cosasCargadas.add(unaCosa)}
	method descargar(unaCosa) { cosasCargadas.remove(unaCosa)}
	method todoPesoPar() = cosasCargadas.all({c=>c.peso().even()})
	method hayAlgunoQuePesa(peso) = cosasCargadas.any({c=>c.peso() == peso})
	method elDeNivel(nivel) = cosasCargadas.find({c=>c.peligrosidad() == nivel})
	method pesoTotal() = self.pesoDeLaCarga() + pesoTara
	method excedidoDePeso() = self.pesoTotal() > 2500
	method objetosQueSuperanPeligrosidad(nivel) = cosasCargadas.filter({c=>c.peligrosidad() > nivel})
	method objetosMasPeligrososQue(cosa) = self.objetosQueSuperanPeligrosidad(cosa.peligrosidad())
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = !self.excedidoDePeso() and !self.superaElNivelDePeligrosidad(nivelMaximoPeligrosidad)
	method tieneAlgoQuePesaEntre(min, max) = cosasCargadas.any({c=>c.peso().between(min,max)})
	method cosaMasPesada() = cosasCargadas.max({c=>c.peso()})
	method pesos() = cosasCargadas.map({c=>c.peso()})
}
