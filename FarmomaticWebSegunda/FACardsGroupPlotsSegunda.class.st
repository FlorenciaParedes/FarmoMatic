Class {
	#name : #FACardsGroupPlotsSegunda,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'plots'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FACardsGroupPlotsSegunda >> initialize [ 

super initialize 
]

{ #category : #initialization }
FACardsGroupPlotsSegunda >> lookPlot: plot [

	self show: (rootComp  main: (FAFarmComponent new withFarm: plot farmomatic: farmomatic  root: rootComp  ))
]

{ #category : #initialization }
FACardsGroupPlotsSegunda >> renderContentOn: html [
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
						do: [ :elem | elem plots do: [ :plot | 
							html
								tbsColumn: [ html tbsThumbnail
										id: 'card';
										with: [ html image placeHolder: '100%x100%'.
											html break.
											html paragraph: plot id.
											html paragraph: plot description.
											html paragraph: plot surface .
											html paragraph: plot hothouse.
											html paragraph: plot description.
											html anchor
												callback: [ self lookPlot: plot ];
												with: 'Ver Mas' ] ]
								mediumSize: 4 ]] ]
				mediumSize: 9 ]
]
