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
	#superclass : #PredefinedList,
	#instVars : [
		'scientificName',
		'url',
		'description'
	],
	#category : #Farmomatic
}

{ #category : #constructor }
Problems class >> withVulgarName:aVulgarName aScientificName: aScientificName aUrl: aUrl aDescription:aDescription [.
^ self new withVulgarName:aVulgarName aScientificName: aScientificName aUrl: aUrl aDescription:aDescription.
]

{ #category : #constructor }
Problems >> applied: themeOfTheNews [
	^ (name match: themeOfTheNews) or: (scientificName match: themeOfTheNews )
]

{ #category : #constructor }
Problems >> withVulgarName:aVulgarName aScientificName: aScientificName aUrl: aUrl aDescription:aDescription [.
name := aVulgarName .
scientificName := aScientificName .
url := aUrl .
description := aDescription .
]
