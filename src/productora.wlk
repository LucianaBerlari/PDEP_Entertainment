object productora {
  var property impuesto = 0
  const asistentes = #{}  
  const bandas = #{} 
  
  /* Aca se aplican el concepto de DELEGACION poeque tanto los metodos auxiliares como en los principales que 
  se pidieron en la consigna, envian mensajes a los objetos o clases que cuentan con la informacion para 
  hacer las operaciones necesarias
  */

  method recaudacionPorAsistentes() = asistentes.map({asistente => asistente.recudadacion()}).sum()
  method presupuestoDeTodasLasBandas() = bandas.map({banda => banda.presupuesto()}).sum()
  method gananciaTotal()= self.recaudacionPorAsistentes() - self.presupuestoDeTodasLasBandas()

  method cantidadEntradasVendidas() = asistentes.map({asistente => asistente.cantidadEntradasVendidas()}).sum()

  method cantidadEntradasVendidasDe(banda) = asistentes.map({asistente => asistente.cantidadEntradasVendidasDe(banda)   }).sum()
  method bandaMasPoular() = bandas.max({banda => self.cantidadEntradasVendidasDe(banda)}) 

  /* Aparece de nuevo el POLIMORFISMO ya que la productora no necesita ni tiene que sabe que asistentes son bonificados vio y cuales no. 
  Simplemenete cada bono sabe como actuar ante ese mensaje*/
  method bonificar() = asistentes.forEach({asistente => asistente.bonificar()})
}
