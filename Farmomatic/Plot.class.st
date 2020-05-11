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
	description:		<Object>
	events:		<Object>
	hothouse:		<Object>
	id:		<Object>
	surface:		<Object>


    Implementation Points
"
Class {
	#name : #Plot,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'surface',
		'hothouse',
		'events'
	],
	#category : #Farmomatic
}

{ #category : #constructor }
Plot class >> id: anId andDescription: aDescription andSurface: aSurface andIsHothouse: isHothouse [
	^ self new
		id: anId
		andDescription: aDescription
		andSurface: aSurface
		andIsHothouse: isHothouse
]

{ #category : #adding }
Plot >> addHarvestWithAuthor: aUser Comments: aComment kg: aKg variety: aVariety [

	events add: (Harvest withAuthor: aUser Comments: aComment kg: aKg variety: aVariety)
]

{ #category : #adding }
Plot >> addPlantationWithAuthor: aUser Comments: aComment Amount: amount Specie: aSpecie [

	events add: (Plantation
		withAuthor: aUser
		Comments: aComment
		Amount: amount
		Specie: aSpecie)
]

{ #category : #adding }
Plot >> addProblemWithAuthor: aUser Comments: aComment Problem: aProblem [

	events add: (Problem withAuthor: aUser comments: aComment problem: aProblem)
]

{ #category : #adding }
Plot >> addaplicationWithAuthor: aUser Comments: aComment Amount: amount Product: aProduct [

	events add: (Aplication
		withAuthor: aUser
		Comments: aComment
		Amount: amount
		Product: aProduct)
]

{ #category : #constructor }
Plot >> id: anId andDescription: aDescription andSurface: aSurface andIsHothouse: isHothouse [
	id := anId.
	description := aDescription.
	surface := aSurface.
	hothouse := isHothouse
]

{ #category : #initialization }
Plot >> initialize [ 
events:= OrderedCollection new.
]
