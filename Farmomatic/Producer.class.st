Class {
	#name : #Producer,
	#superclass : #Users,
	#instVars : [
		'mail',
		'farms'
	],
	#category : #Farmomatic
}

{ #category : #'as yet unclassified' }
Producer class >> mail: aMail andPassword: aPassword [
	^ self new mail: aMail yPassword: aPassword
]

{ #category : #'as yet unclassified' }
Producer class >> mail: aMail andPassword: aPassword andFullName: aName [
	^ self new mail: aMail yPassword: aPassword andFullName: aName
]

{ #category : #'as yet unclassified' }
Producer >> farmInvitation: aFarm [
 farms add: aFarm 
]

{ #category : #'as yet unclassified' }
Producer >> initialize [
farms:= OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Producer >> inviteProducer: aProducer toFarm: aFarm [
aProducer farmInvitation: aFarm 

]

{ #category : #'as yet unclassified' }
Producer >> mail: aMail yPassword: aPassword [
	mail := aMail.
	password := aPassword
]

{ #category : #'as yet unclassified' }
Producer >> mail: aMail yPassword: aPassword andFullName: aName [
	self mail: aMail yPassword: aPassword.
	fullName := aName.
]

{ #category : #'as yet unclassified' }
Producer >> registerFarm: farm [
farms add: farm 
]
