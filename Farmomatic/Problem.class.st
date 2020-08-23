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
		'problem'
	],
	#category : #Farmomatic
}

{ #category : #'as yet unclassified' }
Problem class >> withAuthor: aUser comments: aComment problem: aProblem [
	^ self new withAuthor: aUser Comments: aComment Problem: aProblem
]

{ #category : #'as yet unclassified' }
Problem >> getPredefined [ 
	^ problem
]

{ #category : #'as yet unclassified' }
Problem >> getProblem [
	^ problem
]

{ #category : #'as yet unclassified' }
Problem >> name [
	^ problem
]

{ #category : #'as yet unclassified' }
Problem >> theme: themeOfTheNews [
	^ problem  applied: themeOfTheNews 
]

{ #category : #constructor }
Problem >> withAuthor: aUser Comments: aComment Problem: aProblem [
	self withAuthor: aUser Comments: aComment.
	problem := aProblem.

]
