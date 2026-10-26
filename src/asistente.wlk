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
  
  /* Apliqué el MANEJO DE ERRORES en el método comprar(), ya que cuando un asistente no 
  tiene saldo positivo se lanza una excepción para notificar que la compra no se ha podido 
  realizar y no se modifica ni el dinero disponible, ni se agrega la entrada al historial de entradas
  */

  method comprar(entrada) {
    if (self.puedeComprar()) {
      self.modificarDinero(-abono.precioSegunAbono(entrada.precioAlPublico()))
      historialEntradas.add(entrada)
    } else {
       throw new NoTieneDineroDisponibleException(
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
  ).size()
  
  method recudadacion() = historialEntradas.map(
    { entrada => entrada.precioAlPublico() }
  ).sum()

  method bonificar() {
  abono.bonificar()
}
}

/* Tanto en el objeto fan como en la clase vip, se está aplicando el POLIMORFISMO ya 
que asistente accede al método precioSegunAbono sin importar que el abono sea fan o vip 
porque ambos entiende este mensaje*/

object fan {
  method precioSegunAbono(precio) = precio
  method bonificar(){}
}
/* Como hay un descuento diferente para cada asistente con abono vip creamos una clase y 
no un objeto como en fan que el precioConAbono es siempre el mismo para este tipo de abono*/

class Vip {
  var porcentajeDescuento
  method precioSegunAbono(precio) = precio - ((precio * porcentajeDescuento) / 100)
  method bonificar() {
  porcentajeDescuento += 1
}
}