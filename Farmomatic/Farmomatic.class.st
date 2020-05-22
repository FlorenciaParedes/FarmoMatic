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
	#classInstVars : [
		'creationDate',
		'a'
	],
	#category : #Farmomatic
}

{ #category : #adding }
Farmomatic >> addHarvestWithAuthor: aUser Comments: aComment kg: aKg variety: aVariety fromPlot: aPlot [
	^ userCreatedEvents
		add:
			(aPlot
				addHarvestWithAuthor: aUser
				Comments: aComment
				kg: aKg
				variety: aVariety)
]

{ #category : #adding }
Farmomatic >> addPlantationWithAuthor: aUser Comments: aComment Amount: amount Specie: aSpecie fromPlot: aPlot [
	userCreatedEvents
		add:
			(aPlot
				addPlantationWithAuthor: aUser Comments: aComment Amount: amount Specie: aSpecie)
]

{ #category : #adding }
Farmomatic >> addProblemWithAuthor: aUser Comments: aComment Problem: aProblem fromPlot: aPlot [
	userCreatedEvents
		add:
			(aPlot
				addProblemWithAuthor: aUser Comments: aComment Problem: aProblem)
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

{ #category : #adding }
Farmomatic >> addTroubleWithVulgarName: aVulgarName aScientificName: aScientificName aUrl: aUrl aDescription: aDescription [
	"Agregar problema con todos los datos"

	| p |
	p := Problems
		withVulgarName: aVulgarName
		aScientificName: aScientificName
		aUrl: aUrl
		aDescription: aDescription.
	problems add: p.
	^ p
]

{ #category : #adding }
Farmomatic >> addVarietyVulgarName: aName scientificName: aScientificName url: aUrl description: aDescription [
	^ Variety
		withVulgarName: aName scientificName: aScientificName url: aUrl description: aDescription
]

{ #category : #adding }
Farmomatic >> addaplicationWithAuthor: aUser Comments: aComment Amount: amount Product: aProduct fromPlot: aPlot [
	userCreatedEvents
		add:
			(aPlot
				addaplicationWithAuthor: aUser Comments: aComment Amount: amount Product: aProduct)
]

{ #category : #sorting }
Farmomatic >> filterEventByDate: aDate [
	^ userCreatedEvents select: [ :a | a creationDate = aDate ]
]

{ #category : #sorting }
Farmomatic >> filterEventByType: aType [
	^ userCreatedEvents select: [ :a | a type = aType ]
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
	|f|
	f:= Farm name: aName andDescription:aDescription andAddress: aAddress .
	aUser registerFarm: f.
	^f.
]

{ #category : #'as yet unclassified' }
Farmomatic >> registerPlotWithId: anId andDescription: aDesc andSurface: aSurf andIsHothouse: isHothouse fromFarm: aFarm [
	|p|
	p:= Plot id:anId  andDescription:aDesc andSurface: aSurf andIsHothouse: isHothouse.
	aFarm addPlot: p.
	^p 
]

{ #category : #'as yet unclassified' }
Farmomatic >> registerProducerWithMail: aMail andPassword: aPassword andFullName: aName [
	^ (users
		add: (User mail: aMail andPassword: aPassword andFullName: aName))
]

{ #category : #removing }
Farmomatic >> removeFarm: aFarm ofUser: aUser [
	aUser removeFarm: aFarm
]

{ #category : #sorting }
Farmomatic >> sortEventsByDateAsc [
	^ userCreatedEvents
		asSortedCollection: [ :a :b | a creationDate < b creationDate ]
]

{ #category : #sorting }
Farmomatic >> sortEventsByDateDec [
	^ userCreatedEvents
		asSortedCollection: [ :a :b | a creationDate > b creationDate ]
]

{ #category : #sorting }
Farmomatic >> sortEventsByTypeAsc [
	^ userCreatedEvents asSortedCollection: [ :a :b | a type < b type ]
]

{ #category : #sorting }
Farmomatic >> sortEventsByTypeDec [
	^ userCreatedEvents asSortedCollection: [ :a :b | a type > b type ]
]

{ #category : #'as yet unclassified' }
Farmomatic >> usersWhoReportedAVariety: aVariety [ 
	| aux |
	aux := userCreatedEvents select: [ :a | a type = 'Variety' ].
	^ (aux select: [ :a | a getVariety  = aVariety  ])
		collect: [ :a | a author ]
]

{ #category : #'as yet unclassified' }
Farmomatic >> usersWhoReportedProblem: aProblem [
	"*reportaron un determinado problema"

	| aux |
	aux := userCreatedEvents select: [ :a | a type = 'Problems' ].
	^ (aux select: [ :a | a getProblem = aProblem ]) collect: [ :a | a author]
]

{ #category : #'as yet unclassified' }
Farmomatic >> usersWhoUsedAproduct: aProduct [
	"utilizaron un determinado producto"
	| event |
	event := userCreatedEvents select: [ :a | a type = 'Products' ].
	^ (event select: [ :a | a getProduct = aProduct ])
		collect: [ :a | a author ]
]
