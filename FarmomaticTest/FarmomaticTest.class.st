Class {
	#name : #FarmomaticTest,
	#superclass : #TestCase,
	#instVars : [
		'system',
		'user1',
		'user2',
		'user3',
		'farm1'
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
	farm1 := system registerFarmWithName: 'Wood Farm' andDescription: 'beautiful willow tree farm' andAddress: 'aAddress' ofProducer: user1
]

{ #category : #'as yet unclassified' }
FarmomaticTest >> testregisterFarmWithNameandDescriptionandAddressofProducer [
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
