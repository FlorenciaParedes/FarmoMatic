Class {
	#name : #FAFormEventPlantationStrategy,
	#superclass : #FAFormEventStrategy,
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAFormEventPlantationStrategy >> renderVarietyForm: html [
	predefinedList :=  farmomatic speciesList .  
	html form:
		[ self formWithAmount: html ]
]

{ #category : #initialization }
FAFormEventPlantationStrategy >> save [

farmomatic addPlantationWithAuthor: user Comments: comment Amount: amount Specie: predefined fromPlot: plot.
container answer.

]

{ #category : #initialization }
FAFormEventPlantationStrategy >> selectPredefined: html [

	html break.
	html select
		selected: predefined;
		list: predefinedList;
		labels: [ :each | each name ];
		onChange: 'submit()';
		callback: [ :value | 
			self choosePredefined: value.
			html inform: value className ];
		required
]
