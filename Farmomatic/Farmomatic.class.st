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
		'userCreatedEvents',
		'news',
		'varietyList',
		'problemsList',
		'speciesList',
		'productList'
	],
	#classInstVars : [
		'creationDate',
		'a'
	],
	#category : #Farmomatic
}

{ #category : #'as yet unclassified' }
Farmomatic class >> example [
	| farmomatic farm2 user1 user2 user3 farm1 farm3 plot1 specie1 plantationTomato variety1 tomatoHarvest problem1 fungusProblem product1 fungicideApplication |
	farmomatic := Farmomatic new.
	user1 := farmomatic
		registerProducerWithMail: 'jorgeSchelotto@gmail.com'
		andPassword: '123456'
		andFullName: 'Jorge Schelotto'.
	user2 := farmomatic
		registerProducerWithMail: 'mar@gmail.com'
		andPassword: '112233'
		andFullName: 'Maria González'.
	user2 setterExpert.
	user3 := farmomatic
		registerProducerWithMail: 'Alex@gmail.com'
		andPassword: '456'
		andFullName: 'Alex Morales'.
	farm1 := farmomatic
		registerFarmWithName: 'Wood Farm'
		andDescription: 'Beautiful willow tree farm. Owner: Jorge Schelotto'
		andAddress: '4691 Raggedy Point Rd'
		ofProducer: user1.
	farm2 := farmomatic
		registerFarmWithName: 'Tomatoes Farm'
		andDescription: 'Great tomato farm. Owner: Jorge Schelotto'
		andAddress: '4691 Raggedy Point Rd'
		ofProducer: user1.
	farm3 := farmomatic
		registerFarmWithName: 'Tomatoes Farm'
		andDescription: 'Great tomato farm. Owner: Jorge Schelotto'
		andAddress: '4691 Raggedy Point Rd'
		ofProducer: user1.
	plot1 := farmomatic
		registerPlotWithId: '5D3F'
		andDescription: 'plot located to the left'
		andSurface: 20
		andIsHothouse: true
		fromFarm: farm1.
	specie1 := farmomatic addSpecieWithName: 'Solanum lycopersicum'.
	plantationTomato := farmomatic
		addPlantationWithAuthor: user1
		Comments: 'Tomato plant plantation'
		Amount: 10
		Specie: specie1
		fromPlot: plot1.
	variety1 := farmomatic
		addVarietyVulgarName: 'Tomato'
		scientificName: 'Solanum lycopersicum'
		url: 'https://es.wikipedia.org/wiki/Solanum_lycopersicum'
		description: 'The tomato is the edible, often red, berry'.
	tomatoHarvest := farmomatic
		addHarvestWithAuthor: user1
		Comments: 'tomato harvest'
		kg: 50
		variety: variety1
		fromPlot: plot1.
	problem1 := farmomatic
		addTroubleWithVulgarName: 'Fungus: Early Blight'
		aScientificName: 'Alternaria solani'
		aUrl: 'https://en.wikipedia.org/wiki/Alternaria_solani'
		aDescription:
			'is a fung that produces a disease in tomato and potato plants called early blight. '.
	fungusProblem := farmomatic
		addProblemWithAuthor: user2
		Comments: 'fung: early blight in tomato plant'
		Problem: problem1
		fromPlot: plot1.
	product1 := farmomatic
		addProductsWithComercialName: 'BRAVONIL 720 SC'
		aVulgarName: 'Chlorothalonil'
		aComposition: 'Formulated with water-dispersible granules and wettable powder.'
		aDescription: 'Chlorothalonil is an organic compound used mainly as fungicide'.
	fungicideApplication := farmomatic
		addaplicationWithAuthor: user1
		Comments: 'fungicide for tomato planting'
		Amount: 30
		Product: product1
		fromPlot: plot1.
	plantationTomato creationDate: (Date newDay: 01 month: 05 year: 2018).
	tomatoHarvest creationDate: (Date newDay: 01 month: 06 year: 2018).
	fungusProblem creationDate: (Date newDay: 01 month: 07 year: 2018).
	fungicideApplication
		creationDate: (Date newDay: 01 month: 08 year: 2018).
	^ farmomatic
]

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
	^ productList add: (Products
		withComercialName: aName
		aVulgarName: aVulgar
		aComposition: aComposition
		aDescription: aDescription)
]

{ #category : #addingList }
Farmomatic >> addSpecieWithName: aName [
	"Agregar problema sin descripcion"

	^ speciesList add: (Species withName: aName)
]

{ #category : #addingList }
Farmomatic >> addTroubleWithVulgarName: aVulgarName aScientificName: aScientificName aUrl: aUrl aDescription: aDescription [


	| p |
	p := Problems
		withVulgarName: aVulgarName
		aScientificName: aScientificName
		aUrl: aUrl
		aDescription: aDescription.
	problemsList add: p.
	^ p
]

{ #category : #addingList }
Farmomatic >> addVarietyVulgarName: aName scientificName: aScientificName url: aUrl description: aDescription [
	^ varietyList add: (Variety
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
	varietyList := OrderedCollection new.
	problemsList := OrderedCollection new. 
	speciesList := OrderedCollection new.
	productList := OrderedCollection new.
]

{ #category : #register }
Farmomatic >> inviteProducerWithMail: aMail toFarm: aFarm of: producerOwner [
	"Un productor puede invitar (dar acceso) a otros usuarios a cualquiera de sus granjas (solo indicando su email). Esos usuarios verán las granjas a las que fueron invitados como si fueran suyas"

	| user |
	user := users detect: [ :a | a mail = aMail] ifNone: [ nil ] .
	(user) ifNotNil: [ producerOwner inviteProducer: user toFarm: aFarm. ]	ifNil: [ ^nil ]

]

{ #category : #accessing }
Farmomatic >> predefinedList [
	^ problemsList
]

{ #category : #accessing }
Farmomatic >> problemsList [
	^ problemsList
]

{ #category : #accessing }
Farmomatic >> productList [
	^ productList
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

{ #category : #accessing }
Farmomatic >> speciesList [
	^ speciesList
]

{ #category : #forTesting }
Farmomatic >> users [
	^ users 
]

{ #category : #accessing }
Farmomatic >> varietyList [
	^ varietyList
]
