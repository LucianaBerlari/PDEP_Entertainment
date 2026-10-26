import productora.*

class Entrada {
  const property banda
  const property fecha
  const precioBase = 1000
  /* Acá se ve marcada la RESPONSABILIDAD entre entrada y de la productora.
  La de la entrada es calcular el precio al público y para eso simplemente accede al impuesto, 
  pero la productora es quien lo administra y lo modifica.
  Además, cuando se modifica el impuesto, no se necesita actualizar todas las entradas
  */
  method precioAlPublico() = precioBase + productora.impuesto()
}