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
	spicies:		<Object>


    Implementation Points
"
Class {
	#name : #Species,
	#superclass : #PredefinedList,
	#category : #Farmomatic
}

{ #category : #constructor }
Species class >> withName: aName andDescription: aDescription [ 
	^ self new name: aName andDescription: aDescription 
]

{ #category : #'instance creation' }
Species >> applied: themeOfTheNews [
" pregunto si son el mismo objeto"
	^ self == themeOfTheNews

]

{ #category : #accessing }
Species >> description [ 
^description 
]

{ #category : #'instance creation' }
Species >> name: aName andDescription: aDescription [
	name := aName.
	description := aDescription
]
