object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	method peso() = 800
	method nivelPeligrosidad() = if (esAuto) nivelAuto else nivelRobot
	var property esAuto = true
	const nivelAuto = 15
	const nivelRobot = 30
}

object paqueteLadrillos {
	const pesoLadrillos = 2
	method peso() = cantidadLadrillos * pesoLadrillos
	method nivelPeligrosidad() = 2
	var cantidadLadrillos = 0

	method cantidadLadrillos (_cantidadLadrillos){
		cantidadLadrillos = _cantidadLadrillos
	}
}

object arenaGranel {
	var property peso = 0
	method peso() = peso
	method nivelPeligrosidad() = 1
}

object bateriaAntiaerea {
	method peso() = if (estaConMisiles) 300 else 200
	var property estaConMisiles = true
	method nivelPeligrosidad() = if (estaConMisiles) 100 else 0
}

object contenedorPortuario {
	const property cosasQueLleva = []
	method pesoDeCosasQueLleva() = cosasQueLleva.sum({cosa => cosa.nivelPeligrosidad()})
	method peso() = 100 + self.pesoDeCosasQueLleva()
	method nivelPeligrosidad() = cosasQueLleva.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
}

object residuosRadioactivos {
	var property peso = 0
	method peso() = peso
	method nivelPeligrosidad() = 200
}

object embalajeSeguridad {
	var property cosaQueEnvuelve = null
	method peso(){
		self.validarQueEnvuelveAlgo() 
		return cosaQueEnvuelve.peso()
	} 
	method nivelPeligrosidad() = cosaQueEnvuelve.nivelPeligrosidad() / 2

	method validarQueEnvuelveAlgo() = if (cosaQueEnvuelve.notnull()) self.error("El embalaje no está envolviendo nada")
}