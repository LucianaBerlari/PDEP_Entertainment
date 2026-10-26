// Utilizo clase porque voy a tener muchas bandas
class Banda {
  const property nombre
  
  method canon() = 1000000
  
  method presupuesto() = self.canon() + self.gastoExtra()
  
  method popularidad()
  
  method gastoExtra()
}

// Aca estoy usando HERENCIA porque hay comportamiento que comparten pero con alguna leve diferencia. Como las bandas son 
class BandaDeRock inherits Banda {
  var cantidadSolosGuitarra
  
  override method gastoExtra() = 10000
  
  override method popularidad() = 100 * cantidadSolosGuitarra
}

class BandaDeTrap inherits Banda {
  var tieneHielo
  
  override method canon() = super() * self.popularidad()
  
   override method gastoExtra() = 0

  override method popularidad() {
    if (tieneHielo) {
      return 1000
    } else {
      return 0
    }
  }
  
}

class BandaIndie inherits Banda {
    var cantidadInstrumentos
   override method popularidad() = 3.14 * nombre.size()
   override method gastoExtra() = 500 * cantidadInstrumentos 
}