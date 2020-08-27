Class {
	#name : #FAHeaderSegunda,
	#superclass : #WAComponent,
	#instVars : [
		'titleHeader',
		'farmomatic',
		'container'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #rendering }
FAHeaderSegunda class >> withSystem: aFarmomatic container: aContainer [
	^ self new withSystem: aFarmomatic container: aContainer
]

{ #category : #rendering }
FAHeaderSegunda >> back [

container answer
]

{ #category : #rendering }
FAHeaderSegunda >> initialize [ 

super initialize.
titleHeader := 'Farmomatic'
]

{ #category : #rendering }
FAHeaderSegunda >> renderButtons:html [
	html div
				id: 'changeUser';
				with: [ html tbsButton
						class: 'changeUser';
						with: [ html anchor
								callback: [ self switchToExpert ];
								with: 'Expert user' ].
					html tbsButton
						class: 'changeUser';
						with: [ html anchor
								callback: [ self switchToProducer ];
								with: 'Producer user' ].
					html tbsButton
						class: 'changeUser';
						with: [ html anchor
								callback: [ self switchToProducerEmpty ];
								with: 'Empty producer user' ] ].
]

{ #category : #rendering }
FAHeaderSegunda >> renderContentOn: html [
	html div
		id: 'headerContainer';
		with: [ html div
				id: 'headerA';
				with: [ html heading
						level: 1;
						with: titleHeader ].
		self renderButtons: html.
			html horizontalRule ]
]

{ #category : #rendering }
FAHeaderSegunda >> style [
	^ '
#headerContainer { 
	color: #5F926D;
	display: flex;
	flex-direction: column;
	margin: .5em .5em .5em 0em;
	justify-content: left;
	font-style: normal;
	font-weight: normal;
	font-size: 1.2em;
	line-height: 103px;
	text-align: left;



 }



#headerA
{ 
	
	margin: .5em .5em .5em 0em;
 }

#headerB
{ 
	display: flex;
	flex-direction: row;
	margin: .25em;
 }

#headerButtom { 
box-shadow: 6px 4px 6px rgba(0, 0, 0, 0.5);
 }

#changeUser { 
	text-align: right; }

'
]

{ #category : #'as yet unclassified' }
FAHeaderSegunda >> switchToExpert [
	| user |
	user := farmomatic users
		detect: [ :each | each fullName match: 'Maria González' ].
	container show: (FACardsGroupFarmsSegunda
				withUser: user
				farmomatic: farmomatic)
]

{ #category : #'as yet unclassified' }
FAHeaderSegunda >> switchToProducer [
	| user |
	user := farmomatic users
		detect: [ :each | each fullName match: 'Jorge Schelotto' ].
	container show: (FACardsGroupFarmsSegunda withUser: user farmomatic: farmomatic ).
	
]

{ #category : #'as yet unclassified' }
FAHeaderSegunda >> switchToProducerEmpty [
	| user |
	user := farmomatic users
		detect: [ :each | each fullName match: 'Alex Morales' ].
	container show:
			(FACardsGroupFarmsSegunda
				withUser: user
				farmomatic: farmomatic)
]

{ #category : #rendering }
FAHeaderSegunda >> withSystem: aFarmomatic container: aContainer [
	farmomatic:= aFarmomatic. 
	container := aContainer
]
