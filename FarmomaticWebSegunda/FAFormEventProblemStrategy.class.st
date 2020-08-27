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

{ #category : #initialization }
FAFormEventProblemStrategy >> selectPredefined: html [

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
