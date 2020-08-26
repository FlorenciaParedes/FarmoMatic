Class {
	#name : #FAStrategyEventComponent,
	#superclass : #WAComponent,
	#instVars : [
		'event',
		'container'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #rendering }
FAStrategyEventComponent class >> withEvent: aEvent [

^ self new withEvent: aEvent
]

{ #category : #rendering }
FAStrategyEventComponent class >> withEvent: aEvent container: aContainer [

^ self new withEvent: aEvent container: aContainer
]

{ #category : #initialization }
FAStrategyEventComponent >> rederScientificNameAndUrl: html [
	html
		text:
			' | Scientific Name: ' , event getPredefined scientificName
				, ' | Url: ' , event getPredefined url
]

{ #category : #rendering }
FAStrategyEventComponent >> renderStrategyOn: html [
]

{ #category : #rendering }
FAStrategyEventComponent >> withEvent: aEvent [

event := aEvent 
]

{ #category : #rendering }
FAStrategyEventComponent >> withEvent: aEvent container: aContainer [

event := aEvent.
container :=  aContainer.
]
