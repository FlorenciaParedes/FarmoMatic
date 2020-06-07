Class {
	#name : #FarmTest,
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
		'news1'
	],
	#category : #FarmomaticTest
}

{ #category : #running }
FarmTest >> setUp [

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
		
	product1 := system addProductsWithComercialName: 'Dr Cancer' 
				aVulgarName: 'Glyfosato' 
				aComposition: 'Napalm' 
				aDescription: 'Kill plagues and humanes.'.
		
	event1 := system addaplicationWithAuthor: user1 Comments: 'This is goin to get out of control!' Amount: '2000Lt' Product: product1 fromPlot: plot1.
	
	news1 := system addNewsWithTitle: 'Miracle of Glyphosato' body: 'God save Monsanto.' theme: product1

	
	
	
]

{ #category : #running }
FarmTest >> testHasEventLike [

| new2 |
self assert: (farm1  hasEventLike:  news1 themeOfTheNews ) equals: true.

new2 := News new withTitle: 'Mucho que hacer' body: 'realmente mucho que hacer' theme: (system addProductsWithComercialName: 'aName'aVulgarName: 'aVulgar' aComposition: 'aComposition' aDescription: 'aDescription').

self assert: (farm1 hasEventLike:   new2 themeOfTheNews ) equals: false
]
