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
	author:		<Object>
	comments:		<Object>
	date:		<Object>


    Implementation Points
"
Class {
	#name : #Event,
	#superclass : #Object,
	#instVars : [
		'creationDate',
		'author',
		'comments'
	],
	#category : #Farmomatic
}

{ #category : #accessing }
Event >> author [ 
^author
]

{ #category : #accessing }
Event >> creationDate [
^ creationDate 
]

{ #category : #initialization }
Event >> initialize [ 
 creationDate := Date today 
]

{ #category : #'instance creation' }
Event >> theme: themeOfTheNews [
]

{ #category : #accessing }
Event >> type [ 
^ SubclassResponsibility 
]

{ #category : #constructor }
Event >> withAuthor: aUser Comments: aComment [

author:= aUser.
comments:= aComment 

]
