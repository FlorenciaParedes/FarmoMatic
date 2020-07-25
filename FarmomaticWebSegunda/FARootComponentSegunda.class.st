Class {
	#name : #FARootComponentSegunda,
	#superclass : #WAComponent,
	#instVars : [
		'main',
		'header',
		'user1',
		'user2',
		'farm1',
		'plot1',
		'specie1',
		'plantationTomato',
		'variety1',
		'tomatoHarvest',
		'problem1',
		'fungusProblem',
		'product1',
		'fungicideApplication',
		'farmomatic',
		'history',
		'farm3'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #'class initialization' }
FARootComponentSegunda class >> initialize [
   "self initialize"
   | app |
   app := WAAdmin register: self asApplicationAt: 'FarmomaticAppSegunda'.
   app
      addLibrary: JQDeploymentLibrary;
      addLibrary: JQUiDeploymentLibrary;
      addLibrary: TBSDeploymentLibrary
]

{ #category : #rendering }
FARootComponentSegunda >> canBeRoot [
   ^ true
]

{ #category : #rendering }
FARootComponentSegunda >> children [
   ^ { main }
]

{ #category : #rendering }
FARootComponentSegunda >> history [
 | last |
 
history ifNotNil: [  
	last := history last.
	history removeLast.
	^last ]
]

{ #category : #rendering }
FARootComponentSegunda >> history: comp [
	history addLast: comp
]

{ #category : #rendering }
FARootComponentSegunda >> initialize [
	| farm2 |
	super initialize.
	farmomatic := Farmomatic new.
	user1 := farmomatic
		registerProducerWithMail: 'jorgeSchelotto@gmail.com'
		andPassword: '123456'
		andFullName: 'Jorge Schelotto'.
	user2 := farmomatic
		registerProducerWithMail: 'tom@gmail.com'
		andPassword: '112233'
		andFullName: 'Tomas González'.
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
	main := FACardsGroupSegunda
		withUser: (farmomatic users detect: [ :user | user fullName  match: 'Jorge Schelotto' ])
		root: self.
	header := FAHeaderSegunda.
	history := OrderedCollection new.
]

{ #category : #rendering }
FARootComponentSegunda >> main: aComponent [
   main := aComponent
]

{ #category : #rendering }
FARootComponentSegunda >> renderContentOn: html [
html tbsColumn with: [ html render: main ].



]

{ #category : #rendering }
FARootComponentSegunda >> updateRoot: anHtmlRoot [
    super updateRoot: anHtmlRoot.
   anHtmlRoot beHtml5.
   anHtmlRoot title: 'Farmomatic'.
    anHtmlRoot meta
        name: 'viewport';
        content: 'width=device-width, initial-scale=1.0'.
]
