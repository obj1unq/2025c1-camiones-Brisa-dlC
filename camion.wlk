import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method todoPesoPar() = cosas.all({cosa => cosa.peso().even()})

	method hayAlgunoQuePesa(peso) = cosas.anybody({cosa => cosa.peso() == peso})

	
}
