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
					html horizontalRule.
					html break.
					html paragraph: farm name.
					html paragraph: farm description.
					html break.
					html horizontalRule.
					html break.
					farm plots
						do: [ :elem | 
							html
								render: [ html paragraph: elem id.
									html paragraph: elem description.
									html paragraph: elem surface ] ] ]
				mediumSize: 9 ]
]

{ #category : #initialization }
FAFarmComponent >> withFarm: selectedFarm farmomatic: system [

	farm := selectedFarm.
	farmomatic := system
]

{ #category : #initialization }
FAFarmComponent >> withFarm: selectedFarm farmomatic: system root: rootComponent [ 

	farm := selectedFarm.
	farmomatic := system.
	rootComp := rootComponent
]
