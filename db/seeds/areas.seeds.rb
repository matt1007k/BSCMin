puts 'Creando areas'
ActivedRecord::Base.connection.execute('TRUNCATE TABLE areas')

Area.create([
    {
        name: 'Administración del Distrito Fiscal'
    },
    {
        name: 'Finanzas'
    },
    {
        name: 'Administración del Recursos Humanos'
    },
    {
        name: 'Tecnologías y Desarrollo de Sistemas de Información'
    },
    {
        name: 'Logística Interna'
    },
    {
        name: 'Operaciones'
    },
    {
        name: 'Logística Externa'
    },
    {
        name: 'Marketing'
    },
    {
        name: 'Servicios'
    },
])