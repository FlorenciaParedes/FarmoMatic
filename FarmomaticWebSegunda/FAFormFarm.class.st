Class {
	#name : #FAFormFarm,
	#superclass : #FAFormsComponent,
	#instVars : [
		'name',
		'description',
		'address'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAFormFarm >> renderContentOn: html [
	html
		tbsRow: [ html tbsColumn: [ super renderContentOn: html ] mediumSize: 3.
			html
				tbsColumn: [ html div
						id: 'mainHeader';
						with: [ html render: (header withRoot: rootComp) ].
					html heading
						level: 2;
						with: 'Add new farm'.
					html
						form: [ html strong: 'Name *'.
							html break.
							html textInput
								placeholder: 'Enter a name';
								callback: [ :value | name := value ];
								required.
							html break.
							html strong: 'Description *'.
							html break.
							html textInput
								placeholder: 'Enter a description ';
								callback: [ :value | description := value ];
								required.
							html break.
							html strong: 'Address'.
							html break.
							html textInput
								placeholder: 'Enter an address';
								callback: [ :value | address := value ].
							html break.
							html tbsSubmitButton
								bePrimary;
								class: 'farmFormButtom';
								callback: [ self save ];
								with: 'SAVE' ] ]
				mediumSize: 3 ]
]

{ #category : #actions }
FAFormFarm >> save [
	farm := farmomatic
		registerFarmWithName: name
		andDescription: description
		andAddress: address
		ofProducer: user.
	rootComp
		main:
			(FACardsGroupFarmsSegunda
				withUser:
					user
				root: rootComp
				farmomatic: farmomatic).
	^ farm
]
