Class {
	#name : #FAFormEventStrategy,
	#superclass : #WAComponent,
	#instVars : [
		'event',
		'predefinedList',
		'farmomatic',
		'user',
		'plot',
		'predefined',
		'comment',
		'amount',
		'container'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAFormEventStrategy class >> withSistem: aFarmomatic activeUser: aUser plot: aPlot container: aContainer [ 

^self new withSistem: aFarmomatic activeUser: aUser plot: aPlot container: aContainer 
]

{ #category : #initialization }
FAFormEventStrategy >> amountInput: html [
	html break.
	html strong: 'Amount'.
	html break.
	html textInput
		placeholder: 'Enter a amount';
		callback: [ :value | amount := value ];
		required
]

{ #category : #initialization }
FAFormEventStrategy >> choosePredefined: aValue [

predefined := aValue
]

{ #category : #initialization }
FAFormEventStrategy >> commentInput: html [
	html break.
	html break.
	html strong: 'Comments: '.
	html break.
	html textInput
		placeholder: 'Enter a Comment:';
		callback: [ :value | comment := value ]
]

{ #category : #initialization }
FAFormEventStrategy >> formWithAmount: html [
	self selectPredefined: html.
	self amountInput: html.
	self commentInput: html.
	self saveButton: html
]

{ #category : #initialization }
FAFormEventStrategy >> renderVarietyForm: html [

]

{ #category : #initialization }
FAFormEventStrategy >> saveButton: html [
	html break.
	^ html tbsSubmitButton
		bePrimary;
		class: 'plotFarmButtom';
		callback: [ self save ];
		with: 'SAVE'
]

{ #category : #initialization }
FAFormEventStrategy >> withList: aList [

	predefinedList := aList
]

{ #category : #initialization }
FAFormEventStrategy >> withSistem: aFarmomatic activeUser: aUser plot: aPlot container: aContainer [ 

farmomatic := aFarmomatic.
user := aUser.
plot := aPlot.
container := aContainer

]
