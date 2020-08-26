Class {
	#name : #FAFormEventHarvestStrategy,
	#superclass : #FAFormEventStrategy,
	#classInstVars : [
		'select'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAFormEventHarvestStrategy >> renderVarietyForm: html [
predefinedList :=  farmomatic varietyList. 
	html
		form: [self formWithAmount: html ]
]

{ #category : #initialization }
FAFormEventHarvestStrategy >> save [

farmomatic addHarvestWithAuthor: user Comments: comment  kg: amount variety: predefined  fromPlot: plot.
container answer.

]
