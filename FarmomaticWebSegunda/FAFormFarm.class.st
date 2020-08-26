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
FAFormFarm >> renderComponent: html [
	
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
								with: 'SAVE' ] 
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
