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
	amount:		<Object>
	species:		<Object>


    Implementation Points
"
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
Plantation class >> withAuthor: aUser Comments: aComment Amount: amount Specie: aSpecie [
	^ self new
		withAuthor: aUser
		Comments: aComment
		Amount: amount
		Specie: aSpecie
]

{ #category : #forTesting }
Plantation >> amount [ 
^amount 
]

{ #category : #forTesting }
Plantation >> getSpecies [ 
^species 
]

{ #category : #accessing }
Plantation >> theme: themeOfTheNews [
	^ species  applied: themeOfTheNews 
]

{ #category : #constructor }
Plantation >> withAuthor: aUser Comments: aComment Amount: aAmount Specie: aSpecie [
	self withAuthor: aUser Comments: aComment.
	amount := aAmount.
	species := aSpecie 
	
]
