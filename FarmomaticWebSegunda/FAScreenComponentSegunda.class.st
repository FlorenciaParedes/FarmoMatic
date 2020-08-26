Class {
	#name : #FAScreenComponentSegunda,
	#superclass : #WAComponent,
	#instVars : [
		'header',
		'farmomatic',
		'rootComp',
		'user',
		'mainMenu'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAScreenComponentSegunda class >> withSystem: system  root: rootComponent [.

^ self new withSystem: system  root: rootComponent.
]

{ #category : #initialization }
FAScreenComponentSegunda class >> withUser: userFarmo farmomatic: aFarmomatic [  
^self withUser: userFarmo farmomatic: aFarmomatic.
]

{ #category : #initialization }
FAScreenComponentSegunda class >> withUser: user root: rootComponent farmomatic: aFarmomatic [
	^ self new withUser: user root: rootComponent farmomatic: aFarmomatic
]

{ #category : #initialization }
FAScreenComponentSegunda >> children [
   ^ OrderedCollection with: mainMenu with: header .
]

{ #category : #initialization }
FAScreenComponentSegunda >> initialize [ 

super initialize.
mainMenu := FAMainMenuComponentSegunda new.
header := FAHeaderSegunda withRoot: rootComp.

]

{ #category : #initialization }
FAScreenComponentSegunda >> renderContentOn: html [
	html
		tbsRow: [ html
				tbsColumn: [ html tbsRow
						with: [ html
								tbsColumn: [ html
										render:
											(FAMainMenuComponentSegunda
												withRoot: rootComp
												system: farmomatic
												user: user) ]
								mediumSize: 3 ] ]
				mediumSize: 3.
			html
				tbsColumn: [ html div
						id: 'mainHeader';
						with: [ html render: (header withRoot: rootComp andSystem: farmomatic) ].
					user ifNotNil: [ 
					self renderComponent: html ]]
				mediumSize: 9 ]
]

{ #category : #initialization }
FAScreenComponentSegunda >> style [ 

^ ' 

@import url("https://fonts.googleapis.com/css2?family=Roboto&family=Teko:wght@500&display=swap");

body { 
	background: #2B3648;
	font-family: "Roboto", sans-serif;
	color: #6B7D9C;
}



h1 { 
	font-family: "Teko", sans-serif;
	font-size: 5em;
	color: #5F926D;
	
 }




button {
  transition-duration: 0.4s;
	color: #C8C8C8;
	background: #6B7D9C;
	margin: .5em 2em 0em 0em;


}

button:hover {
  background-color: #e7e7e7; /* Grey */
  color: #C8C8C8;
	box-shadow: 6px 4px 6px rgba(0, 0, 0, 0.5);
}

button:click  {
  decoration: none;
	border: none;
}


#mainContainer { 
	display: flex;
	flex-direction: row;
	justify-content: flex-start;

 }


#mainMenuNav { item: 1; }

#secondContainer { 
		flex-wrap: wrap
 }


#mainHeader{
	item:3; 


}

#headerContainer { 
	color: #5F926D;
	display: flex;
	flex-direction: column;
	margin: 1em;
	justify-content: left !important;
	font-style: normal;
	font-weight: normal;
	font-size: 4em !mportant;
	line-height: 103px;




 }

#headerA
{ 
	
	margin: 1em;
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

#mainPage{
	item:4;
}

#mainTable { 

	margin: 5em 0em 0em 0em !important; 
 }







div#card.thumbnail { 
box-shadow: 6px 6px 13px rgba(0, 0, 0, 0.5) !important;
background: #212936 !important;
border-radius: 27px !important; 
border-style: none;
color: #6B7D9C;
text-align: center;
 }

div#card.thumbnail a { 
text-decoration: none;
color: #6B7D9C;

 }

div#card.thumbnail a:hover { 

color: #B0C4DE;

 }


#mainCards { 
	margin: 0em 0em 3em 0em;
 }
#table { 
	color: #6B7D9C;
 }


#mainLogin {
	color: #6B7D9C;
}

#mainRegister {
	color: #6B7D9C;
}


#mainAdd {
	color: #6B7D9C;
}



'
]

{ #category : #initialization }
FAScreenComponentSegunda >> withSystem: system  root: rootComponent [.


farmomatic := system.

rootComp := rootComponent

]

{ #category : #initialization }
FAScreenComponentSegunda >> withUser: userFarmo farmomatic: aFarmomatic [  
	user := userFarmo.
	farmomatic := aFarmomatic 
]

{ #category : #initialization }
FAScreenComponentSegunda >> withUser: userFarmo  root: rootComponent [.


user := userFarmo.

rootComp := rootComponent

]

{ #category : #initialization }
FAScreenComponentSegunda >> withUser: userFarmo root: rootComponent farmomatic: aFarmomatic [  
	user := userFarmo.
	rootComp := rootComponent.
	farmomatic := aFarmomatic 
]
