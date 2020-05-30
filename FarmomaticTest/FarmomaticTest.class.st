Class {
	#name : #FarmomaticTest,
	#superclass : #TestCase,
	#instVars : [
		'system',
		'user1',
		'user2',
		'user3',
		'farm1',
		'plot1'
	],
	#category : #FarmomaticTest
}

{ #category : #running }
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
	"plot1 := system
		registerPlotWithId: '5D3F'
		andDescription: 'plot located to the left'
		andSurface: 20
		andIsHothouse: true
		fromFarm: farm1"
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
	self assert: farm1 plots size equals: 0.
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
	self assert: system users size equals: 3.
	self assert: system users first equals: user1.
	self assert: system users first fullName equals: 'Lucia Perez'.
	self assert: system users first password equals: '123456'.
	self assert: system users first mail equals: 'lu@gmail.com'.
	self assert: (system users at: 2) equals: user2.
	self assert: (system users at: 2) fullName equals: 'Tomas González'.
	self assert: (system users at: 2) password equals: '112233'.
	self assert: (system users at: 2) mail equals: 'tom@gmail.com'.
	self assert: (system users at: 3) equals: user3.
	self assert: (system users at: 3) fullName equals: 'Regina Phalange'.
	self assert: (system users at: 3) password equals: '554433'.
	self assert: (system users at: 3) mail equals: 'regi@gmail.com'
]
