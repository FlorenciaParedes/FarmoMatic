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
		'harvests',
		'products',
		'species',
		'userCreatedEvents',
		'news'
	],
	#category : #Farmomatic
}

{ #category : #adding }
Farmomatic >> addProblemWithVulgarName: aVulgarName aScientificName: aScientificName aUrl: aUrl aDescription: aDescription [
	"Agregar problema con todos los datos"

	| p |
	p := Problems
		withVulgarName: aVulgarName
		aScientificName: aScientificName
		aUrl: aUrl
		aDescription: aDescription.
	userCreatedEvents add: p.
	^ p
]

{ #category : #adding }
Farmomatic >> addProductsWithComercialName: aName aVulgarName: aVulgar aComposition: aComposition aDescription: aDescription [
      ^ Products
		withComercialName: aName
		aVulgarName: aVulgar
		aComposition: aComposition
		aDescription: aDescription.

]

{ #category : #adding }
Farmomatic >> addSpecieWithName: aName [
	"Agregar problema sin descripcion"

^Species withName: aName .

]

{ #category : #initialization }
Farmomatic >> initialize [
	species:= OrderedCollection new.
	users := OrderedCollection new.
	problems := OrderedCollection new.
	harvests := OrderedCollection new.
	products := OrderedCollection new.
	userCreatedEvents := OrderedCollection new.
	news := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Farmomatic >> inviteProducer: aProducer toFarm: aFarm of: producerOwner [ 
"Un productor puede invitar (dar acceso) a otros usuarios a cualquiera de sus granjas (solo indicando su email). Esos usuarios verán las granjas a las que fueron invitados como si fueran suyas"

producerOwner inviteProducer: aProducer toFarm: aFarm. 
]

{ #category : #'as yet unclassified' }
Farmomatic >> registerFarmWithName: aName andDescription: aDescription andAddress: aAddress ofProducer: aUser [
	"Recibe los datos para crear una granja y el productor a la q le pertenece"


		aUser registerFarm: (Farm name: aName andDescription: aDescription	andAddress: aAddress).

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
Farmomatic >> registerProducerWithMail: aMail andPassword: aPassword andFullName: aName [

	users add: (User mail: aMail andPassword: aPassword andFullName: aName)

]

{ #category : #removing }
Farmomatic >> removeFarm: aFarm ofUser: aUser [
	aUser removeFarm: aFarm
]
