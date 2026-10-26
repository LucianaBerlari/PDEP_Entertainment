import NoTieneDineroDisponibleException.*
import banda.*

class Asistente {
  var abono
  var property historialEntradas = #{}
  var dineroDisponible
  
  method puedeComprar() = dineroDisponible > 0
  
  method modificarDinero(operacion) {
    dineroDisponible += operacion
  }
  
  method comprar(entrada) {
    if (self.puedeComprar()) {
      self.modificarDinero(abono.precioSegunAbono(entrada.precioAlPublico()))
      historialEntradas.add(entrada)
    } else {
      return throw new NoTieneDineroDisponibleException(
        message = "No tiene dinero disponible"
      )
    }
  }
  
  method entradasAñoAnterior() = historialEntradas.filter(
    { entrada => entrada.fecha().year() == (new Date().year() - 1) }
  )
  
  method nombreBandasPorLasQueComproUnaEntrada() = historialEntradas.map(
    { entrada => entrada.banda() }
  ).map({ banda => banda.nombre() })
  
  method cantidadEntradasVendidas() = historialEntradas.size()
  
  method cantidadEntradasVendidasDe(banda) = historialEntradas.filter(
    { entrada => entrada.banda() == banda }
  ).sum()
  
  method recudadacion() = historialEntradas.map(
    { entrada => entrada.precioAlPublico() }
  ).sum()
}

object fan {
  method precioSegunAbono(precio) = precio
}
// Tenemos un descuento diferente para cada asistente con abono vip por eso creamos una clase y no un objeto como en fan 

class Vip {
  var porcentajeDescuento
  method precioSegunAbono(precio) = precio + ((precio * porcentajeDescuento) / 100)
}