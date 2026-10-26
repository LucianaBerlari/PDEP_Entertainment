object productora {
  var property impuesto = 0
  const asistentes = #{}  
  const bandas = #{} 
  
/* Acá se aplican el concepto de DELEGACIÓN porque tanto los métodos auxiliares como en los principales que 
  se pidieron en la consigna, envían mensajes a los objetos o clases que cuentan con la información para 
  hacer las operaciones necesarias
  */

  method recaudacionPorAsistentes() = asistentes.map({asistente => asistente.recudadacion()}).sum()
  method presupuestoDeTodasLasBandas() = bandas.map({banda => banda.presupuesto()}).sum()
  method gananciaTotal()= self.recaudacionPorAsistentes() - self.presupuestoDeTodasLasBandas()

  method cantidadEntradasVendidas() = asistentes.map({asistente => asistente.cantidadEntradasVendidas()}).sum()

  method cantidadEntradasVendidasDe(banda) = asistentes.map({asistente => asistente.cantidadEntradasVendidasDe(banda)   }).sum()
  method bandaMasPoular() = bandas.max({banda => self.cantidadEntradasVendidasDe(banda)}) 

  /* Aparece de nuevo el POLIMORFISMO ya que la productora no necesita ni tiene que sabe qué asistentes son bonificados VIP y cuáles no. 
  Simplemente cada bono sabe cómo actuar ante ese mensaje*/
  method bonificar() = asistentes.forEach({asistente => asistente.bonificar()})
}
