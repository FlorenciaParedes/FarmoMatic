Class {
	#name : #FAFormEvent,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'creationDate',
		'author',
		'comments',
		'plot',
		'strategy',
		'eventsNamesList',
		'eventsNamesSelected'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #rendering }
FAFormEvent class >> withUser: userFarmo farmomatic: aFarmomatic plot: aPlot [
^ self new withUser: userFarmo farmomatic: aFarmomatic plot: aPlot
]

{ #category : #rendering }
FAFormEvent >> back [
self answer 
]

{ #category : #rendering }
FAFormEvent >> choose: value [

(value match: 'Harvest') ifTrue: [ strategy := (FAFormEventHarvestStrategy withSistem: farmomatic activeUser: user plot: plot container: self) ].
(value match: 'Problem') ifTrue: [ strategy := (FAFormEventProblemStrategy withSistem: farmomatic activeUser: user plot: plot container: self) ].
(value match: 'Aplication') ifTrue: [ strategy := (FAFormEventAplicationStrategy withSistem: farmomatic activeUser: user plot: plot container: self) ].
(value match: 'Plantation') ifTrue: [ strategy := (FAFormEventPlantationStrategy withSistem: farmomatic activeUser: user plot: plot container: self) ].
eventsNamesSelected := value
]

{ #category : #rendering }
FAFormEvent >> initialize [ 
super initialize.
eventsNamesList := #('Select an event' 'Harvest' 'Problem' 'Aplication' 'Plantation').
eventsNamesSelected := eventsNamesList.
]

{ #category : #initialization }
FAFormEvent >> renderComponent:  html [
					html tbsButton
						class: 'addFarmButtom';
						with: [ html anchor
								callback: [ self back ];
								with: 'BACK' ].
						html horizontalRule.

					html heading
						level: 2;
						with: 'Add new Event'.
					self renderEvent: html.
					html break.
					strategy
						ifNotNil: [ self show: (strategy renderVarietyForm: html) ] 
]

{ #category : #rendering }
FAFormEvent >> renderEvent: html [

					html form: [
					html select
					selected: eventsNamesSelected;
					list: eventsNamesList;
					onChange: 'submit()';
					callback: [ :value | self choose: value. html inform: value className. ]].
								
]

{ #category : #rendering }
FAFormEvent >> withUser: userFarmo farmomatic: aFarmomatic plot: aPlot [
	self withUser: userFarmo farmomatic: aFarmomatic.
	plot:=aPlot
]
