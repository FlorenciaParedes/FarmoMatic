Class {
	#name : #FAFormPlot,
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
FAFormPlot class >> withUser: user root: rootComponent farmomatic: aFarmomatic farm: aFarm [ 
	^ self new withUser: user root: rootComponent farmomatic: aFarmomatic farm: aFarm 
]

{ #category : #actions }
FAFormPlot >> hothouseValue [
	hothouse = 'yes'
		ifTrue: [ hothouse := true ]
		ifFalse: [ hothouse := false ]
]

{ #category : #initialization }
FAFormPlot >> renderComponent: html [

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
								with: 'SAVE' ]
]

{ #category : #actions }
FAFormPlot >> save [
	self hothouseValue.
	plot := farmomatic
		registerPlotWithId: id
		andDescription: description
		andSurface: surface
		andIsHothouse: hothouse
		fromFarm: farm.
	rootComp
		main:
			(FACardsGroupPlotsSegunda 
				withUser: user
				root: rootComp
				farmomatic: farmomatic).
]

{ #category : #initialization }
FAFormPlot >> withUser: aUser root: rootComponent farmomatic: aFarmomatic farm: aFarm [ 
	user := aUser.
	farmomatic := aFarmomatic.
	rootComp := rootComponent.
	farm := aFarm.
]
