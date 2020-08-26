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

	self show: (FAPlotComponent new withPlot: plot user: user farmomatic: farmomatic  root: rootComp  )
]

{ #category : #initialization }
FACardsGroupPlotsSegunda >> renderComponent: html [
	
	user farms
		do: [ :elem | 
			elem plots
				do: [ :plot | 
					html
						tbsColumn: [ html tbsThumbnail
								id: 'card';
								with: [ html image placeHolder: '100%x100%'.
									html break.
									html strong with: 'ID: '.
									html paragraph: plot id.
									html strong with: 'Description: '.
									html paragraph: plot description.
									html strong with: 'Surface: '.
									html paragraph: plot surface.
									html strong with: 'Is hothouse: '.
									html paragraph: plot hothouse.
									html anchor
										callback: [ self lookPlot: plot ];
										with: 'Ver Mas' ] ]
						mediumSize: 4 ] ]
]
