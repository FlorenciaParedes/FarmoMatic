Class {
	#name : #FAProductForm,
	#superclass : #FAListFormStrategy,
	#instVars : [
		'comercialName',
		'composition'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #accessing }
FAProductForm >> form: html [
	"	comercialName composition "

	html break.
	html strong: 'ComercialName *'.
	html break.
	html textInput
		placeholder: 'Enter an comercialName';
		callback: [ :value | comercialName := value ];
		required.
	html break.
	html strong: 'Composition'.
	html break.
	html textInput
		placeholder: 'Enter a composition';
		callback: [ :value | composition := value ];
		required
]

{ #category : #accessing }
FAProductForm >> save [
	farmomatic
		withComercialName: comercialName
		aVulgarName: name
		aComposition: composition
		aDescription: description.
			self return
]
