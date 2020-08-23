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
FAEventForm class >> withUser: userFarmo farmomatic: aFarmomatic plot: aPlot [
^ self new withUser: userFarmo farmomatic: aFarmomatic plot: aPlot
]

{ #category : #rendering }
FAEventForm >> back [
self answer 
]

{ #category : #rendering }
FAEventForm >> choose: value [
]

{ #category : #rendering }
FAEventForm >> renderEvent: html [

					html select
					selected: farmomatic predefinedList first;
					list: farmomatic predefinedList;
					onChange: 'submit()';
					callback: [ :value | self choose: value ].
								
]

{ #category : #rendering }
FAEventForm >> save [
]

{ #category : #rendering }
FAEventForm >> withUser: userFarmo farmomatic: aFarmomatic plot: aPlot [
	self withUser: userFarmo farmomatic: aFarmomatic.
	plot:=aPlot
]
