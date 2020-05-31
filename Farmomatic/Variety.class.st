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
	description:		<Object>
	scientificName:		<Object>
	url:		<Object>
	vulgarName:		<Object>


    Implementation Points
"
Class {
	#name : #Variety,
	#superclass : #PredefinedList,
	#instVars : [
		'scientificName',
		'url',
		'description'
	],
	#category : #Farmomatic
}

{ #category : #constructor }
Variety class >> withVulgarName: aName scientificName: aScientificName  url: aUrl description: aDescription [ 

^ self new withVulgarName: aName scientificName: aScientificName  url: aUrl description: aDescription 
]

{ #category : #'instance creation' }
Variety >> applied: themeOfTheNews [
^ (self == themeOfTheNews )
]

{ #category : #constructor }
Variety >> withVulgarName: aName scientificName: aScientificName  url: aUrl description: aDescription [ 
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	name:= aName.
	scientificName:= aScientificName.
	url:= aUrl.
	description:= aDescription
]
