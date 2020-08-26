Class {
	#name : #FAFormEventProblemStrategy,
	#superclass : #FAFormEventStrategy,
	#instVars : [
		'variety'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAFormEventProblemStrategy >> renderVarietyForm: html [

predefinedList :=  farmomatic problemsList.  
	html
		form: [ 
			self selectPredefined: html.
			self commentInput: html.
			self saveButton: html ]
]

{ #category : #initialization }
FAFormEventProblemStrategy >> save [

farmomatic addProblemWithAuthor: user Comments: comment Problem: predefined fromPlot: plot.
container answer.

]
