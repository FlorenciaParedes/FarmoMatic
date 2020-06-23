Class {
	#name : #UserTest,
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
		'farm2'
	],
	#category : #FarmomaticTest
}

{ #category : #running }
UserTest >> setUp [
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
	farm1 := system
		registerFarmWithName: 'Wood Farm'
		andDescription: 'beautiful willow tree farm'
		andAddress: '4691 Raggedy Point Rd'
		ofProducer: user1.
	farm2 := system
		registerFarmWithName: 'Wood Farm'
		andDescription: 'beautiful willow tree farm'
		andAddress: '4691 Raggedy Point Rd'
		ofProducer: user2.
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
	product1 := system
		addProductsWithComercialName: 'Dr Cancer'
		aVulgarName: 'Glyfosato'
		aComposition: 'Napalm'
		aDescription: 'Kill plagues and humanes.'.
	event1 := system
		addaplicationWithAuthor: user1
		Comments: 'This is goin to get out of control!'
		Amount: '2000Lt'
		Product: product1
		fromPlot: plot1.
	news1 := system
		addNewsWithTitle: 'Miracle of Glyphosato'
		body: 'God save Monsanto.'
		theme: product1
]

{ #category : #tests }
UserTest >> testFarmInvitation [
	self assert: ((user1 farms size) = 1  ) equals: true.
	user1 farmInvitation: farm2.
	self assert: ((user1 farms size) = 2  ) equals: true.

]

{ #category : #tests }
UserTest >> testHasInterestIn [

| new2 |
self assert: (user1 hasInterestIn: news1 themeOfTheNews ) equals: true.

new2 := News new withTitle: 'Mucho que hacer' body: 'realmente mucho que hacer' theme: (system addProductsWithComercialName: 'aName'aVulgarName: 'aVulgar' aComposition: 'aComposition' aDescription: 'aDescription').

self assert: (user1 hasInterestIn:  new2 themeOfTheNews ) equals: false
]

{ #category : #tests }
UserTest >> testInviteProducerToFarm [

	self assert: ((user1 farms size) = 1  ) equals: true.
	user2 inviteProducer: user1 toFarm: farm2.
	self assert: ((user1 farms size) = 2  ) equals: true.

]

{ #category : #tests }
UserTest >> testMakeExpertProducer [
	self assert: user1 expert equals: false.
	user2 setterExpert.
	user2 makeExpertProducer: user1.
	self assert: user1 expert equals: true
]

{ #category : #tests }
UserTest >> testRemoveFarm [

	self assert: (user1 farms size  ) equals: 1.
	self assert: ((user1 farms size) = 2  ) equals: false.
	self assert: (user1 farms isEmpty ) equals: false.
	user1 removeFarm: farm1.
	self assert: (user1 farms isEmpty  ) equals: true.
	self assert: (user1 removedFarms size  ) equals: 1
]
