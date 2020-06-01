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
	address:		<Object>
	description:		<Object>
	isRemoved:		<Object>
	name:		<Object>
	plots:		<Object>


    Implementation Points
"
Class {
	#name : #Farm,
	#superclass : #Object,
	#instVars : [
		'name',
		'address',
		'plots',
		'description',
		'isRemoved'
	],
	#category : #Farmomatic
}

{ #category : #constructor }
Farm class >> name: aName andDescription: aDescription andAddress: aAddress [
	^ self new
		name: aName
		andDescription: aDescription
		andAddress: aAddress
]

{ #category : #adding }
Farm >> addPlot: aPlot [
plots add: aPlot .
]

{ #category : #forTesting }
Farm >> address [ 
^address 
]

{ #category : #forTesting }
Farm >> description [ 
^description 
]

{ #category : #adding }
Farm >> hasEventLike: themeOfTheNews [
	^ (plots detect: [ :elem | elem hasEventLike: themeOfTheNews] ifFound:[true] ifNone: [false]) 
	
]

{ #category : #initialization }
Farm >> initialize [ 
	plots := OrderedCollection new.
]

{ #category : #forTesting }
Farm >> name [ 
^name 
]

{ #category : #constructor }
Farm >> name: aName andDescription: aDescription andAddress: aAddress [
	name:= aName.
	description:= aDescription. 
	address := aAddress.
	
	
]

{ #category : #forTesting }
Farm >> plots [
^plots
]
