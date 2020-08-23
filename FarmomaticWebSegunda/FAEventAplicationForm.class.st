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
FAEventAplicationForm >> renderContentOn: html [
	html
		tbsRow: [ html tbsColumn: [ super renderContentOn: html ] mediumSize: 3.
			html
				tbsColumn: [ html div
						id: 'mainHeader';
						with: [ html render: (header withRoot: rootComp) ].
					html heading
						level: 2;
						with: 'Add new Event'.
					html
						form: [ 
							self renderEvent: html.
							html break.
							html strong: 'Product *'.
							html break.
							html textInput
								placeholder: 'Enter an product';
								callback: [ :value | product  := value ];
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
								with: 'SAVE' ] ]
				mediumSize: 3 ]
]

{ #category : #initialization }
FAEventAplicationForm >> save [
	farmomatic addaplicationWithAuthor: user Comments: comments  Amount: amount Product: product fromPlot: plot.
	self answer.
]
