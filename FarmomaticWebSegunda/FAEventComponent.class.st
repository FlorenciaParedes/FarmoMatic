Class {
	#name : #FAEventComponent,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'event'
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
FAEventComponent >> conditionalRender: html [
	html
		text:
			(((event type match: 'Problem') or: (event type match: 'Harvest'))
				ifTrue: [ ' | Scientific Name: ' , event getPredefined scientificName
						, ' | Url: ' , event getPredefined url ]).
	html
		text:
			((event type match: 'Aplication')
				ifTrue: [ ' | Comercial Name: ' , event getPredefined comercialName, ' | Composition: ' , event getPredefined composition ]).
	html break.
	html break
]

{ #category : #initialization }
FAEventComponent >> generalEventRender: html [
	html strong with: 'Creation Date '.
	html paragraph: event creationDate.
	html space.
	html strong with: 'Author '.
	html paragraph: event author fullName .
	html space
]

{ #category : #initialization }
FAEventComponent >> ifExpertRender: html [
	user expert
		ifFalse: [ html strong with: 'Comment: '.
			html paragraph: 'Comment'.
			html break ]
]

{ #category : #initialization }
FAEventComponent >> renderContentOn: html [
	html
		tbsRow: [ html tbsColumn: [ super renderContentOn: html ] mediumSize: 3.
			html
				tbsColumn: [ "event type"
					html div
						id: 'mainHeader';
						with: [ html render: (header withRoot: rootComp andSystem: farmomatic) ].
					html break.

					html horizontalRule.
					html break.
					html strong with: 'Type: '.
					html paragraph: event type.
					html strong with: 'Characteristics: '.
					html
						text:
							'Name: ' , event getPredefined name , ' | Description: '
								, event getPredefined description.
					html break.
					self conditionalRender: html.
					self generalEventRender: html.
					self ifExpertRender: html.
					html horizontalRule.
					html break ]
				mediumSize: 8 ]
]

{ #category : #initialization }
FAEventComponent >> withUser: userFarmo farmomatic: aFarmomatic event: aEvent [ 

self withUser: userFarmo farmomatic: aFarmomatic .
event := aEvent 
]
