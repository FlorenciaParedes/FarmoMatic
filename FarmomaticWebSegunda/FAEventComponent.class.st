Class {
	#name : #FAEventComponent,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'event',
		'strategy'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAEventComponent class >> withUser: userFarmo farmomatic: aFarmomatic event: aEvent [ 

^ self new withUser: userFarmo farmomatic: aFarmomatic event: aEvent 
]

{ #category : #initialization }
FAEventComponent >> back [ 
self answer
]

{ #category : #initialization }
FAEventComponent >> baseRender: html [
	html
		text:
			'Name: ' , event getPredefined name , ' | Description: '
				, event getPredefined description.
	html break
]

{ #category : #initialization }
FAEventComponent >> generalEventRender: html [
	html strong with: 'Creation Date '.
	html paragraph: event creationDate.
	html space.
	html strong with: 'Author '.
	html paragraph: event author fullName.
	html space
]

{ #category : #initialization }
FAEventComponent >> ifNotExpertRender: html [
	user expert
		ifTrue: [ ^self ].
		html strong with: 'Comment: '.
			html paragraph: event comments.
			html break
]

{ #category : #initialization }
FAEventComponent >> renderComponent: html [
	self backButton: html.
	self selectStrategy.

	html break.
	html strong with: 'Type: '.
	html paragraph: event type.
	html strong with: 'Characteristics: '.
	html break.
	self baseRender: html.
	strategy ifNotNil: [ strategy renderStrategyOn: html ].
	html break.
	html break.
	self generalEventRender: html.
	self ifNotExpertRender: html.
	html horizontalRule.
	html break
]

{ #category : #initialization }
FAEventComponent >> selectStrategy [

(event type match: 'Problem') ifTrue: [ strategy := FAStrategyRenderProblem withEvent: event container: self ].
(event type match: 'Aplication') ifTrue: [ strategy := FAStrategyRenderAplication withEvent: event container: self ].
(event type match: 'Harvest')  ifTrue: [ strategy := FAStrategyRenderHarvest withEvent: event container: self ].
(event type match: 'Plantation')  ifTrue: [ strategy := FAStrategyRenderPlantation withEvent: event container: self ].
]

{ #category : #initialization }
FAEventComponent >> withUser: userFarmo farmomatic: aFarmomatic event: aEvent [ 

self withUser: userFarmo farmomatic: aFarmomatic .
event := aEvent 
]
