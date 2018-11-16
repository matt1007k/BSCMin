puts 'Creando factores'
ActivedRecord::Base.connection.execute('TRUNCATE TABLE factors')

Factor.create([
    {
        name: 'Presupuesto reducido otorgado por el gobierno.',
        area_id: 1
    },
    {
        name: 'Inversión de empresas privadas en la región.',
        area_id: 1
    },

])

Factor.create([
    {
        name: 'Llegar a un acuerdo que beneficie a ambas partes.',
        area_id: 2
    },
    {
        name: 'Eficiencia en la calidad de servicio.',
        area_id: 2
    },

])

Factor.create([
    {
        name: 'No existe un servicio de asistencia legal presencial o a distancia las 24hrs.',
        area_id: 3
    },
    {
        name: 'Abogados o bufetes de abogados que ofrecen la servicios de defensa.',
        area_id: 3
    },
    {
        name: 'Profesional con conocimiento en el proceso legal.',
        area_id: 3
    },
])

Factor.create([
    {
        name: 'Disponibilidad de proveedores de bienes y materiales.',
        area_id: 4
    },
    {
        name: 'Procuradores o notarios, entendidos como proveedores necesarios para prestar determinados servicios jurídicos.',
        area_id: 4
    },
    {
        name: 'Variación del precio de bienes y/o materiales.',
        area_id: 4
    },

])

Factor.create([
    {
        name: 'Incremento de servicios de abogados o bufetes de abogado.',
        area_id: 5
    },

])

