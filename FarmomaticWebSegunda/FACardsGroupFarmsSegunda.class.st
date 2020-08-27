Class {
	#name : #FACardsGroupFarmsSegunda,
	#superclass : #FAScreenComponentSegunda,
	#category : #FarmomaticWebSegunda
}

{ #category : #'class initialization' }
FACardsGroupFarmsSegunda class >> initialize [
   "self initialize"
   | app |
   app := WAAdmin register: self asApplicationAt: 'FarmomaticAppSegunda'.
   app
      addLibrary: JQDeploymentLibrary;
      addLibrary: JQUiDeploymentLibrary;
      addLibrary: TBSDeploymentLibrary
]

{ #category : #adding }
FACardsGroupFarmsSegunda >> addFarm [
	self
		show:(FAFormFarm withUser: user farmomatic: farmomatic )

]

{ #category : #rendering }
FACardsGroupFarmsSegunda >> canBeRoot [
   ^ true
]

{ #category : #rendering }
FACardsGroupFarmsSegunda >> initialize [
	super initialize.
	farmomatic := Farmomatic example.

]

{ #category : #rendering }
FACardsGroupFarmsSegunda >> lookFarm: farm [

	self show: (FAFarmComponent new withFarm: farm user:user farmomatic: farmomatic )
]

{ #category : #rendering }
FACardsGroupFarmsSegunda >> renderComponent: html [
	html tbsButton
		class: 'addFarmButtom';
		with: [ html anchor
				callback: [ self addFarm ];
				with: 'ADD FARM' ].
				self backButton: html.
	html space.
	user farms
		do: [ :elem | 
			html
				tbsColumn: [ html tbsThumbnail
						id: 'card';
						with: [ html break.
							html paragraph: elem name.
							html paragraph: elem description.
							html anchor
								callback: [ self lookFarm: elem ];
								with: 'Ver Mas' ] ]
				mediumSize: 4 ]
]

{ #category : #rendering }
FACardsGroupFarmsSegunda >> updateRoot: anHtmlRoot [
   super updateRoot: anHtmlRoot.
   anHtmlRoot beHtml5.
   anHtmlRoot title: 'Farmomatic'.
anHtmlRoot javascript url: '/files/TBSFileLibrary/main.js'.
   anHtmlRoot meta
        name: 'viewport';
        content: 'width=device-width, initial-scale=1.0'.
	
]
