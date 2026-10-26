/* Acá se utiliza el concepto HERENCIA. Por un lado tenemos una superclase abstracta, Banda, que contiene el 
comportamiento y el estado que comparten y entienden todos los tipos de bandas */

class Banda {
  const property nombre
  
  method canon() = 1000000
  
  method presupuesto() = self.canon() + self.gastoExtra()
  
  method popularidad()
  
  method gastoExtra()
}

/* BandaDeRock, BandaDeTrap y BandaIndie heredan el parte del comportamiento de Banda, y también redefinen algunos métodos */
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


/* También se ve aplicado el POLIMORFISMO porque gastoExtra() y popularidad() producen distintos resultado según 
la clase de banda que sea pero todas entienden el mensaje */