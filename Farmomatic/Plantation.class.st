Class {
	#name : #Plantation,
	#superclass : #Event,
	#instVars : [
		'amount',
		'species'
	],
	#category : #Farmomatic
}

{ #category : #'as yet unclassified' }
Plantation class >> withDate: adate Author: aUser Amount: amount Specie: aSpecie [
	^ self new
		withDate: adate
		Author: aUser
	
		Amount: amount
		Specie: aSpecie
]

{ #category : #'as yet unclassified' }
Plantation class >> withDate: adate Author: aUser Comments: aComment Amount: amount Specie: aSpecie [
	^ self new withDate: adate Author: aUser Comments: aComment Amount: amount Specie: aSpecie
]

{ #category : #'as yet unclassified' }
Plantation >> withDate: adate Author: aUser Amount: aAmount Specie: aSpecie [
	date := adate.
	author := aUser.
	amount := aAmount.
	species := aSpecie
]

{ #category : #'as yet unclassified' }
Plantation >> withDate: adate Author: aUser Comments: aComment Amount: aAmount Specie: aSpecie [
	date := adate.
	author := aUser.
	comments := aComment.
	amount := aAmount.
	species := aSpecie 
	
]
