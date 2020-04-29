Class {
	#name : #Farmomatic,
	#superclass : #Object,
	#instVars : [
		'users'
	],
	#category : #Farmomatic
}

{ #category : #initialization }
Farmomatic >> initialize [
	users := OrderedCollection new
]

{ #category : #'as yet unclassified' }
Farmomatic >> inviteProducer: aProducer toFarm: aFarm of: producerOwner [ 
"Un productor puede invitar (dar acceso) a otros usuarios a cualquiera de sus granjas (solo indicando su email). Esos usuarios verán las granjas a las que fueron invitados como si fueran suyas"

producerOwner inviteProducer: aProducer toFarm: aFarm. 
]

{ #category : #'as yet unclassified' }
Farmomatic >> registerFarmWithName: aName andDescription: aDescription andAddress: aAddress ofProducer: aUser [
	"Recibe los datos para crear una granja y el productor a la q le pertenece"

	| farm |
	farm := Farm
		name: aName
		andDescription: aDescription
		andAddress: aAddress.
	aUser registerFarm: farm.
	^ farm
]

{ #category : #'as yet unclassified' }
Farmomatic >> registerFarmWithName: aName andDescription: aDescription ofProducer: aUser [
	"Recibe los datos para crear una granja y el productor a la q le pertenece NO SE SI DEBO RETORNARLA.........!!!!!!!!!!!!!!!!!!"

	| farm |
	farm := Farm name: aName andDescription: aDescription.
	aUser registerFarm: farm.
	^ farm
]

{ #category : #'as yet unclassified' }
Farmomatic >> registerPlotWithId: anId andDescription: aDesc andSurface: aSurf andIsHothouse: isHothouse fromFarm: aFarm [
	| p |
	p := Plot
		id: anId
		andDescription: aDesc
		andSurface: aSurf
		andIsHothouse: isHothouse.
	aFarm addPlot: p.
	^ p
]

{ #category : #'as yet unclassified' }
Farmomatic >> registerProducerWithMail: aMail andPassword: aPassword [
	| p |
	p := User mail: aMail andPassword: aPassword.
	users add: p.
	^ p
]

{ #category : #'as yet unclassified' }
Farmomatic >> registerProducerWithMail: aMail andPassword: aPassword andFullName: aName [
	| p |
	p := User mail: aMail andPassword: aPassword andFullName: aName.
	users add: p.
	^ p
]

{ #category : #removing }
Farmomatic >> removeFarm: aFarm ofUser: aUser [
	aUser removeFarm: aFarm
]
