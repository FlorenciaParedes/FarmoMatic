Class {
	#name : #FAFormEventPlantationStrategy,
	#superclass : #FAFormEventStrategy,
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAFormEventPlantationStrategy >> renderVarietyForm: html [
	predefinedList := farmomatic speciesList.
	html form:
		[ self formWithAmount: html ]
]

{ #category : #initialization }
FAFormEventPlantationStrategy >> save [

farmomatic addPlantationWithAuthor: user Comments: comment Amount: amount Specie: predefined fromPlot: plot.
container answer.

]
