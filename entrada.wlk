import productora.*

class Entrada {
  const property banda
  const property fecha = new Date()
  const precioBase
  // Aca estoy usando responsabilidad(??)
  method precioAlPublico() = precioBase + productora.impuesto() // el impuesto cambia cuadno la productora lo determina, es RESPONSABILIDAD de esta modificarlo y no de cada entrada 
}