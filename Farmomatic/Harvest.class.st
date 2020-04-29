Class {
	#name : #Harvest,
	#superclass : #Event,
	#instVars : [
		'kg',
		'variety'
	],
	#category : #Farmomatic
}

{ #category : #'as yet unclassified' }
Harvest class >> withDate: adate Author: aUser Comments: aComment kg: aKg variety: aVariety [
	^self new withDate: adate
		Author: aUser
		Comments: aComment
		kg: aKg
		variety: aVariety.
]

{ #category : #'as yet unclassified' }
Harvest class >> withDate: adate Author: aUser kg: aKg variety: aVariety [
	^ self new
		withDate: adate
		Author: aUser
		kg: aKg
		variety: aVariety
]

{ #category : #'as yet unclassified' }
Harvest >> withDate: aDate Author: aUser Comments: aComment kg: aKg variety: aVariety [
	date := aDate.
	author := aUser.
	comments := aComment.
	kg := aKg.
	variety:= aVariety . 
]

{ #category : #'as yet unclassified' }
Harvest >> withDate: aDate Author: aUser kg: aKg variety: aVariety [
	date := aDate.
	author := aUser.
	kg := aKg.
	variety := aVariety
]
