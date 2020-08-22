Class {
	#name : #FARootComponentSegunda,
	#superclass : #WAComponent,
	#instVars : [
		'main',
		'header',
		'farmomatic',
		'history',
		'user'
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

{ #category : #'as yet unclassified' }
FARootComponentSegunda class >> withUser: aUser [
"PRUEBA"
	^ self new withUser: aUser
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
	"user := farmomatic users
		detect: [ :each | each fullName match: 'Jorge Schelotto' ]."
	main := FACardsGroupFarmsSegunda "withSystem: farmomatic root: self.
	"withUser: user
		root: self
		farmomatic: farmomatic.
	header := FAHeaderSegunda
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
FARootComponentSegunda >> script [ 

^'
$(document).ready(function() { 
    var backButtom = document.querySelector("#headerB > button:nth-child(1)")
    
    backButtom.onclick = () => { window.history.back(); }
 });
'
]

{ #category : #rendering }
FARootComponentSegunda >> scriptssss [ 

^'
$(document).ready(function() { 
    var backButtom = document.querySelector("#headerB > button:nth-child(1)")
    
    backButtom.onclick = () => { window.history.back(); }
 });
'
]

{ #category : #rendering }
FARootComponentSegunda >> updateRoot: anHtmlRoot [
   super updateRoot: anHtmlRoot.
   anHtmlRoot beHtml5.
   anHtmlRoot title: 'Farmomatic'.
anHtmlRoot javascript url: '/files/TBSFileLibrary/main.js'.
   anHtmlRoot meta
        name: 'viewport';
        content: 'width=device-width, initial-scale=1.0'.
	
]

{ #category : #'as yet unclassified' }
FARootComponentSegunda >> withUser: aUser [
	user := aUser
]
