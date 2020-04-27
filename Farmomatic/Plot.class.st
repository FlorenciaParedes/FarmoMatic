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

{ #category : #constructor }
Plot class >> id: anId andDescription: aDescription andSurface: aSurface andIsHothouse: isHothouse [
	^ self new
		id: anId
		andDescription: aDescription
		andSurface: aSurface
		andIsHothouse: isHothouse
]

{ #category : #setter }
Plot >> id: anId andDescription: aDescription andSurface: aSurface andIsHothouse: isHothouse [
	id := anId.
	description := aDescription.
	surface := aSurface.
	hothouse := isHothouse
]
