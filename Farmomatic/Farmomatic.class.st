"
Pleasecomment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	harvests:		<Object>
	plantations:		<Object>
	problems:		<Object>
	products:		<Object>
	users:		<Object>


    Implementation Points
"
Class {
	#name : #Farmomatic,
	#superclass : #Object,
	#instVars : [
		'users',
		'problems',
		'plantations',
		'harvests',
		'products'
	],
	#category : #Farmomatic
}

{ #category : #adding }
Farmomatic >> addProblemWithVulgarName: aVulgarName aScientificName: aScientificName [
	"agregar problema sin url ni descripcion"

	| p |
	p := Problems
		withVulgarName: aVulgarName
		aScientificName: aScientificName.
	^ p
]

{ #category : #adding }
Farmomatic >> addProblemWithVulgarName: aVulgarName aScientificName: aScientificName aDescription: aDescription [
"agregar problema sin url"
	| p |
	p := Problems
		withVulgarName: aVulgarName
		aScientificName: aScientificName
		aDescription: aDescription.
	^ p
]

{ #category : #adding }
Farmomatic >> addProblemWithVulgarName: aVulgarName aScientificName: aScientificName aUrl: aUrl [
	"Agregar problema sin descripcion"

	| p |
	p := Problems
		withVulgarName: aVulgarName
		aScientificName: aScientificName
		aUrl: aUrl.
	^ p
]

{ #category : #adding }
Farmomatic >> addProblemWithVulgarName: aVulgarName aScientificName: aScientificName aUrl: aUrl aDescription: aDescription [
"Agregar problema con todos los datos"
	| p |
	p := Problems
		withVulgarName: aVulgarName
		aScientificName: aScientificName
		aUrl: aUrl
		aDescription: aDescription.
	^ p
]

{ #category : #adding }
Farmomatic >> addProductsWithComercialName: aName aComposition: aComposition aDescription: aDescription [
	| p |
	p := Products
		withComercialName: aName
		aComposition: aComposition
		aDescription: aDescription.
		^p
]

{ #category : #adding }
Farmomatic >> addSpecieWithName: aName [
	"Agregar problema sin descripcion"

	|s|
	s := Species withName: aName .
	^ s.
]

{ #category : #initialization }
Farmomatic >> initialize [
	users := OrderedCollection new.
	problems := OrderedCollection new.
	plantations := OrderedCollection new.
	harvests := OrderedCollection new.
	products := OrderedCollection new
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
