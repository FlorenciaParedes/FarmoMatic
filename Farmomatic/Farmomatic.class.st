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
		'predefinedList',
		'userCreatedEvents',
		'news'
	],
	#classInstVars : [
		'creationDate',
		'a'
	],
	#category : #Farmomatic
}

{ #category : #addingEvents }
Farmomatic >> addHarvestWithAuthor: aUser Comments: aComment kg: aKg variety: aVariety fromPlot: aPlot [
	^ userCreatedEvents
		add:
			(aPlot
				addHarvestWithAuthor: aUser
				Comments: aComment
				kg: aKg
				variety: aVariety)
]

{ #category : #addingNews }
Farmomatic >> addNewsWithTitle: aTitle body: aText theme: aTheme [

	^ (news add: (News new withTitle: aTitle body: aText theme: aTheme))
]

{ #category : #addingEvents }
Farmomatic >> addPlantationWithAuthor: aUser Comments: aComment Amount: amount Specie: aSpecie fromPlot: aPlot [
	^ userCreatedEvents
		add:
			(aPlot
				addPlantationWithAuthor: aUser
				Comments: aComment
				Amount: amount
				Specie: aSpecie)
]

{ #category : #addingEvents }
Farmomatic >> addProblemWithAuthor: aUser Comments: aComment Problem: aProblem fromPlot: aPlot [
	^userCreatedEvents
		add:
			(aPlot
				addProblemWithAuthor: aUser
				Comments: aComment
				Problem: aProblem)
]

{ #category : #addingList }
Farmomatic >> addProductsWithComercialName: aName aVulgarName: aVulgar aComposition: aComposition aDescription: aDescription [
	^ predefinedList add: (Products
		withComercialName: aName
		aVulgarName: aVulgar
		aComposition: aComposition
		aDescription: aDescription)
]

{ #category : #addingList }
Farmomatic >> addSpecieWithName: aName [
	"Agregar problema sin descripcion"

	^ predefinedList add: (Species withName: aName)
]

{ #category : #addingList }
Farmomatic >> addTroubleWithVulgarName: aVulgarName aScientificName: aScientificName aUrl: aUrl aDescription: aDescription [


	| p |
	p := Problems
		withVulgarName: aVulgarName
		aScientificName: aScientificName
		aUrl: aUrl
		aDescription: aDescription.
	predefinedList add: p.
	^ p
]

{ #category : #addingList }
Farmomatic >> addVarietyVulgarName: aName scientificName: aScientificName url: aUrl description: aDescription [
	^ predefinedList add: (Variety
		withVulgarName: aName
		scientificName: aScientificName
		url: aUrl
		description: aDescription)
]

{ #category : #addingEvents }
Farmomatic >> addaplicationWithAuthor: aUser Comments: aComment Amount: amount Product: aProduct fromPlot: aPlot [
	^userCreatedEvents
		add:
			(aPlot
				addaplicationWithAuthor: aUser
				Comments: aComment
				Amount: amount
				Product: aProduct)
]

{ #category : #forTesting }
Farmomatic >> events [ 
^ userCreatedEvents 
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
	users := OrderedCollection new.
	userCreatedEvents := OrderedCollection new.
	news := OrderedCollection new.
	predefinedList := OrderedCollection new
]

{ #category : #'as yet unclassified' }
Farmomatic >> inviteProducerWithMail: aMail toFarm: aFarm of: producerOwner [
	"Un productor puede invitar (dar acceso) a otros usuarios a cualquiera de sus granjas (solo indicando su email). Esos usuarios verán las granjas a las que fueron invitados como si fueran suyas"

	| user |
	user := self producerWithMail: aMail.
	(user) ifNotNil: [ producerOwner inviteProducer: user toFarm: aFarm ]	

]

{ #category : #forTesting }
Farmomatic >> predefinedList [
	^predefinedList 
]

{ #category : #'as yet unclassified' }
Farmomatic >> producerWithMail: aMail [
	^ users detect: [ :a | a mail = aMail] ifNone: [ nil ] 
]

{ #category : #register }
Farmomatic >> registerFarmWithName: aName andDescription: aDescription andAddress: aAddress ofProducer: aUser [
	|f|
	f:= Farm name: aName andDescription:aDescription andAddress: aAddress .
	aUser registerFarm: f.
	^f.
]

{ #category : #register }
Farmomatic >> registerPlotWithId: anId andDescription: aDesc andSurface: aSurf andIsHothouse: isHothouse fromFarm: aFarm [
	|p|
	p:= Plot id:anId  andDescription:aDesc andSurface: aSurf andIsHothouse: isHothouse.
	aFarm addPlot: p.
	^p 
]

{ #category : #register }
Farmomatic >> registerProducerWithMail: aMail andPassword: aPassword andFullName: aName [
	^ (users
		add: (User mail: aMail andPassword: aPassword andFullName: aName))
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

{ #category : #forTesting }
Farmomatic >> users [
	^ users 
]
