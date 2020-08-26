Class {
	#name : #FAStrategyRenderHarvest,
	#superclass : #FAStrategyEventComponent,
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAStrategyRenderHarvest >> renderStrategyOn: html [
	self rederScientificNameAndUrl: html. 
	html text: ' | Amount '.
	html text: event amount.
	html text: ' KG.'
]
