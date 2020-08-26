Class {
	#name : #FarmomaticTest,
	#superclass : #TestCase,
	#instVars : [
		'system',
		'user1',
		'user2',
		'user3',
		'farm1',
		'plot1',
		'variety1',
		'product1',
		'specie1',
		'problem1',
		'plantationTomato',
		'tomatoHarvest',
		'fungusProblem',
		'fungicideApplication',
		'news1'
	],
	#category : #FarmomaticTest
}

{ #category : #'as yet unclassified' }
FarmomaticTest >> setUp [
	system := Farmomatic new.
	user1 := system
		registerProducerWithMail: 'lu@gmail.com'
		andPassword: '123456'
		andFullName: 'Lucia Perez'.
	user2 := system
		registerProducerWithMail: 'tom@gmail.com'
		andPassword: '112233'
		andFullName: 'Tomas González'.
	farm1 := system
		registerFarmWithName: 'Wood Farm'
		andDescription: 'beautiful willow tree farm'
		andAddress: '4691 Raggedy Point Rd'
		ofProducer: user1.
	plot1 := system
		registerPlotWithId: '5D3F'
		andDescription: 'plot located to the left'
		andSurface: 20
		andIsHothouse: true
		fromFarm: farm1.
	specie1 := system addSpecieWithName: 'Solanum lycopersicum'andDescription: 'plant Solanum lycopersicum commonly known as a tomato plant.'.
	plantationTomato := system
		addPlantationWithAuthor: user1
		Comments: 'Tomato plant plantation'
		Amount: 10
		Specie: specie1
		fromPlot: plot1.
	variety1 := system
		addVarietyVulgarName: 'Tomato'
		scientificName: 'Solanum lycopersicum'
		url: 'https://es.wikipedia.org/wiki/Solanum_lycopersicum'
		description: 'The tomato is the edible, often red, berry'.
	tomatoHarvest := system
		addHarvestWithAuthor: user1
		Comments: 'tomato harvest'
		kg: 50
		variety: variety1
		fromPlot: plot1.
	problem1 := system
		addTroubleWithVulgarName: 'Fungus: Early Blight'
		aScientificName: 'Alternaria solani'
		aUrl: 'https://en.wikipedia.org/wiki/Alternaria_solani'
		aDescription:
			'is a fung that produces a disease in tomato and potato plants called early blight. '.
	fungusProblem := system
		addProblemWithAuthor: user2
		Comments: 'fung: early blight in tomato plant'
		Problem: problem1
		fromPlot: plot1.
	product1 := system
		addProductsWithComercialName: 'BRAVONIL 720 SC'
		aVulgarName: 'Chlorothalonil'
		aComposition: 'Formulated with water-dispersible granules and wettable powder.'
		aDescription: 'Chlorothalonil is an organic compound used mainly as fungicide'.
	fungicideApplication := system
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
	news1 := system
		addNewsWithTitle: 'Miracle of Glyphosato'
		body: 'God save Monsanto.'
		theme: product1
]

{ #category : #eventTesting }
FarmomaticTest >> testaddHarvestWithAuthorCommentskgvarietyfromPlot [
	self assert: (system events at: 2) equals: tomatoHarvest.
	self assert: tomatoHarvest author equals: user1.
	self assert: tomatoHarvest amount equals: 50.
	self assert: tomatoHarvest getVariety equals: variety1.
	self assert: tomatoHarvest comments equals: 'tomato harvest'
]

{ #category : #addingNews }
FarmomaticTest >> testaddNewsWithTitlebodytheme [
	self assert: news1 title equals: 'Miracle of Glyphosato'.
	self assert: news1 body equals: 'God save Monsanto.'.
	self assert: (news1 canView: user1) equals: true.
	self assert: news1 themeOfTheNews equals: product1 .
]

{ #category : #eventTesting }
FarmomaticTest >> testaddPlantationWithAuthorCommentsAmountSpeciefromPlot [
	self assert: (system events at: 1) equals: plantationTomato .
	self assert: plantationTomato author equals: user1.
	self
		assert: plantationTomato comments
		equals: 'Tomato plant plantation'.
	self assert: plantationTomato amount equals: 10.
	self assert: plantationTomato getSpecies equals: specie1
]

{ #category : #eventTesting }
FarmomaticTest >> testaddProblemWithAuthorCommentsProblemfromPlot [
	self assert: (system events at: 3) equals: fungusProblem.
	self assert: fungusProblem author equals: user2.
	self
		assert: fungusProblem comments
		equals: 'fung: early blight in tomato plant'.
	self assert: fungusProblem getProblem equals: problem1
]

{ #category : #predefinedListsTesting }
FarmomaticTest >> testaddProductsWithComercialNameaVulgarNameaCompositionaDescription [
	self assert: (system productList at: 1) equals: product1.
	self assert: product1 name equals: 'Chlorothalonil'.
	self assert: product1 comercialName equals: 'BRAVONIL 720 SC'.
	self
		assert: product1 composition
		equals: 'Formulated with water-dispersible granules and wettable powder.'.
	self
		assert: product1 description
		equals: 'Chlorothalonil is an organic compound used mainly as fungicide'
]

{ #category : #predefinedListsTesting }
FarmomaticTest >> testaddSpecieWithName [

	self assert: (system speciesList at: 1) equals: specie1.
	self assert: specie1 name equals: 'Solanum lycopersicum'.

]

{ #category : #predefinedListsTesting }
FarmomaticTest >> testaddSpecieWithNameandDescription [
	self assert: (system speciesList at: 1) equals: specie1.
	self assert: specie1 name equals: 'Solanum lycopersicum'.
	self
		assert: specie1 description
		equals: 'plant Solanum lycopersicum commonly known as a tomato plant.'
]

{ #category : #predefinedListsTesting }
FarmomaticTest >> testaddTroubleWithVulgarNameaScientificNameaUrlaDescription [
	self assert: (system problemsList at: 1) equals: problem1 .
	self assert: problem1 name equals: 'Fungus: Early Blight'.
	self assert: problem1 scientificName equals: 'Alternaria solani'.
	self
		assert: problem1 url
		equals: 'https://en.wikipedia.org/wiki/Alternaria_solani'.
	self
		assert: problem1 description
		equals:
			'is a fung that produces a disease in tomato and potato plants called early blight. '
]

{ #category : #predefinedListsTesting }
FarmomaticTest >> testaddVarietyVulgarNamescientificNameurldescription [
	self assert: (system varietyList at: 1) equals: variety1.	
	self assert: variety1 name equals: 'Tomato'.
	self assert: variety1 scientificName equals: 'Solanum lycopersicum'.
	self
		assert: variety1 description
		equals: 'The tomato is the edible, often red, berry'.
	self
		assert: variety1 url
		equals: 'https://es.wikipedia.org/wiki/Solanum_lycopersicum'.

]

{ #category : #eventTesting }
FarmomaticTest >> testaddaplicationWithAuthorCommentsAmountProductfromPlot [
	self assert: (system events at: 4) equals: fungicideApplication.
	self assert: fungicideApplication author equals: user1.
	self
		assert: fungicideApplication comments
		equals: 'fungicide for tomato planting'.
	self assert: fungicideApplication amount equals: 30.
	self assert: fungicideApplication getProduct equals: product1.
]

{ #category : #sorting }
FarmomaticTest >> testfilterEventByDate [
	| event aDate |
	aDate := Date newDay: 01 month: 05 year: 2018.
	self assert: plantationTomato creationDate equals: aDate.
	event := system filterEventByDate: aDate.
	self assert: event size equals: 1.
	self assert: event first equals: plantationTomato.

]

{ #category : #sorting }
FarmomaticTest >> testfilterEventByType [
	| event |
	event := system filterEventByType: 'Harvest'.
	self assert: event size equals: 1.
	self assert: event first equals: tomatoHarvest.
	event := system filterEventByType: 'Plantation'.
	self assert: event size equals: 1.
	self assert: event first equals: plantationTomato.
	event := system filterEventByType: 'Problem'.
	self assert: event size equals: 1.
	self assert: event first equals: fungusProblem.
	event := system filterEventByType: 'Aplication'.
	self assert: event size equals: 1.
	self assert: event first equals: fungicideApplication 
]

{ #category : #registering }
FarmomaticTest >> testinviteProducerWithMailtoFarmof [
		system
		inviteProducerWithMail: 'tom@gmail.com'
		toFarm: farm1
		of: user1.
	self assert: user2 farms first name equals: 'Wood Farm'.
	self
		assert: user2 farms first description
		equals: 'beautiful willow tree farm'.
	self
		assert: user2 farms first address
		equals: '4691 Raggedy Point Rd'
]

{ #category : #registering }
FarmomaticTest >> testregisterFarmWithNameandDescriptionandAddressofProducer [
	self assert: user1 farms first equals: farm1.
	self assert: farm1 name equals: 'Wood Farm'.
	self assert: farm1 description equals: 'beautiful willow tree farm'.
	self assert: farm1 address equals: '4691 Raggedy Point Rd'
]

{ #category : #registering }
FarmomaticTest >> testregisterPlotWithIdandDescriptionandSurfaceandIsHothousefromFarm [
	self assert: farm1 plots size equals: 1.
	self assert: farm1 plots first equals: plot1.
	self assert: plot1 id equals: '5D3F'.
	self assert: plot1 description equals: 'plot located to the left'.
	self assert: plot1 surface equals: 20.
	self deny: plot1 hothouse equals: false.
	self assert: plot1 hothouse equals: true

]

{ #category : #registering }
FarmomaticTest >> testregisterProducerWithMailandPasswordandFullName [
	self assert: system users size equals: 2.
	self assert: system users first equals: user1.
	self assert: system users first fullName equals: 'Lucia Perez'.
	self assert: system users first password equals: '123456'.
	self assert: system users first mail equals: 'lu@gmail.com'.
	self assert: (system users at: 2) equals: user2.
	self assert: (system users at: 2) fullName equals: 'Tomas González'.
	self assert: (system users at: 2) password equals: '112233'.
	self assert: (system users at: 2) mail equals: 'tom@gmail.com'
]

{ #category : #sorting }
FarmomaticTest >> testsortEventsByDateAsc [
	| events |
	events := system sortEventsByDateAsc.
	self assert: events size equals: 4.
	self assert: events first equals: plantationTomato.
	self
		assert: events first creationDate
		equals: (Date newDay: 01 month: 05 year: 2018).
	self assert: (events at: 2) equals: tomatoHarvest.
	self
		assert: (events at: 2) creationDate
		equals: (Date newDay: 01 month: 06 year: 2018).
	self assert: (events at: 3) equals: fungusProblem.
	self
		assert: (events at: 3) creationDate
		equals: (Date newDay: 01 month: 07 year: 2018).
	self assert: (events at: 4) equals: fungicideApplication.
	self
		assert: (events at: 4) creationDate
		equals: (Date newDay: 01 month: 08 year: 2018).	
]

{ #category : #sorting }
FarmomaticTest >> testsortEventsByDateDec [
	| events |
	events := system sortEventsByDateDec.
	self assert: events size equals: 4.
	self assert: events first equals: fungicideApplication.
	self
		assert: events first creationDate
		equals: (Date newDay: 01 month: 08 year: 2018).
	self assert: (events at: 2) equals: fungusProblem.
	self
		assert: (events at: 2) creationDate
		equals: (Date newDay: 01 month: 07 year: 2018).
	self assert: (events at: 3) equals: tomatoHarvest.
	self
		assert: (events at: 3) creationDate
		equals: (Date newDay: 01 month: 06 year: 2018).
	self assert: (events at: 4) equals: plantationTomato.
	self
		assert: (events at: 4) creationDate
		equals: (Date newDay: 01 month: 05 year: 2018)
]

{ #category : #sorting }
FarmomaticTest >> testsortEventsByTypeAsc [
	| events |
	events := system sortEventsByTypeAsc.
	self assert: events size equals: 4.
	self assert: events first equals: fungicideApplication.
	self assert: (events at: 2) equals: tomatoHarvest .
	self assert: (events at: 3) equals: plantationTomato. 
	self assert: (events at: 4) equals: fungusProblem .
]

{ #category : #sorting }
FarmomaticTest >> testsortEventsByTypeDec [
	| events |
	events := system sortEventsByTypeDec.
	self assert: events size equals: 4.
	self assert: events first equals: fungusProblem.
	self assert: (events at: 2) equals: plantationTomato.
	self assert: (events at: 3) equals: tomatoHarvest.
	self assert: (events at: 4) equals: fungicideApplication
]
