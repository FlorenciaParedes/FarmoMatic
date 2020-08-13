Class {
	#name : #FAFarmComponent,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'farm',
		'pots'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAFarmComponent class >> withFarm: selectedFarm farmomatic: system [

^self new withFarm: selectedFarm farmomatic: system
]

{ #category : #initialization }
FAFarmComponent class >> withFarm: selectedFarm farmomatic: system root: rootComponent [ 

^self new withFarm: selectedFarm farmomatic: system root: rootComponent 
]

{ #category : #adding }
FAFarmComponent >> addPlot [
	self
		show:
			(rootComp 
				main: (FAPlotForm withSystem: farmomatic root: rootComp farm: farm ))
]

{ #category : #initialization }
FAFarmComponent >> date [
   ^ farm date
]

{ #category : #initialization }
FAFarmComponent >> renderContentOn: html [
	html
		tbsRow: [ html tbsColumn: [ super renderContentOn: html ] mediumSize: 3.
			html
				tbsColumn: [ html div
						id: 'mainHeader';
						with: [ html render: (header withRoot: rootComp andSystem: farmomatic) ].
					html break.
					html tbsButton
						class: 'addPlotButtom';
						with: [ html anchor
								callback: [ self addPlot ];
								with: 'ADD PLOT' ].
					html horizontalRule.
					html break.
					html heading
						level: 2;
						with: farm name.
					html strong with: 'Description: '.
					html paragraph: farm description.
					html break.
					html horizontalRule.
					html break.
					html heading
						level: 2;
						with: 'Plots '.
					farm plots
						do: [ :elem | 
							html
								render: [ html strong with: 'ID:'.
									html paragraph: elem id.
									html strong with: 'Description: '.
									html paragraph: elem description.
									html strong with: 'Surface: '.
									html paragraph: elem surface.
									html break ] ] ]
				mediumSize: 9 ]
]

{ #category : #initialization }
FAFarmComponent >> withFarm: selectedFarm farmomatic: system root: rootComponent [ 

	farm := selectedFarm.
	farmomatic := system.
	rootComp := rootComponent
]
