object productora {
  var property impuesto = 0
  var asistentes = #{}  // uso coleccion porque no se van a repetir los asistentes 
  var bandas = #{} 
  
  method recaudacionPorAsistentes() = asistentes.map({asistente => asistente.recudadacion()}).sum()
  method presupuestoDeTodasLasBandas() = asistentes.map({asistente => asistente.presupuesto()}).sum()
  method gananciaTotal()= self.recaudacionPorAsistentes() - self.presupuestoDeTodasLasBandas()

  method cantidadEntradasVendidas() = asistentes.map({asistente => asistente.cantidadEntradasVendidas()}).sum()

  method bandaMasPoular() = bandas.max({banda => banda.cantidadEntradasVendidasDe(banda)}) // hay alguna aclaracion de que no hay 
}