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

{ #category : #initialization }
FAFormEventHarvestStrategy >> selectPredefined: html [

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
