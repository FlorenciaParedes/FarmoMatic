Class {
	#name : #FAHeaderSegunda,
	#superclass : #WAComponent,
	#instVars : [
		'titleHeader',
		'rootComponent',
		'farmomatic'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #rendering }
FAHeaderSegunda class >> withRoot: root [ 

	^ self new withRoot: root 
]

{ #category : #rendering }
FAHeaderSegunda class >> withRoot: root andSystem: aFarmomatic [ 
	^ self new withRoot: root andSystem: aFarmomatic
]

{ #category : #rendering }
FAHeaderSegunda >> addFarm [

	self
		show:
			(rootComponent
				main: (FAFarmFormSegunda withSystem: farmomatic root: rootComponent ))
]

{ #category : #rendering }
FAHeaderSegunda >> historyBack [

rootComponent history 
]

{ #category : #rendering }
FAHeaderSegunda >> initialize [ 


titleHeader := 'Farmomatic'
]

{ #category : #rendering }
FAHeaderSegunda >> renderContentOn: html [ 

html div id:'headerContainer'; with:[
	html div id:'headerA'; with:[
		html heading level: 1; with: titleHeader. ].
	html div id:'headerB'; with:[
		html tbsButton class:'headerButtom'; with: [ html anchor with:  'BACK'].
		html tbsButton class:'headerButtom'; with: [ html anchor callback: [ self addFarm ]; with:  'ADD'].
	] ]
]

{ #category : #rendering }
FAHeaderSegunda >> style [ 
^ '
#headerContainer { 
	color: #5F926D;
	display: flex;
	flex-direction: column;
	margin: .5em .5em .5em 0em;
	justify-content: left;
	font-style: normal;
	font-weight: normal;
	font-size: 1.2em;
	line-height: 103px;
	text-align: left;



 }



#headerA
{ 
	
	margin: .5em .5em .5em 0em;
 }

#headerB
{ 
	display: flex;
	flex-direction: row;
	margin: .25em;
 }

#headerButtom { 
box-shadow: 6px 4px 6px rgba(0, 0, 0, 0.5);
 }

'
]

{ #category : #rendering }
FAHeaderSegunda >> withRoot: root [ 

	rootComponent := root
]

{ #category : #rendering }
FAHeaderSegunda >> withRoot: root andSystem: aFarmomatic [
	rootComponent := root.
	farmomatic:= aFarmomatic 
]
