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
FAPlotComponent >> withFarm: selectedPlot farmomatic: system root: rootComponent [ 

	plot := selectedPlot.
	farmomatic := system.
	rootComp := rootComponent
]
