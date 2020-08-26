Class {
	#name : #FAPlotComponent,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'farm',
		'pots',
		'plot',
		'orderByType',
		'orderByDate',
		'type'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #'as yet unclassified' }
FAPlotComponent class >> withPlot: aPlot user: aUser farmomatic: aFarmomatic  root: aRoot [ 
	^ self new withPlot: aPlot user: aUser farmomatic: aFarmomatic  root: aRoot
]

{ #category : #initialization }
FAPlotComponent >> addEvent [

self call: (FAFormEvent withUser: user farmomatic: farmomatic  plot: plot)
]

{ #category : #initialization }
FAPlotComponent >> back [
self answer 
]

{ #category : #initialization }
FAPlotComponent >> dateAsceding [
]

{ #category : #initialization }
FAPlotComponent >> dateDesceding [
 true inform: 'descenso'
]

{ #category : #initialization }
FAPlotComponent >> initialize [ 
super initialize .

"table := FADataTableSegunda new"


]

{ #category : #initialization }
FAPlotComponent >> order: orderBy [

(orderBy match: '*type*') ifTrue: [ (orderBy match: '*descending*') ifTrue: [ self typeDesceding ] ifFalse: [ self typeAsceding ] ].
(orderBy match: '*date*') ifTrue: [ (orderBy match: '*descending*') ifTrue: [ self dateDesceding ] ifFalse: [ self dateAsceding ] ]
]

{ #category : #initialization }
FAPlotComponent >> renderContentOn: html [
	| eventsList headerTable table |
	eventsList := plot events.
	headerTable := (OrderedCollection new). 
	headerTable add: 'Name'; add: 'Date'; add:'Amount'; add: 'Author'; add: 'Select'.
	table := FADataTableSegunda withTitle: 'Eventos' headers: headerTable data: eventsList system: farmomatic user: user render: self. 

	html
		tbsRow: [ html tbsColumn: [ super renderContentOn: html ] mediumSize: 3.
			html
				tbsColumn: [ html div
						id: 'mainHeader';
						with: [ html render: (header withRoot: rootComp andSystem: farmomatic) ].
					html break.
					html tbsButton
						class: 'addFarmButtom';
						with: [ html anchor
								callback: [ self addEvent];
								with: 'ADD EVENT' ].
							html space.
					html tbsButton
						class: 'addFarmButtom';
						with: [ html anchor
								callback: [ self back];
								with: 'BACK' ].
					html horizontalRule.
										html paragraph: 'DATOS DEL PLOT: '.
					html paragraph: 'ID Numbre: ', plot id.
					html paragraph: 'Description: ', plot description.
					html paragraph: [html text: 'Is Hothouse: '. html text: plot hothouse ].
					html break.
					html break.
					html break.
					table renderContentOn: html.
					html break.
					html break. ] mediumSize: 8 ]
]

{ #category : #initialization }
FAPlotComponent >> typeAsceding [
]

{ #category : #initialization }
FAPlotComponent >> typeDesceding [
]

{ #category : #'as yet unclassified' }
FAPlotComponent >> withPlot: aPlot user: aUser farmomatic: aFarmomatic  root: aRoot [
	plot := aPlot .
	user :=aUser .
	farmomatic :=aFarmomatic .
	rootComp := aRoot 
]
