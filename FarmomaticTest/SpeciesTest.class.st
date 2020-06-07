Class {
	#name : #SpeciesTest,
	#superclass : #TestCase,
	#instVars : [
		'system',
		'user1',
		'user2',
		'user3',
		'farm1',
		'plot1',
		'event1',
		'product1',
		'news1',
		'problem1',
		'variety1',
		'species1'
	],
	#category : #FarmomaticTest
}

{ #category : #running }
SpeciesTest >> setUp [

	super setUp.
	system := Farmomatic new.
	user1 := system
		registerProducerWithMail: 'lu@gmail.com'
		andPassword: '123456'
		andFullName: 'Lucia Perez'.
	user2 := system
		registerProducerWithMail: 'tom@gmail.com'
		andPassword: '112233'
		andFullName: 'Tomas González'.
	user3 := system
		registerProducerWithMail: 'regi@gmail.com'
		andPassword: '554433'
		andFullName: 'Regina Phalange'.
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
		
	species1 := system addSpecieWithName: 'Tomate platense'.
		
	event1 := system addPlantationWithAuthor: user1 Comments: 'Dulce de tomate' Amount: 500 Specie: species1 fromPlot: plot1.
	
	news1 := system addNewsWithTitle: 'Miracle of Glyphosato' body: 'God save Monsanto.' theme: species1

	
	
	
]

{ #category : #running }
SpeciesTest >> testApplied [

| new2 |
self assert: (species1 applied: news1 themeOfTheNews ) equals: true.

new2 := News new withTitle: 'Mucho que hacer' body: 'realmente mucho que hacer' theme: (system addProductsWithComercialName: 'aName'aVulgarName: 'aVulgar' aComposition: 'aComposition' aDescription: 'aDescription').

self assert: (species1 applied: new2 themeOfTheNews ) equals: false
]
