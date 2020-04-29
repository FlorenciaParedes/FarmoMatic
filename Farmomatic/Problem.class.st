Class {
	#name : #Problem,
	#superclass : #Event,
	#instVars : [
		'problems'
	],
	#category : #Farmomatic
}

{ #category : #'as yet unclassified' }
Problem class >> withDate: aDate Author: aUser Comments: aComment Problem: aProblem [
 ^self new withDate: aDate Author: aUser Comments: aComment Problem: aProblem.
]

{ #category : #'as yet unclassified' }
Problem class >> withDate: aDate Author: aUser Problem: aProblem [
	^ self new
		withDate: aDate
		Author: aUser
		Problem: aProblem
]

{ #category : #'as yet unclassified' }
Problem >> withDate: aDate Author: aUser Comments: aComment Problem: aProblem [.
	date := aDate.
	author := aUser.
	comments := aComment.
	problems := aProblem 

	
]

{ #category : #'as yet unclassified' }
Problem >> withDate: aDate Author: aUser Problem: aProblem [
	date := aDate.
	author := aUser.
	problems := aProblem
]
