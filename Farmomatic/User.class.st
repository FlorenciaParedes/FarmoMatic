"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	farms:		<Object>
	fullName:		<Object>
	isExpert:		<Object>
	mail:		<Object>
	password:		<Object>
	removedFarms:		<Object>


    Implementation Points
"
Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'password',
		'fullName',
		'mail',
		'farms',
		'removedFarms',
		'isExpert'
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
	farms := OrderedCollection new.
	removedFarms := OrderedCollection new.
	isExpert:=false.
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
User >> makeExpert [
	isExpert := true.
]

{ #category : #'as yet unclassified' }
User >> makeExpertProducer: aProducer [
	aProducer makeExpert.
]

{ #category : #'as yet unclassified' }
User >> registerFarm: farm [
farms add: farm 
]

{ #category : #removing }
User >> removeFarm: aFarm [
	removedFarms add: aFarm.
	farms remove: aFarm
]
