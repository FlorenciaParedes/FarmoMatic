Class {
	#name : #FAHeaderSegunda,
	#superclass : #WAComponent,
	#instVars : [
		'titleHeader',
		'rootComponent',
		'farmomatic'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #rendering }
FAHeaderSegunda class >> withRoot: root [ 

	^ self new withRoot: root 
]

{ #category : #rendering }
FAHeaderSegunda class >> withRoot: root andSystem: aFarmomatic [ 
	^ self new withRoot: root andSystem: aFarmomatic
]

{ #category : #rendering }
FAHeaderSegunda >> initialize [ 

super initialize.
titleHeader := 'Farmomatic'
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
			html div
				id: 'changeUser';
				with: [ html tbsButton
						class: 'changeUser';
						with: [ html anchor
								callback: [ self switchToExpert ];
								with: 'Expert user' ].
						html tbsButton
						class: 'changeUser';
						with: [
						html anchor
						callback: [ self switchToProducer ];
						with: 'Producer user' ].
					html tbsButton
						class: 'changeUser';
						with: [ html anchor
								callback: [ self switchToProducerEmpty ];
								with: 'Empty producer user' ]].

			html div
				id: 'headerB';
				with: [ html tbsButton
						class: 'headerButtom';
						with: [ html anchor with: 'BACK' ] ] ]
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
	rootComponent
		main:
			(FACardsGroupFarmsSegunda
				withUser: user
				root: rootComponent
				farmomatic: farmomatic)
]

{ #category : #'as yet unclassified' }
FAHeaderSegunda >> switchToProducer [
	| user |
	user := farmomatic users
		detect: [ :each | each fullName match: 'Jorge Schelotto' ].
	rootComponent main: (FACardsGroupFarmsSegunda withUser: user root: rootComponent farmomatic: farmomatic ).
	
]

{ #category : #'as yet unclassified' }
FAHeaderSegunda >> switchToProducerEmpty [
	| user |
	user := farmomatic users
		detect: [ :each | each fullName match: 'Alex Morales' ].
	rootComponent
		main:
			(FACardsGroupFarmsSegunda
				withUser: user
				root: rootComponent
				farmomatic: farmomatic)
]

{ #category : #rendering }
FAHeaderSegunda >> withRoot: root [ 

	rootComponent := root
]

{ #category : #rendering }
FAHeaderSegunda >> withRoot: root andSystem: aFarmomatic [
	rootComponent := root.
	farmomatic:= aFarmomatic 
]
