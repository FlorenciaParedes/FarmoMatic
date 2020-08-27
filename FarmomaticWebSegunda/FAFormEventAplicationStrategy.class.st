Class {
	#name : #FAFormEventAplicationStrategy,
	#superclass : #FAFormEventStrategy,
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAFormEventAplicationStrategy >> renderVarietyForm: html [

predefinedList :=  farmomatic productList.  
	html
		form: [ self formWithAmount: html ]
]

{ #category : #initialization }
FAFormEventAplicationStrategy >> save [

farmomatic addaplicationWithAuthor: user Comments: comment Amount: amount Product: predefined fromPlot: plot.
container answer.


]

{ #category : #initialization }
FAFormEventAplicationStrategy >> selectPredefined: html [

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
