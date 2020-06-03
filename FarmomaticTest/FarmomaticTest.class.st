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
		'problem1'
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
	system
		inviteProducerWithMail: 'tom@gmail.com'
		toFarm: farm1
		of: user1.
	plot1 := system
		registerPlotWithId: '5D3F'
		andDescription: 'plot located to the left'
		andSurface: 20
		andIsHothouse: true
		fromFarm: farm1.
	specie1 := system addSpecieWithName: 'Solanum lycopersicum'.
	system
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
	system
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
	system
		addProblemWithAuthor: user2
		Comments: 'fung: early blight in tomato plant'
		Problem: problem1
		fromPlot: plot1.
	product1 := system
		addProductsWithComercialName: 'BRAVONIL 720 SC'
		aVulgarName: 'Chlorothalonil'
		aComposition: 'Formulated with water-dispersible granules and wettable powder.'
		aDescription: 'Chlorothalonil is an organic compound used mainly as fungicide'.
	system
		addaplicationWithAuthor: user1
		Comments: 'fungicide for tomato planting'
		Amount: 30
		Product: product1
		fromPlot: plot1
]

{ #category : #eventTesting }
FarmomaticTest >> testaddHarvestWithAuthorCommentskgvarietyfromPlot [
	self assert: (system events at:2) author equals: user1.
	self assert: (system events at:2) kg equals: 50.
	self assert: (system events at:2) getVariety equals: variety1.
	self assert: (system events at:2) comments equals: 'tomato harvest'
]

{ #category : #eventTesting }
FarmomaticTest >> testaddPlantationWithAuthorCommentsAmountSpeciefromPlot [
	self assert: (system events at: 1) author equals: user1.
	self
		assert: (system events at: 1) comments
		equals: 'Tomato plant plantation'.
	self assert: (system events at: 1) amount equals: 10.
	self assert: (system events at: 1) getSpecies equals: specie1 
]

{ #category : #eventTesting }
FarmomaticTest >> testaddProblemWithAuthorCommentsProblemfromPlot [
	self assert: (system events at: 3) author equals: user2.
	self
		assert: (system events at: 3) comments
		equals: 'fung: early blight in tomato plant'.
	self assert: (system events at: 3) getProblem equals: problem1 
]

{ #category : #predefinedListsTesting }
FarmomaticTest >> testaddProductsWithComercialNameaVulgarNameaCompositionaDescription [
	self assert: (system predefinedList at: 4) equals: product1.
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

	self assert: (system predefinedList at: 1) equals: specie1.
	self assert: specie1 name equals: 'Solanum lycopersicum'.

]

{ #category : #predefinedListsTesting }
FarmomaticTest >> testaddTroubleWithVulgarNameaScientificNameaUrlaDescription [
	self assert: (system predefinedList at: 3) equals: problem1 .
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
	self assert: (system predefinedList at: 2) equals: variety1.	
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
	self assert: (system events at: 4) author equals: user1.
	self
		assert: (system events at: 4) comments
		equals: 'fungicide for tomato planting'.
	self assert: (system events at: 4) amount equals: 30.
	self assert: (system events at: 4) getProduct equals: product1
]

{ #category : #'as yet unclassified' }
FarmomaticTest >> testinviteProducerWithMailtoFarmof [
	self assert: user2 farms first name equals: 'Wood Farm'.
	self
		assert: user2 farms first description
		equals: 'beautiful willow tree farm'.
	self
		assert: user2 farms first address
		equals: '4691 Raggedy Point Rd'.

]

{ #category : #'as yet unclassified' }
FarmomaticTest >> testregisterFarmWithNameandDescriptionandAddressofProducer [
	self assert: user1 farms first equals: farm1.
	self assert: farm1 name equals: 'Wood Farm'.
	self assert: farm1 description equals: 'beautiful willow tree farm'.
	self assert: farm1 address equals: '4691 Raggedy Point Rd'
]

{ #category : #'as yet unclassified' }
FarmomaticTest >> testregisterPlotWithIdandDescriptionandSurfaceandIsHothousefromFarm [
	self assert: farm1 plots size equals: 1.
	self assert: farm1 plots first equals: plot1.
	self assert: plot1 id equals: '5D3F'.
	self assert: plot1 description equals: 'plot located to the left'.
	self assert: plot1 surface equals: 20.
	self deny: plot1 hothouse equals: false.
	self assert: plot1 hothouse equals: true

]

{ #category : #'as yet unclassified' }
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
