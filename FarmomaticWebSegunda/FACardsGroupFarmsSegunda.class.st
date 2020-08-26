Class {
	#name : #FACardsGroupFarmsSegunda,
	#superclass : #FAScreenComponentSegunda,
	#category : #FarmomaticWebSegunda
}

{ #category : #adding }
FACardsGroupFarmsSegunda >> addFarm [
	self
		show:
			(rootComp main: (FAFarmForm withUser: user root: rootComp  farmomatic: farmomatic ))

]

{ #category : #rendering }
FACardsGroupFarmsSegunda >> lookFarm: farm [

	self show: (rootComp  main: (FAFarmComponent new withFarm: farm user:user farmomatic: farmomatic  root: rootComp  ))
]

{ #category : #rendering }
FACardsGroupFarmsSegunda >> renderComponent: html [
	
	html tbsButton
		class: 'addFarmButtom';
		with: [ html anchor
				callback: [ self addFarm ];
				with: 'ADD FARM' ].
	html horizontalRule.
	html break.
	user farms
		do: [ :elem | 
			html
				tbsColumn: [ html tbsThumbnail
						id: 'card';
						with: [ html image placeHolder: '100%x100%'.
							html break.
							html paragraph: elem name.
							html paragraph: elem description.
							html anchor
								callback: [ self lookFarm: elem ];
								with: 'Ver Mas' ] ]
				mediumSize: 4 ]
]
