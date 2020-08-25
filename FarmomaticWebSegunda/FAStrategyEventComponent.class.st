Class {
	#name : #FAStrategyEventComponent,
	#superclass : #WAComponent,
	#instVars : [
		'event'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #rendering }
FAStrategyEventComponent class >> withEvent: aEvent [

^ self new withEvent: aEvent
]

{ #category : #rendering }
FAStrategyEventComponent >> renderStrategyOn: html [
]

{ #category : #rendering }
FAStrategyEventComponent >> withEvent: aEvent [

event := aEvent 
]
