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
	scientificName:		<Object>
	url:		<Object>
	vulgarName:		<Object>


    Implementation Points
"
Class {
	#name : #Problems,
	#superclass : #Object,
	#instVars : [
		'vulgarName',
		'scientificName',
		'url',
		'description'
	],
	#category : #Farmomatic
}

{ #category : #'as yet unclassified' }
Problems class >> withVulgarName: aVulgarName aScientificName: aScientificName [
	^ self new
		withVulgarName: aVulgarName
		aScientificName: aScientificName

]

{ #category : #'as yet unclassified' }
Problems class >> withVulgarName: aVulgarName aScientificName: aScientificName aDescription: aDescription [
	^ self new
		withVulgarName: aVulgarName
		aScientificName: aScientificName
		aDescription: aDescription
]

{ #category : #'as yet unclassified' }
Problems class >> withVulgarName: aVulgarName aScientificName: aScientificName aUrl: aUrl [ 
	^ self new
		withVulgarName: aVulgarName
		aScientificName: aScientificName
		aUrl: aUrl
]

{ #category : #'as yet unclassified' }
Problems class >> withVulgarName:aVulgarName aScientificName: aScientificName aUrl: aUrl aDescription:aDescription [.
^ self new withVulgarName:aVulgarName aScientificName: aScientificName aUrl: aUrl aDescription:aDescription.
]

{ #category : #'as yet unclassified' }
Problems >> withVulgarName: aVulgarName aScientificName: aScientificName [ 
	vulgarName := aVulgarName.
	scientificName := aScientificName.
]

{ #category : #'as yet unclassified' }
Problems >> withVulgarName: aVulgarName aScientificName: aScientificName aDescription: aDescription [
	vulgarName := aVulgarName.
	scientificName := aScientificName.
	description := aDescription
]

{ #category : #'as yet unclassified' }
Problems >> withVulgarName: aVulgarName aScientificName: aScientificName aUrl: aUrl [ 
	vulgarName := aVulgarName.
	scientificName := aScientificName.
	url := aUrl.

]

{ #category : #'as yet unclassified' }
Problems >> withVulgarName:aVulgarName aScientificName: aScientificName aUrl: aUrl aDescription:aDescription [.
vulgarName := aVulgarName .
scientificName := aScientificName .
url := aUrl .
description := aDescription .
]
