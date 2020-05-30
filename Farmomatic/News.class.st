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


    Implementation Points
"
Class {
	#name : #News,
	#superclass : #Object,
	#instVars : [
		'body',
		'title',
		'themeOfTheNews'
	],
	#category : #Farmomatic
}

{ #category : #constructor }
News class >> withTitle: aTitle body: aBody [
	^ self new withTitle: aTitle body: aBody
]

{ #category : #initialization }
News >> canView: user [
	"Entiendo que al hablar la caonsigan de un problema, una especie o una variedad, se refiere a que solo puede haber un tema de la noticia"
	^ user hasInterestIn: themeOfTheNews

	
]

{ #category : #constructor }
News >> withTitle: aTitle body: aBody [

	title:= aTitle.
	body:= aBody
]
