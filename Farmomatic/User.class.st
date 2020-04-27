Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'password',
		'fullName',
		'mail',
		'farms'
	],
	#category : #Farmomatic
}

{ #category : #'as yet unclassified' }
User class >> mail: aMail andPassword: aPassword [
	^ self new mail: aMail yPassword: aPassword
]

{ #category : #'as yet unclassified' }
User class >> mail: aMail andPassword: aPassword andFullName: aName [
	^ self new mail: aMail yPassword: aPassword andFullName: aName
]

{ #category : #'as yet unclassified' }
User >> farmInvitation: aFarm [
 farms add: aFarm 
]

{ #category : #'as yet unclassified' }
User >> initialize [
farms:= OrderedCollection new.
]

{ #category : #'as yet unclassified' }
User >> inviteProducer: aProducer toFarm: aFarm [
aProducer farmInvitation: aFarm 

]

{ #category : #setter }
User >> mail: aMail yPassword: aPassword [
	mail := aMail.
	password := aPassword
]

{ #category : #setter }
User >> mail: aMail yPassword: aPassword andFullName: aName [
	self mail: aMail yPassword: aPassword.
	fullName := aName.
]

{ #category : #'as yet unclassified' }
User >> registerFarm: farm [
farms add: farm 
]
