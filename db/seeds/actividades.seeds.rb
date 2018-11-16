puts 'Creando actividades'
ActivedRecord::Base.connection.execute('TRUNCATE TABLE activities')

Activity.create([
    {
        name: 'Ejecutar los acuerdos, resoluciones del Presidente de la junta de Fiscales Superiores sobre materia administrativa.',
        area_id: 1
    },
    {
        name: 'Dirigir, programar y coordinar las actividades administrativas del Distrito Fiscal.',
        area_id: 1
    },
    {
        name: 'Aprobar la Toma de Inventario Físico de Bienes Patrimoniales del Distrito Fiscal.',
        area_id: 1
    },
    {
        name: 'Redactar documentos administrativos de acuerdo a las indicaciones impartidas.',
        area_id: 1
    },
    {
        name: 'Efectuar el registro de los Gastos Operativos rendidos por los Fiscales de la Jurisdicción.',
        area_id: 1
    },
    {
        name: 'Elaborar los informes trimestrales para el portal financiero.',
        area_id: 1
    },
    {
        name: 'Revisar la documentación para la sustentación de las ampliaciones presupuestarias para el Distrito Fiscal.',
        area_id: 1
    },
    {
        name: 'Elaborar los cuadros de programación mensualmente.',
        area_id: 1
    },

])

Activity.create([
    {
        name: 'Verificar los Estados Financieros y de Ejecución Presupuestal de la Institución.',
        area_id: 2
    },
    {
        name: 'Administrar y supervisar el uso de los recursos financieros en función a la política Institucional.',
        area_id: 2
    },
    {
        name: 'Supervisar las actividades de los sistemas de contabilidad y tesorería.',
        area_id: 2
    },
    {
        name: 'Emitir informes de carácter financiero, presupuestal y patrimonial de la gestión realizada.',
        area_id: 2
    },
    {
        name: 'Mantener informado al Gerente General de Finanzas sobre le desarrollo de las actividades realizadas.',
        area_id: 2
    },
    {
        name: 'Planificar, dirigir, coordinar y controlar las actividades contables patrimoniales.',
        area_id: 2
    },
    {
        name: 'Asesorar u orientar sobre los aspectos de gastos sobre los estados financieros.',
        area_id: 2
    },

])

Activity.create([
    {
        name: 'Supervisar y controlar el archivo de los expedientes de contratación.',
        area_id: 3
    },
    {
        name: 'Entrevista y contratación de personal mediante la convocatoria de personal en toda la región.',
        area_id: 3
    },
    {
        name: 'Control de asistencia del personal que labora en la sede y dependencias fiscales.',
        area_id: 3
    },
    {
        name: 'Capacitaciones de personal en las diferentes labores que realiza.',
        area_id: 3
    },
    {
        name: 'Evaluación de desempeño laboral del personal asignados a cada oficina.',
        area_id: 3
    },
    {
        name: 'Asesoría de planes, objetivos para el cumplimiento de las actividades de la organización.',
        area_id: 3
    },
    {
        name: 'Apoyar en el seguimiento de documentos emitidos y recibidos de las distintas oficinas.',
        area_id: 3
    },
    {
        name: 'Mantener informado de las actividades al Gerente.',
        area_id: 3
    },
    {
        name: 'Proponer o aplicar según sea el caso sanciones disciplinarias para el personal a su cargo.',
        area_id: 3
    },

])

Activity.create([
    {
        name: 'Realiza soporte técnico a toda la sede y dependencias fiscales.',
        area_id: 4
    },
    {
        name: 'Planificación e implementación de sistemas de Información (SWGP, SWCZ, SDGD).',
        area_id: 4
    },
    {
        name: 'Asegurar la comunicación de la sede Ayacucho y las dependencias fiscales.',
        area_id: 4
    },
    {
        name: 'Supervisar las distintas tecnologías de información de la organización.',
        area_id: 4
    },
    {
        name: 'Realizar informes técnicos de gestión de los TIC de la organización.',
        area_id: 4
    },
    {
        name: 'Redactar documentos oficios, cartas, informes, solicitudes de adquisición de equipos de cómputos',
        area_id: 4
    },
    {
        name: 'Realizar mantenimientos de los sistemas de información de la organización.',
        area_id: 4
    },
    {
        name: 'Implementación del sistema Documental (GDMP).',
        area_id: 4
    },
    {
        name: 'Proponer mejoras en la metodología de desarrollo de sistemas orientadas a su actualización.',
        area_id: 4
    },

])

