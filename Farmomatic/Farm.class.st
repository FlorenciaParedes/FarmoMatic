Class {
	#name : #Farm,
	#superclass : #Object,
	#instVars : [
		'name',
		'address',
		'plots',
		'description'
	],
	#category : #Farmomatic
}

{ #category : #'as yet unclassified' }
Farm class >> Name: aName andDescription: aDescription [.
	^ self new name: aName andDescription: aDescription
]

{ #category : #'as yet unclassified' }
Farm class >> Name: aName andDescription: aDescription andAddress: aAddress [
	^ self new name: aName andDescription: aDescription andAddress: aAddress
]

{ #category : #adding }
Farm >> addPlot: aPlot [
plots add: aPlot .
]

{ #category : #adding }
Farm >> initialize [ 
plots := OrderedCollection new.

]

{ #category : #'as yet unclassified' }
Farm >> name: aName andDescription: aDescription [
	name := aName.
	description := aDescription
]

{ #category : #'as yet unclassified' }
Farm >> name: aName andDescription: aDescription andAddress: aAddress [
	self name: aName andDescription: aDescription. 
	address := aAddress
]
