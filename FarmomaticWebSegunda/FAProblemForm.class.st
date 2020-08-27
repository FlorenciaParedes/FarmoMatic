Class {
	#name : #FAProblemForm,
	#superclass : #FAListFormStrategy,
	#instVars : [
		'scientificName',
		'url'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #accessing }
FAProblemForm >> form: html [
	html break.
	html strong: 'ScientificName *'.
	html break.
	html textInput
		placeholder: 'Enter an scientificName';
		callback: [ :value | scientificName := value ];
		required.
	html break.
	html strong: 'Url '.
	html break.
	html textInput
		placeholder: 'Enter a url';
		callback: [ :value | url := value ]
]

{ #category : #accessing }
FAProblemForm >> save [
	farmomatic
		addTroubleWithVulgarName: name
		aScientificName: scientificName
		aUrl: url
		aDescription: description.
self return
]
