"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message tw
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	name:		<Object>


    Implementation Points
"
Class {
	#name : #PredefinedList,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #Farmomatic
}

{ #category : #accessing }
PredefinedList >> applied: themeOfTheNews [
]

{ #category : #accessing }
PredefinedList >> name [
	^ name
]

{ #category : #accessing }
PredefinedList >> name: anObject [
	name := anObject
]
