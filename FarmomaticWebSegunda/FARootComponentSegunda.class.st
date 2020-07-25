Class {
	#name : #FARootComponentSegunda,
	#superclass : #WAComponent,
	#instVars : [
		'main',
		'header',
		'farmomatic',
		'history'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #'class initialization' }
FARootComponentSegunda class >> initialize [
   "self initialize"
   | app |
   app := WAAdmin register: self asApplicationAt: 'FarmomaticAppSegunda'.
   app
      addLibrary: JQDeploymentLibrary;
      addLibrary: JQUiDeploymentLibrary;
      addLibrary: TBSDeploymentLibrary
]

{ #category : #rendering }
FARootComponentSegunda >> canBeRoot [
   ^ true
]

{ #category : #rendering }
FARootComponentSegunda >> children [
   ^ { main }
]

{ #category : #rendering }
FARootComponentSegunda >> history [
 | last |
 
history ifNotNil: [  
	last := history last.
	history removeLast.
	^last ]
]

{ #category : #rendering }
FARootComponentSegunda >> history: comp [
	history addLast: comp
]

{ #category : #rendering }
FARootComponentSegunda >> initialize [
	super initialize.
	farmomatic := Farmomatic example.
	main := FACardsGroupSegunda
		withUser:
			(farmomatic users
				detect: [ :user | user fullName match: 'Jorge Schelotto' ])
		root: self.
	header := FAHeaderSegunda.
	history := OrderedCollection new
]

{ #category : #rendering }
FARootComponentSegunda >> main: aComponent [
   main := aComponent
]

{ #category : #rendering }
FARootComponentSegunda >> renderContentOn: html [
html tbsColumn with: [ html render: main ].



]

{ #category : #rendering }
FARootComponentSegunda >> updateRoot: anHtmlRoot [
    super updateRoot: anHtmlRoot.
   anHtmlRoot beHtml5.
   anHtmlRoot title: 'Farmomatic'.
    anHtmlRoot meta
        name: 'viewport';
        content: 'width=device-width, initial-scale=1.0'.
]
