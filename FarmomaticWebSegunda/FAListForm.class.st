Class {
	#name : #FAListForm,
	#superclass : #FAFormsComponent,
	#instVars : [
		'name',
		'description',
		'list',
		'scientificName',
		'url',
		'strategy'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #rendering }
FAListForm >> determineStrategy [
	list = 'Problems'
		ifTrue: [ strategy := FAProblemForm
				withUser: user
				root: rootComp
				farmomatic: farmomatic ].
	list = 'Products'
		ifTrue: [ strategy := FAProductForm withUser: user
				root: rootComp
				farmomatic: farmomatic ].
	list = 'Species'
		ifTrue: [ strategy := FASpecieForm withUser: user
				root: rootComp
				farmomatic: farmomatic ].
	list = 'Variety'
		ifTrue: [ strategy := FAVarietyForm withUser: user
				root: rootComp
				farmomatic: farmomatic ]
]

{ #category : #initialization }
FAListForm >> renderComponent: html [
	html heading
		level: 2;
		with: 'NEW LIST'.
	html
		form: [ html break.
			html heading
				level: 3;
				with: 'select a list to add an item:'.
			html select
				list: #(' ' 'Problems' 'Products' 'Species' 'Variety');
				onChange: 'submit()';
				callback: [ :value | list := value ] ].
	html horizontalRule.
	list
		ifNotNil: [ self determineStrategy.
			strategy renderForm: html ]
]
