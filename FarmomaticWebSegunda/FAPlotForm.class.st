Class {
	#name : #FAPlotForm,
	#superclass : #FAFormsComponent,
	#instVars : [
		'id',
		'description',
		'surface',
		'hothouse'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAPlotForm class >> withUser: user root: rootComponent farmomatic: aFarmomatic farm: aFarm [ 
	^ self new withUser: user root: rootComponent farmomatic: aFarmomatic farm: aFarm 
]

{ #category : #actions }
FAPlotForm >> hothouseValue [
	hothouse = 'yes'
		ifTrue: [ hothouse := true ]
		ifFalse: [ hothouse := false ]
]

{ #category : #initialization }
FAPlotForm >> renderContentOn: html [
	html
		tbsRow: [ html tbsColumn: [ super renderContentOn: html ] mediumSize: 3.
			html
				tbsColumn: [ html div
						id: 'mainHeader';
						with: [ html render: (header withRoot: rootComp) ].
					html heading
						level: 2;
						with: 'Add new Plot'.
					html
						form: [ html strong: 'ID *'.
							html break.
							html textInput
								placeholder: 'Enter an ID';
								callback: [ :value | id := value ];
								required.
							html break.
							html strong: 'Description'.
							html break.
							html textInput
								placeholder: 'Enter a Description';
								callback: [ :value | description := value ].
							html break.
							html strong: 'Surface *'.
							html break.
							html numberInput
								placeholder: 'Enter a Surface';
								callback: [ :value | surface := value ];
								required.
							html break.
							html strong: 'Is a hothouse *'.
							html break.
							html select
								list: #('yes' 'no');
								callback: [ :value | hothouse := value ];
								required.
							html break.
							html tbsSubmitButton
								bePrimary;
								class: 'plotFarmButtom';
								callback: [ self save ];
								with: 'SAVE' ] ]
				mediumSize: 3 ]
]

{ #category : #actions }
FAPlotForm >> save [
	self hothouseValue.
	plot := farmomatic
		registerPlotWithId: id
		andDescription: description
		andSurface: surface
		andIsHothouse: hothouse
		fromFarm: farm.
	^ plot
]

{ #category : #initialization }
FAPlotForm >> withUser: aUser root: rootComponent farmomatic: aFarmomatic farm: aFarm [ 
	user := aUser.
	farmomatic := aFarmomatic.
	rootComp := rootComponent.
	farm := aFarm.
]
