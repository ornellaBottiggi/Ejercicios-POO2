CODIGO DEL ARCHIVO .ST:

!classDefinition: #Tests category: #TP2UML_OrnellaBottiggi!
TestCase subclass: #Tests
	instanceVariableNames: 'empresa empleadoPermanente empleadoTemporario empleadoContratado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2UML_OrnellaBottiggi'!

!Tests methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 22:20:54'!
setUp

"Crear una instancia de Empresa"
empresa := Empresa conNombre:  'TechCorp' conCuit: '30-12345678-9'.

"Crear empleados"
empleadoPermanente := EmpleadoPermanente conNombre: 'Juan Perez' conDireccion: 'Calle Falsa 123' conEstadoCivil: 'Casado' conFechaNacimiento: 2000 conSueldoBasico: 2000.
empleadoPermanente agregarCantidadDeHijos: 2 conAntiguedad: 10.

empleadoTemporario := EmpleadoTemporal conNombre: 'Maria Gomez' conDireccion: 'Av. Siempre Viva 456' conEstadoCivil: 'Soltera' conFechaNacimiento: 1990 conSueldoBasico: 1500.
empleadoTemporario agregarFechaFinDesignacion: '2024-12-31' asDate conCantidadDeHorasExtras: 10.

empleadoContratado := EmpleadoContratado conNombre: 'Carlos Lopez' conDireccion:  'Ruta 66' conEstadoCivil: 'Casado' conFechaNacimiento: 2003
 conSueldoBasico: 1800.
empleadoContratado agregarnroDeContrato: 001 conMedioDePago: 'Transferencia Bancaria'.

"Agregar empleados a la empresa"
empresa agregarEmpleado: empleadoPermanente.
empresa agregarEmpleado: empleadoTemporario.
empresa agregarEmpleado: empleadoContratado.! !

!Tests methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 22:21:15'!
test_calcularElTotalDeSueldosNetos
	
	Assert that: empresa calcularTotalSueldosNetos isEqualTo: 5545.! !

!Tests methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 22:25:21'!
test_liquidarSueldos
	
	empresa liquidarSueldos.
	Assert that: empresa cantRecibos isEqualTo: 3.! !


!classDefinition: #Empleado category: #TP2UML_OrnellaBottiggi!
Object subclass: #Empleado
	instanceVariableNames: 'nombre direccion estadoCivil fechaNacimiento sueldoBasico'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2UML_OrnellaBottiggi'!

!Empleado methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 21:36:12'!
calcularRetenciones 
        
	^ self subclassResponsibility ! !

!Empleado methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 19:52:28'!
calcularSueldoBruto 
        
	self subclassResponsibility.! !

!Empleado methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 21:36:49'!
calcularSueldoNeto 
        
	^ (self calcularSueldoBruto - self calcularRetenciones).! !

!Empleado methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 21:26:08'!
direccion
	
	^ direccion! !

!Empleado methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 22:22:14'!
edad
"no se calculó con toda la fecha ya que cuesta mucho trabajar con ellas. no encontré como"
	^ (2024) - (fechaNacimiento)! !

!Empleado methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 22:15:43'!
initializeconNombre: unNombre conDireccion: unaDireccion conEstadoCivil: unEstado conFechaNacimiento: unaFecha conSueldoBasico: unNumero
	
	nombre := unNombre.
	direccion := unaDireccion.
	estadoCivil := unEstado.
	fechaNacimiento := unaFecha.
	sueldoBasico := unNumero.
	! !

!Empleado methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 21:26:00'!
nombre
	
	^ nombre! !

!Empleado methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 19:48:02'!
sueldoBasico
	
	^sueldoBasico ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empleado class' category: #TP2UML_OrnellaBottiggi!
Empleado class
	instanceVariableNames: ''!

!Empleado class methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 19:46:17'!
conNombre: unNombre conDireccion: unaDireccion conEstadoCivil: unEstado conFechaNacimiento: unaFecha conSueldoBasico: unNumero

	^ self new initializeconNombre: unNombre conDireccion: unaDireccion conEstadoCivil: unEstado conFechaNacimiento: unaFecha conSueldoBasico: unNumero
! !


!classDefinition: #EmpleadoContratado category: #TP2UML_OrnellaBottiggi!
Empleado subclass: #EmpleadoContratado
	instanceVariableNames: 'nroContrato medioDePago'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2UML_OrnellaBottiggi'!

!EmpleadoContratado methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 21:31:51'!
agregarnroDeContrato: unNumero conMedioDePago: unMedioDePago

        nroContrato := unNumero.
        medioDePago := unMedioDePago.! !

!EmpleadoContratado methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 21:33:10'!
calcularRetenciones
	
	^ 50 ! !

!EmpleadoContratado methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 21:32:33'!
calcularSueldoBruto
	
	^ self sueldoBasico ! !


!classDefinition: #EmpleadoPermanente category: #TP2UML_OrnellaBottiggi!
Empleado subclass: #EmpleadoPermanente
	instanceVariableNames: 'cantidadDeHijos antiguedad'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2UML_OrnellaBottiggi'!

