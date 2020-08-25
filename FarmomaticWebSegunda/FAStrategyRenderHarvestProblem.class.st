Class {
	#name : #FAStrategyRenderHarvestProblem,
	#superclass : #FAStrategyEventComponent,
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAStrategyRenderHarvestProblem >> renderStrategyOn: html [

	html
		text: ' | Scientific Name: ' , event getPredefined scientificName, ' | Url: ' , event getPredefined url.
]
