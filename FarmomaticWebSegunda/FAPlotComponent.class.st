Class {
	#name : #FAPlotComponent,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'farm',
		'pots',
		'plot'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAPlotComponent >> renderContentOn: html [

	html
		tbsRow: [ html tbsColumn: [ super renderContentOn: html ] mediumSize: 3.
			html
				tbsColumn: [ html div
						id: 'mainHeader';
						with: [ html render: (header withRoot: rootComp andSystem: farmomatic) ].
					html break.
					html horizontalRule.
					html break.
					html paragraph: 'ID Numbre: ', plot id.
					html paragraph: 'Description: ', plot description.
					html paragraph: [html text: 'Is Hothouse: '. html text: plot hothouse ].
					html horizontalRule.
					html paragraph: 'Eventos: ' .
					plot events do: [ :elem | html paragraph: 'Type: ', elem type. html paragraph: 'Comments: ', elem comments. html paragraph: elem creationDate. html horizontalRule.  ].
					html break.
					html break. ] mediumSize: 9 ]
]

{ #category : #initialization }
FAPlotComponent >> withFarm: selectedPlot farmomatic: system root: rootComponent [ 

	plot := selectedPlot.
	farmomatic := system.
	rootComp := rootComponent
]
