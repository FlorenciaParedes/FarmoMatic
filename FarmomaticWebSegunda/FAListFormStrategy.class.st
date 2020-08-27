Class {
	#name : #FAListFormStrategy,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'name',
		'description'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #accessing }
FAListFormStrategy >> form:html [ 
]

{ #category : #rendering }
FAListFormStrategy >> renderForm: html [
	html
		form: [ html strong: 'Name *'.
			html break.
			html textInput
				placeholder: 'Enter an name';
				callback: [ :value | name := value ];
				required.
			html break.
			html strong: 'Description '.
			html break.
			html textInput
				placeholder: 'Enter an description';
				callback: [ :value | description := value ].
			self form: html.
			html break .html tbsSubmitButton
				bePrimary;
				class: 'listFormButtom';
				callback: [ self save ];
				with: 'SAVE' ]
]

{ #category : #handling }
FAListFormStrategy >> return [ 
	self show: (FACardsGroupEvents
				withUser: user
				farmomatic: farmomatic)
]

{ #category : #accessing }
FAListFormStrategy >> save [ self subclassResponsibility 
	
]
