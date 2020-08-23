Class {
	#name : #FACardsGroupEvents,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'plots'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FACardsGroupEvents >> renderContentOn: html [
	html
		tbsRow: [ html tbsColumn: [ super renderContentOn: html ] mediumSize: 3.
			html
				tbsColumn: [ html div
						id: 'mainHeader';
						with: [ html render: (header withRoot: rootComp andSystem: farmomatic) ].
					html break.
					user isNotNil
						ifTrue: [ farmomatic events
								do: [ :elem | 
									html
										tbsColumn: [ html tbsThumbnail
												id: 'card';
												with: [ html break.
													html paragraph: elem type.
													html paragraph: 'author: ' , elem author fullName.
													html anchor
														callback: [ self "ver evento"];
														with: 'Ver Mas'  ] ]
										mediumSize: 4 ] ] ]
				mediumSize: 9 ]
]
