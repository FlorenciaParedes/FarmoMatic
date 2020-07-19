Class {
	#name : #FAHeader,
	#superclass : #WAComponent,
	#instVars : [
		'titleHeader'
	],
	#category : #FarmomaticWeb
}

{ #category : #rendering }
FAHeader >> initialize [ 


titleHeader := 'Farmomatic'
]

{ #category : #rendering }
FAHeader >> renderContentOn: html [ 

html div id:'headerContainer'; with:[
	html div id:'headerA'; with:[
		html heading level: 1; with: titleHeader. ].
	html div id:'headerB'; with:[
		html tbsButton class:'headerButtom'; with:  'BACK'.
		html tbsButton class:'headerButtom'; with: 'ADD'. ].
	]
]

{ #category : #rendering }
FAHeader >> style [ 
^ '
#headerContainer { 
	color: #5F926D;
	display: flex;
	flex-direction: column;
	margin: 1em;
	justify-content: left;
	font-style: normal;
	font-weight: normal;
	font-size: 72px;
	line-height: 103px;
	text-align: center;



 }

#headerA
{ 
	
	margin: 2em;
 }

#headerB
{ 
	display: flex;
	flex-direction: row;
	margin: 2em;
 }

#headerButtom { 
box-shadow: 6px 4px 6px rgba(0, 0, 0, 0.5);
 }

'
]
