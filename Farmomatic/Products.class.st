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
	comercialName:		<Object>
	composition:		<Object>
	description:		<Object>


    Implementation Points
"
Class {
	#name : #Products,
	#superclass : #PredefinedList,
	#instVars : [
		'composition',
		'comercialName'
	],
	#category : #Farmomatic
}

{ #category : #constructor }
Products class >> withComercialName: aName aVulgarName: aVulgar aComposition: aComposition aDescription: aDescription [
^ self new withComercialName: aName aVulgarName: aVulgar aComposition: aComposition aDescription: aDescription
]

{ #category : #constructor }
Products >> applied: themeOfTheNews [
" pregunto si son el mismo objeto"
	^ self == themeOfTheNews

]

{ #category : #forTesting }
Products >> comercialName [
 ^comercialName 
]

{ #category : #forTesting }
Products >> composition [ 
	^composition 
]

{ #category : #forTesting }
Products >> description [ 
^description 
]

{ #category : #constructor }
Products >> withComercialName: aName aVulgarName: aVulgar aComposition: aComposition aDescription: aDescription [
	comercialName := aName.
	name := aVulgar.
	composition := aComposition.
	description := aDescription.
	
	
	
]
