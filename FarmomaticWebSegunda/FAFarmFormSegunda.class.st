Class {
	#name : #FAFarmFormSegunda,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'farm',
		'name',
		'description',
		'address'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #'as yet unclassified' }
FAFarmFormSegunda class >> withSystem: farmomatic [ 
	^ self new withSystem: farmomatic 
]

{ #category : #initialization }
FAFarmFormSegunda >> renderContentOn: html [


html tbsRow: [ 
			html tbsColumn: [ super renderContentOn: html ] mediumSize: 3.

	html tbsColumn: [ html div id: 'mainHeader';  with: [ html render: (header withRoot: rootComp) ].
	html heading
		level: 2;
		with: 'Add new farm'.
	html
		form: [ "	f ifNotNil: [ html inform: f name ]"
			html strong: 'Name'.
			html break.
			html textInput
				placeholder: 'Enter a name';
				callback: [ :value | name := value ].
			html break.
			html strong: 'Description'.
			html break.
			html textInput
				placeholder: 'Enter a description';
				callback: [ :value | description := value ].
			html break.
			html strong: 'Address'.
			html break.
			html textInput
				placeholder: 'Enter an address';
				callback: [ :value | address := value ].
			html break.
			html tbsSubmitButton
				bePrimary;
				class: 'headerButtom';
				callback: [ self save ];
				with: 'SAVE' ] 
] mediumSize: 3 ]
]

{ #category : #actions }
FAFarmFormSegunda >> save [
	| aUser |
	aUser := farmomatic users
		detect: [ :elem | elem fullName match: 'Jorge Schelotto' ].
	farm := farmomatic
		registerFarmWithName: name
		andDescription: description
		andAddress: address
		ofProducer: aUser.
		
	rootComp main:(FACardsGroupSegunda withUser:(farmomatic users
				detect: [ :userB | userB fullName match: 'Jorge Schelotto' ])  root: rootComp  farmomatic:farmomatic ) .	
	^ farm
]

{ #category : #'as yet unclassified' }
FAFarmFormSegunda >> withSystem: aFarmomatic [ 
	farmomatic := aFarmomatic.

]

{ #category : #'as yet unclassified' }
FAFarmFormSegunda >> withSystem: aFarmomatic  root: aRoot [
	farmomatic := aFarmomatic.
	rootComp := aRoot 

]
