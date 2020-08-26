Class {
	#name : #FAEventAplicationForm,
	#superclass : #FAEventForm,
	#instVars : [
		'product',
		'amount'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAEventAplicationForm >> renderComponent: html [
	html heading
		level: 2;
		with: 'Add new Event'.
	html
		form: [ self renderEvent: html.
			html break.
			html strong: 'Product *'.
			html break.
			html textInput
				placeholder: 'Enter an product';
				callback: [ :value | product := value ];
				required.
			html break.
			html strong: 'Amount'.
			html break.
			html textInput
				placeholder: 'Enter a amount';
				callback: [ :value | amount := value ].
			html break.
			html tbsSubmitButton
				bePrimary;
				class: 'plotFarmButtom';
				callback: [ self save ];
				with: 'SAVE' ]
]

{ #category : #initialization }
FAEventAplicationForm >> save [
	farmomatic addaplicationWithAuthor: user Comments: comments  Amount: amount Product: product fromPlot: plot.
	self answer.
]