!EmpleadoPermanente methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 20:16:34'!
agregarCantidadDeHijos: unaCantidad conAntiguedad: unaAntiguedad

        cantidadDeHijos := unaCantidad.
        antiguedad := unaAntiguedad.! !

!EmpleadoPermanente methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 19:57:38'!
antiguedad 
	
	^ antiguedad! !

!EmpleadoPermanente methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 22:00:35'!
calcularRetenciones 
        
	^(self calcularSueldoBruto * 0.10) + (cantidadDeHijos * 20) + (self calcularSueldoBruto * 0.15).
    ! !

!EmpleadoPermanente methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 20:17:55'!
calcularSueldoBruto
	
        ^sueldoBasico + (cantidadDeHijos * 150) + (estadoCivil = 'Casado' ifTrue: [100] ifFalse: [0]) + (antiguedad * 50).! !

!EmpleadoPermanente methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 19:57:24'!
cantidadDeHijos 
	
	^ cantidadDeHijos ! !


!classDefinition: #EmpleadoTemporal category: #TP2UML_OrnellaBottiggi!
Empleado subclass: #EmpleadoTemporal
	instanceVariableNames: 'fechaFinDesignacion cantidadDeHorasExtras'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2UML_OrnellaBottiggi'!

!EmpleadoTemporal methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 20:16:13'!
agregarFechaFinDesignacion: unaFecha conCantidadDeHorasExtras: unaCantidad

        fechaFinDesignacion := unaFecha.
        cantidadDeHorasExtras := unaCantidad.! !

!EmpleadoTemporal methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 20:21:02'!
calcularRetenciones
 | retencionBase |

        retencionBase := (self calcularSueldoBruto * 0.10) + (cantidadDeHorasExtras * 5).
        
	^(self edad > 50) ifTrue: [retencionBase + 25] ifFalse: [retencionBase].! !

!EmpleadoTemporal methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 20:19:44'!
calcularSueldoBruto 
       
	^sueldoBasico + (cantidadDeHorasExtras * 40).
    ! !

!EmpleadoTemporal methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 20:05:12'!
cantidadDeHorasExtras
	
	^ cantidadDeHorasExtras! !

!EmpleadoTemporal methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 20:04:54'!
fechaFinDesignacion
	
	^fechaFinDesignacion.! !


!classDefinition: #Empresa category: #TP2UML_OrnellaBottiggi!
Object subclass: #Empresa
	instanceVariableNames: 'nombre cuit cantEmpleados empleados registroDeRecibos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2UML_OrnellaBottiggi'!

!Empresa methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 21:39:25'!
agregarEmpleado: unEmpleado 
        
	empleados add: unEmpleado.! !

!Empresa methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 21:44:21'!
calcularTotalRetenciones
	
        ^empleados sum: [:empleado | empleado calcularRetenciones].
    ! !

!Empresa methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 21:43:55'!
calcularTotalSueldosBrutos
	
        ^empleados sum: [:empleado | empleado calcularSueldoBruto].
    ! !

!Empresa methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 21:44:06'!
calcularTotalSueldosNetos 
	
        ^empleados sum: [:empleado | empleado calcularSueldoNeto].
    ! !

!Empresa methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 21:38:47'!
cantEmpleados
	
	^ empleados size.! !

!Empresa methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 22:24:43'!
cantRecibos
	
	^ registroDeRecibos size.! !

!Empresa methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 22:24:17'!
initializeconNombre: unNombre conCuit: unNumero
	
	nombre := unNombre.
	cuit  := unNumero.
	empleados := Set new.
	registroDeRecibos := Bag new.! !

!Empresa methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 22:25:45'!
liquidarSueldos 

        empleados do: [:empleado | 
            | recibo |
            recibo := ReciboDeHaberes new.
            recibo generarReciboPara: empleado.
	    registroDeRecibos add: recibo]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empresa class' category: #TP2UML_OrnellaBottiggi!
Empresa class
	instanceVariableNames: ''!

!Empresa class methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 19:36:34'!
conNombre: unNombre conCuit: unNumero

	^ self new initializeconNombre: unNombre conCuit: unNumero
! !


!classDefinition: #ReciboDeHaberes category: #TP2UML_OrnellaBottiggi!
Object subclass: #ReciboDeHaberes
	instanceVariableNames: 'nombreEmpleado direccion fechaEmision sueldoBruto sueldoNeto desgloceConceptos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2UML_OrnellaBottiggi'!

!ReciboDeHaberes methodsFor: 'as yet unclassified' stamp: '. 8/31/2024 21:46:11'!
generarReciboPara: unEmpleado 

        nombreEmpleado := unEmpleado nombre.
        direccion := unEmpleado direccion.
        fechaEmision := Date today.
        sueldoBruto := unEmpleado calcularSueldoBruto .
        sueldoNeto := unEmpleado calcularSueldoNeto .
        desgloceConceptos := OrderedCollection new.
        desgloceConceptos add: 'Sueldo Basico: ', unEmpleado sueldoBasico printString.! !