Activity.create([
    {
        name: 'Recepción y revisión de bienes y/o materiales enviados desde la sede central.',
        area_id: 5
    },
    {
        name: 'Almacenamiento de los bienes.',
        area_id: 5
    },
    {
        name: 'Control y monitoreo de los bienes y/o materiales.',
        area_id: 5
    },
    {
        name: 'Recepción y atención de las ordenes de pedido las distintas oficinas.',
        area_id: 5
    },
    {
        name: 'Emitir informes mensuales, sobre el movimiento de almacén (Ingreso, Salidas y Saldos).',
        area_id: 5
    },
    {
        name: 'Mantener actualizado el Catálogo Único de Bienes y Servicios de la Institución.',
        area_id: 5
    },
    {
        name: 'Orientar y/o brindar información sobre la atención de requerimientos.',
        area_id: 5
    },

])

Activity.create([
    {
        name: 'Elaborar, emitir y recepcionar las hojas de rutas para la entrega de notificaciones.',
        area_id: 6
    },
    {
        name: 'Notificaciones judiciales entregadas a los ciudadanos.',
        area_id: 6
    },
    {
        name: 'Informes de los estados de los casos judiciales.',
        area_id: 6
    },
    {
        name: 'Registro de denuncias y quejas.',
        area_id: 6
    },
    {
        name: 'Asignar y derivar  caso judiciales a la fiscalía competente.',
        area_id: 6
    },
    {
        name: 'Control y monitoreo de procesos judiciales.',
        area_id: 6
    },
    {
        name: 'Realizar auditoria a las distintas oficinas.',
        area_id: 6
    },
    {
        name: 'Realizar convocatorias de empleo.',
        area_id: 6
    },

])


Activity.create([
    {
        name: 'Preparación de ordenes de los bienes y/o servicios.',
        area_id: 7
    },
    {
        name: 'Envió y control de los bienes y/o materiales  a las distintas oficinas.',
        area_id: 7
    },
    {
        name: 'Registrar el envió como entregado.',
        area_id: 7
    },
    {
        name: 'Preparación de informes de control de los bienes y/o servicios a la gerencia general.',
        area_id: 7
    },
    {
        name: 'Realizar estudios de posibilidades  que ofrece el mercado',
        area_id: 7
    },
    {
        name: 'Suscribir las órdenes de compra en forma mancomunada con la Gerencia de Abastecimiento.',
        area_id: 7
    },

])

Activity.create([
    {
        name: 'Promocionar los servicios que se brinda mediante la web.',
        area_id: 8
    },
    {
        name: 'Realización de campañas de prevención ante el delito civil y penal.',
        area_id: 8
    },
    {
        name: 'Programas de fiscales escolares.',
        area_id: 8
    },
    {
        name: 'Publicaciones de actividades del Ministerio Público vía web.',
        area_id: 8
    },
    {
        name: 'Promover y dar seguimiento a programas juveniles.',
        area_id: 8
    },
    {
        name: 'Emitir comunicados de prensa en radio y televisión de carácter oficial.',
        area_id: 8
    },
    {
        name: 'Realizar y diseñar videos Institucionales.',
        area_id: 8
    },
    {
        name: 'Colaborar y apoyar en la difusión y anuncios de la buena imagen del Ministerio Público.',
        area_id: 8
    },

])

Activity.create([
    {
        name: 'Atención y defensa de los ciudadanos.',
        area_id: 9
    },
    {
        name: 'Administrar los casos judiciales a cargo de los fiscales en turno.',
        area_id: 9
    },
    {
        name: 'Servicios de atención clínico forense.',
        area_id: 9
    },
    {
        name: 'Investigación de casos perito criminalistico.',
        area_id: 9
    },
    {
        name: 'Realizar denuncia vía web.',
        area_id: 9
    },
    {
        name: 'Convenios de cooperación con otras entidades del estado.',
        area_id: 9
    },
    {
        name: 'Consulta de detenidos y sentenciados.',
        area_id: 9
    },
    {
        name: 'Programa de atención y asistencia a víctimas y testigos.',
        area_id: 9
    },
    {
        name: 'Buzón de sugerencias.',
        area_id: 9
    },
    {
        name: 'Información de casos fiscales.',
        area_id: 9
    },

])


