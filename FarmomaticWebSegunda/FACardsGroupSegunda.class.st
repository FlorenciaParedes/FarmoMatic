Class {
	#name : #FACardsGroupSegunda,
	#superclass : #FAScreenComponentSegunda,
	#category : #FarmomaticWebSegunda
}

{ #category : #rendering }
FACardsGroupSegunda >> lookFarm: farm [
	rootComp history: rootComp.
	self show: (rootComp  main: (FAFarmComponent new withFarm: farm farmomatic: farmomatic  root: rootComp  ))
]

{ #category : #rendering }
FACardsGroupSegunda >> renderContentOn: html [
	html
		tbsRow: [ html tbsColumn: [ super renderContentOn: html ] mediumSize: 3.
			html
				tbsColumn: [ html div
						id: 'mainHeader';
						with: [ html render: (header withRoot: rootComp andSystem: farmomatic) ].
					html break.
					html horizontalRule.
					html break.
					user farms
						do: [ :elem | 
							html
								tbsColumn: [ html tbsThumbnail
										id: 'card';
										with: [ html image placeHolder: '100%x100%'.
											html break.
											html paragraph: elem name.
											html paragraph: elem description.
											html anchor
												callback: [ self lookFarm: elem ];
												with: 'Ver Mas' ] ]
								mediumSize: 4 ] ]
				mediumSize: 9 ]
]
