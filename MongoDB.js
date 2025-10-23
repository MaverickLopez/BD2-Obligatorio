//7)
//a, b, c)
db.reparaciones.insertMany([
  {
    IdRepara: 301,
    NumSerie: "SN1001",
    IdProd: 1,
    Eventos: [
      { Fecha: ISODate("2025-06-10T09:00:00Z"), Descripcion: "Reemplazo de pieza: fuente de poder" },
      { Fecha: ISODate("2025-06-11T13:00:00Z"), Descripcion: "Prueba funcional exitosa" }
    ],
    NotasTecnico: [
      { Autor: "Juan Pérez", Fecha: ISODate("2025-06-10T08:45:00Z"), Nota: "El equipo no encendía. Fuente quemada." }
    ],
    Adjuntos: [
      { Tipo: "Imagen", NombreArchivo: "fuente_quemada.jpg", URL: "https://example.com/fuente_quemada.jpg" },
      { Tipo: "Informe", NombreArchivo: "informe_tecnico.pdf", URL: "https://example.com/informe_tecnico.pdf" }
    ]
  },
  {
    IdRepara: 302,
    NumSerie: "SN1002",
    IdProd: 2,
    Eventos: [
      { Fecha: ISODate("2025-06-12T10:15:00Z"), Descripcion: "Se limpió con aire comprimido" },
      { Fecha: ISODate("2025-06-12T11:00:00Z"), Descripcion: "Reemplazo de pieza: ventilador" }
    ],
    NotasTecnico: [
      { Autor: "Ana Torres", Fecha: ISODate("2025-06-12T09:50:00Z"), Nota: "El ventilador hacía ruido excesivo." }
    ],
    Adjuntos: [
      { Tipo: "Imagen", NombreArchivo: "ventilador_nuevo.jpg", URL: "https://example.com/ventilador_nuevo.jpg" }
    ]
  },
  {
    IdRepara: 303,
    NumSerie: "SN1003",
    IdProd: 3,
    Eventos: [
      { Fecha: ISODate("2025-06-13T14:00:00Z"), Descripcion: "Revisión de placa base" },
      { Fecha: ISODate("2025-06-13T15:30:00Z"), Descripcion: "Se cambió la placa base" }
    ],
    NotasTecnico: [
      { Autor: "Luis Tech", Fecha: ISODate("2025-06-13T13:45:00Z"), Nota: "Diagnóstico muestra cortocircuito en placa base." }
    ],
    Adjuntos: [
      { Tipo: "Imagen", NombreArchivo: "placa_antes.jpg", URL: "https://example.com/placa_antes.jpg" },
      { Tipo: "Imagen", NombreArchivo: "placa_despues.jpg", URL: "https://example.com/placa_despues.jpg" }
    ]
  },
  {
    IdRepara: 304,
    NumSerie: "SN1004",
    IdProd: 4,
    Eventos: [
      { Fecha: ISODate("2025-06-14T16:00:00Z"), Descripcion: "Actualización de firmware" }
    ],
    NotasTecnico: [],
    Adjuntos: []
  },
  {
    IdRepara: 305,
    NumSerie: "SN1005",
    IdProd: 2,
    Eventos: [
      { Fecha: ISODate("2025-06-15T09:30:00Z"), Descripcion: "Reemplazo de pieza: módulo de red" }
    ],
    NotasTecnico: [
      { Autor: "Camila Duarte", Fecha: ISODate("2025-06-15T09:00:00Z"), Nota: "El módulo no detectaba señal." }
    ],
    Adjuntos: [
      { Tipo: "Informe", NombreArchivo: "pruebas_red.pdf", URL: "https://example.com/pruebas_red.pdf" }
    ]
  }
])

//a)
db.reparaciones.find({ IdRepara: 302 })

//b)
db.reparaciones.find({
  Eventos: {
    $elemMatch: {
      Descripcion: { $regex: "placa", $options: "i" }  // case insensitive
    }
  }
})

//c)
db.reparaciones.find({
  Adjuntos: {
    $elemMatch: {
      Tipo: "Imagen"
    }
  }
})

//d)
db.reparaciones.countDocuments({
  Eventos: {
    $elemMatch: {
      Descripcion: { $regex: "Reemplazo de pieza", $options: "i" }
    }
  }
})

db.reparaciones.countDocuments({
  Eventos: {
    $elemMatch: {
      Descripcion: { $regex: "placa madre", $options: "i" }
    }
  }
})

