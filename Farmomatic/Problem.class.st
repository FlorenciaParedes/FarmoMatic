"
Pleasecomment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

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
	problems:		<Object>


    Implementation Points
"
Class {
	#name : #Problem,
	#superclass : #Event,
	#instVars : [
		'problems'
	],
	#category : #Farmomatic
}

{ #category : #'as yet unclassified' }
Problem class >> withAuthor: aUser andComments: aComment andProblem: aProblem [
	^ self new withAuthor: aUser Comments: aComment Problem: aProblem
]

{ #category : #'as yet unclassified' }
Problem class >> withAuthor: aUser andProblem: aProblem [
	^ self new withAuthor: aUser Problem: aProblem
]

{ #category : #constructor }
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
Problem >> withAuthor: aUser Comments: aComment Problem: aProblem [.

	author := aUser.
	comments := aComment.
	problems := aProblem 

	
]

{ #category : #'as yet unclassified' }
Problem >> withAuthor: aUser Problem: aProblem [

	author := aUser.
	problems := aProblem
]

{ #category : #constructor }
Problem >> withDate: aDate Author: aUser Comments: aComment Problem: aProblem [.
	self withDate: aDate Author: aUser Comments: aComment.
	problems := aProblem 

	
]

{ #category : #'as yet unclassified' }
Problem >> withDate: aDate Author: aUser Problem: aProblem [
	date := aDate.
	author := aUser.
	problems := aProblem
]
