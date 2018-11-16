# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creando fuerzas'
ActiveRecord::Base.connection.execute('TRUNCATE TABLE forces')

Force.create([
    {
        name: 'Amenazas de Presupuesto del Gobierno Central'
    },
    {
        name: 'Poder de Negociación de los Clientes'
    },
    {
        name: 'Rivalidad entre Competidores'
    },
    {
        name: 'Poder de negociación de Proveedores'
    },
    {
        name: 'Amenazas de Productos/Servicios Sustitutos'
    },
    
])
