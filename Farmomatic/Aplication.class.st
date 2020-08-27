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
 
Internal Representation and Ky Implementation Points.

    Instance Variables
	amount:		<Object>
	product:		<Object>


    Implementation Points
"
Class {
	#name : #Aplication,
	#superclass : #Event,
	#instVars : [
		'product'
	],
	#category : #Farmomatic
}

{ #category : #constructor }
Aplication class >> withAuthor: aUser Comments: aComment Amount: amount Product: aProduct [
	^self new withAuthor: aUser
		Comments: aComment
		Amount: amount
		Product: aProduct.
]

{ #category : #forTesting }
Aplication >> amount [
	^amount 
]

{ #category : #'as yet unclassified' }
Aplication >> getPredefined [ 
	^ product 
]

{ #category : #'as yet unclassified' }
Aplication >> theme: themeOfTheNews [
"Y si pregunto si son el mismo objeto?"
	^ product applied: themeOfTheNews 
]

{ #category : #constructor }
Aplication >> withAuthor: aUser Comments: aComment Amount: aAmount Product: aProduct [
	self withAuthor: aUser Comments: aComment.
	amount := aAmount.
	product := aProduct.
   
]
