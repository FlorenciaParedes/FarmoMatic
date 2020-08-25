Class {
	#name : #FACardsGroupEvents,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'events',
		'order',
		'date',
		'type'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #adding }
FACardsGroupEvents >> addList [
	self
		show:
			(rootComp
				main: (FAListForm withUser: user root: rootComp farmomatic: farmomatic))

]

{ #category : #'as yet unclassified' }
FACardsGroupEvents >> determineFilter [
	date ifNotNil: [ events := farmomatic filterEventByDate: date ].
	type ifNotNil: [ events := farmomatic filterEventByType: type ].
]

{ #category : #'as yet unclassified' }
FACardsGroupEvents >> determineOrder [
	order
		ifNil: [ events := farmomatic events ]
		ifNotNil: [ order = 'Closest to oldest'
				ifTrue: [ events := farmomatic sortEventsByDateDec ].
			order = 'Oldest to closest'
				ifTrue: [ events := farmomatic sortEventsByDateAsc ].
			order = 'Ascending' 
				ifTrue: [ events := farmomatic sortEventsByTypeAsc ].
			order = 'Descending'
				ifTrue: [ events := farmomatic sortEventsByTypeDec ] ]
]

{ #category : #'as yet unclassified' }
FACardsGroupEvents >> lookEvents: html [
	self determineOrder.
	self determineFilter.
	html paragraph: order.
	events
		do: [ :elem | 
			html
				tbsColumn: [ html tbsThumbnail
						id: 'card';
						with: [ html break.
							html paragraph: elem type.
							html paragraph: 'author: '.
							html paragraph: elem author fullName.
							html paragraph: 'Creation date:'.
							html paragraph: elem creationDate.
							html anchor
								callback: [ self renderEvent: elem ];
								with: 'Ver Mas' ] ]
				mediumSize: 4 ]
]

{ #category : #accessing }
FACardsGroupEvents >> order: aOrder [
	order := aOrder.
]

{ #category : #'as yet unclassified' }
FACardsGroupEvents >> renderChooseOrder: html [
	| orderByDate orderByType |
	orderByType := OrderedCollection
		newFrom: #(' ' 'Descending' 'Ascending').
	orderByDate := OrderedCollection
		newFrom: #(' ' 'Closest to oldest' 'Oldest to closest').
	html
		form: [ html text: 'Order by Date '.
			html space.
			html select
				selected: orderByDate first;
				list: orderByDate;
				onChange: 'submit()';
				callback: [ :value | self order: value ] ].
	html space.
	html
		form: [ html text: 'Order by Type '.
			html space.
			html select
				selected: orderByType first;
				list: orderByType;
				onChange: 'submit()';
				callback: [ :value | self order: value ] ]
]

{ #category : #initialization }
FACardsGroupEvents >> renderContentOn: html [
	"	order := 'Closest to oldest'."

	html
		tbsRow: [ html tbsColumn: [ super renderContentOn: html ] mediumSize: 3.
			html
				tbsColumn: [ html div
						id: 'mainHeader';
						with: [ html render: (header withRoot: rootComp andSystem: farmomatic) ].
					html break.
					user isNotNil
						ifTrue: [ html tbsButton
								class: 'addFarmButtom';
								with: [ html anchor
										callback: [ self addList ];
										with: 'ADD LIST' ].
							self renderChooseOrder: html.
							html space.
							self renderFilter: html.
							html horizontalRule.
							self lookEvents: html ] ]
				mediumSize: 9 ]
]

{ #category : #rendering }
FACardsGroupEvents >> renderEvent: elem [
	self
		show:
			(rootComp
				main:
					(FAEventComponent
		withUser: user
		farmomatic: farmomatic
		event: elem))

]

{ #category : #rendering }
FACardsGroupEvents >> renderFilter: html [
	html
		form: [ html text: 'Filter by Date '.
			html dateInput callback: [ :value | date := value ].
			html submitButton text: 'Refresh' ].
	html space.
	html
		form: [ html text: 'Filter by type '.
			html select
				list: #('Aplication' 'Harvest' 'Problem' 'Plantation');
				callback: [ :value | type := value ].
			html submitButton text: 'Refresh' ]
]
