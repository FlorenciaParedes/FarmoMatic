Class {
	#name : #Plot,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'surface',
		'hothouse'
	],
	#category : #Farmomatic
}

{ #category : #'as yet unclassified' }
Plot class >> id: anId andDescription: aDescription andSurface: aSurface andIsHothouse: isHothouse [
	^ self new
		id: anId
		andDescription: aDescription
		andSurface: aSurface
		andIsHothouse: isHothouse
]

{ #category : #'as yet unclassified' }
Plot >> id: anId andDescription: aDescription andSurface: aSurface andIsHothouse: isHothouse [
	id := anId.
	description := aDescription.
	surface := aSurface.
	hothouse := isHothouse
]
