Class {
	#name : #FAFarmForm,
	#superclass : #FAFormsComponent,
	#instVars : [
		'name',
		'description',
		'address'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #actions }
FAFarmForm >> save [
	farm := farmomatic
		registerFarmWithName: name
		andDescription: description
		andAddress: address
		ofProducer: user.
	rootComp
		main:
			(FACardsGroupEvents
				withUser: user
				root: rootComp
				farmomatic: farmomatic).
	^ farm
]
