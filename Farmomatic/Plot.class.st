Class {
	#name : #Plot,
	#superclass : #Object,
	#instVars : [
		'id',
		'description',
		'surface',
		'hothouse',
		'events'
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

{ #category : #adding }
Plot >> addHarvestWithDate: adate Author: aUser Comments: aComment kg: aKg variety: aVariety [
 
	|h|
	h:= Harvest withDate: adate Author: aUser Comments: aComment kg: aKg variety: aVariety.
	events add: h
]

{ #category : #adding }
Plot >> addHarvestWithDate: adate Author: aUser kg: aKg variety: aVariety [
	| h |
	h := Harvest
		withDate: adate
		Author: aUser
		kg: aKg
		variety: aVariety.
	events add: h
]

{ #category : #setter }
Plot >> addPlantationWithDate: adate Author: aUser Amount: amount Specie: aSpecie [
	| p |
	p := Plantation
		withDate: adate
		Author: aUser
		Amount: amount
		Specie: aSpecie.
	events add: p
]

{ #category : #setter }
Plot >> addPlantationWithDate: adate Author: aUser Comments: aComment Amount: amount Specie: aSpecie [
	| p |
	p := Plantation
		withDate: adate
		Author: aUser
		Comments: aComment
		Amount: amount
		Specie: aSpecie.
	events add: p
]

{ #category : #setter }
Plot >> addProblemWithDate: aDate Author: aUser Comments: aComment Problem: aProblem [
	| p |
	p := Problem withDate: aDate Author: aUser Comments: aComment Problem: aProblem.
	events add: p
]

{ #category : #setter }
Plot >> addProblemWithDate: aDate Author: aUser Problem: aProblem [
	| p |
	p := Problem
		withDate: aDate
		Author: aUser
		Problem: aProblem.
	events add: p
]

{ #category : #setter }
Plot >> addaplicationwithDate: aDate Author: aUser 	Comments: aComment Amount: amount	Product: aProduct [ 
	| p |
	p := Aplication
		withDate: aDate
		Author: aUser
		Comments: aComment
		Amount: amount
		Product: aProduct .
	events add: p
]

{ #category : #setter }
Plot >> id: anId andDescription: aDescription andSurface: aSurface andIsHothouse: isHothouse [
	id := anId.
	description := aDescription.
	surface := aSurface.
	hothouse := isHothouse
]

{ #category : #initialization }
Plot >> initialize [ 
events:= OrderedCollection new.
]
