Class {
	#name : #FAFarmComponent,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'farm',
		'pots',
		'email'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAFarmComponent class >> withFarm: selectedFarm user: aUser farmomatic: system [

^self new withFarm: selectedFarm  user: aUser  farmomatic: system
]

{ #category : #adding }
FAFarmComponent >> addPlot [
	self
		show: (FAFormPlot withUser: user farmomatic: farmomatic farm: farm  )
]

{ #category : #initialization }
FAFarmComponent >> date [
   ^ farm date
]

{ #category : #'as yet unclassified' }
FAFarmComponent >> deleteFarm [

	user removeFarm: farm.
	self show: (FACardsGroupFarmsSegunda
				withUser: user
				farmomatic: farmomatic).
]

{ #category : #'as yet unclassified' }
FAFarmComponent >> inviteUser: aEmail [
(farmomatic inviteProducerWithMail: aEmail address toFarm: farm of: user)
		ifNotNil: [self inform: 'Guest user successfully'] 
		ifNil: [ self inform: 'There is no user with this email ', aEmail address  ] 
]

{ #category : #initialization }
FAFarmComponent >> lookPlot: plot [
	self
		show:
			(FAPlotComponent new
				withPlot: plot
				user: user
				farmomatic: farmomatic)
]

{ #category : #initialization }
FAFarmComponent >> renderComponent: html [
	html
		tbsRow: [ 	self backButton: html.
			html div
				id: 'farmMenu';
				with: [ html tbsButton
						class: 'addPlotButtom';
						with: [ html anchor
								callback: [ self addPlot ];
								with: 'ADD PLOT' ].
					html space.
					html
						form: [ html strong: 'INVITE USER WITH EMAIL '.
							html emailInput
								placeholder: 'enter e-mail';
								callback: [ :value | email := value ].
							html tbsSubmitButton
								bePrimary;
								class: 'inviteUserButtom';
								callback: [ self inviteUser: email ];
								with: 'invite' ].
					html space.
					html tbsButton
						class: 'deleteFarmButton';
						with: [ html anchor
								callback: [ self deleteFarm ];
								with: 'DELETE FARM' ] ] ].
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
				render: [ html strong with: ' ► ID:'.
					html paragraph: elem id.
					html strong with: 'Description: '.
					html paragraph: elem description.
					html strong with: 'Surface: '.
					html paragraph: elem surface.
					html anchor
						callback: [ self lookPlot: elem ];
						with: 'See plot' ].
			html break.
			html break ]
]

{ #category : #initialization }
FAFarmComponent >> withFarm: selectedFarm  user: aUser farmomatic: system [
	user:= aUser .
	farm := selectedFarm.
	farmomatic := system.
]
