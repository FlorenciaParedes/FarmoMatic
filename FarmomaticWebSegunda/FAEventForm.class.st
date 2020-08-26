Class {
	#name : #FAEventForm,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'creationDate',
		'author',
		'comments',
		'plot'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #rendering }
FAEventForm >> renderComponent: html [ 
self
subclassResponsibility 
]
