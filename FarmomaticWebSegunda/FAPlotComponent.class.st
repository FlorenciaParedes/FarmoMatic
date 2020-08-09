Class {
	#name : #FAPlotComponent,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'farm',
		'pots',
		'plot',
		'orderByType',
		'orderByDate',
		'type'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAPlotComponent >> dateAsceding [
]

{ #category : #initialization }
FAPlotComponent >> dateDesceding [
 true inform: 'descenso'
]

{ #category : #initialization }
FAPlotComponent >> order: orderBy [

(orderBy match: '*type*') ifTrue: [ (orderBy match: '*descending*') ifTrue: [ self typeDesceding ] ifFalse: [ self typeAsceding ] ].
(orderBy match: '*date*') ifTrue: [ (orderBy match: '*descending*') ifTrue: [ self dateDesceding ] ifFalse: [ self dateAsceding ] ]
]

{ #category : #initialization }
FAPlotComponent >> renderContentOn: html [
	orderByType := OrderedCollection newFrom: #('Order by Type' 'Order by Type descending' 'Order by Type ascending').
	orderByDate := OrderedCollection newFrom: #('Order by Date' 'Order by Date descending' 'Order by Date ascending').  

	html
		tbsRow: [ html tbsColumn: [ super renderContentOn: html ] mediumSize: 3.
			html
				tbsColumn: [ html div
						id: 'mainHeader';
						with: [ html render: (header withRoot: rootComp andSystem: farmomatic) ].
					html break.
					html horizontalRule.
					html form: [
					html select
					selected: orderByDate first;
					list: orderByDate;
					onChange: 'submit()';
					callback: [ :value | self order: value ].
					html space.
					html space.
					html select selected: orderByType first;
					list: orderByType;
					onChange: 'submit()';
					callback: [ :value | self order: value ]].
					html break.
					html break.
					html break.
					html paragraph: 'DATOS DEL PLOT: '.
					html paragraph: 'ID Numbre: ', plot id.
					html paragraph: 'Description: ', plot description.
					html paragraph: [html text: 'Is Hothouse: '. html text: plot hothouse ].
					html horizontalRule.
					html paragraph: 'Eventos: ' .
					plot events do: [ :elem | html paragraph: 'Type: ', elem type. html paragraph: 'Comments: ', elem comments. html paragraph: elem creationDate. html horizontalRule.  ].
					html break.
					html break. ] mediumSize: 9 ]
]

{ #category : #initialization }
FAPlotComponent >> typeAsceding [
]

{ #category : #initialization }
FAPlotComponent >> typeDesceding [
]

{ #category : #initialization }
FAPlotComponent >> withFarm: selectedPlot farmomatic: system root: rootComponent [ 

	plot := selectedPlot.
	farmomatic := system.
	rootComp := rootComponent
]
