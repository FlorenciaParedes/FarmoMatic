Class {
	#name : #FAMainMenuComponentSegunda,
	#superclass : #WAComponent,
	#instVars : [
		'profile140x140'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #rendering }
FAMainMenuComponentSegunda >> initialize [ 

profile140x140 := 'MyFileLibrary / profile.jpg'
]

{ #category : #accessing }
FAMainMenuComponentSegunda >> profile140x140 [

^ profile140x140 
]

{ #category : #rendering }
FAMainMenuComponentSegunda >> renderContentOn: html [
" Vertical menu Jasny "

 html tbsContainerSmooth: [ 
	html tbsNavmenu id: 'mainMenu'; 
	beDefault ; 
	with: [ 
		html div id: 'profilePhoto'; 
		with: [ 
			html tbsImage beCircle;
		url: TBSFileLibrary / #profileJpg; 
		width: 140].
		html heading level: 4; with: 'Usuario'.
		html heading level: 6; with: 'Productor'.
		html horizontalRule.
		"html tbsNavmenuBrand: 'Brand'."
		html tbsNav beNavmenuNavigation; with: [ 
			html tbsNavItem beActive; with: [ html anchor: 'News' ].
			html tbsNavItem: [ html anchor: 'Farm' ].
			html tbsNavItem: [ html anchor: 'Plots' ].
			html tbsNavItem: [ html anchor: 'Reports' ].
			html tbsNavItem: [ html anchor: 'Contacs' ].
			html horizontalRule.
			html heading level: 8; with: 'Settings'.
			html tbsNavItem: [ html anchor: 'Main Settings' ].
			html tbsNavItem: [ html anchor: 'Integrations' ].
			]]].
]

{ #category : #initialization }
FAMainMenuComponentSegunda >> style [
^ ' 
a { text-decoration: none; }

#mainMenu { 
padding: 1em;
color: #6B7D9C;

background: #212936;
box-shadow: 6px 6px 13px rgba(0, 0, 0, 0.5);
height: 100%;
width: 20%;
position: fixed;
z-index: 0;
overflow: auto;

}

#mainMenu a { 

font-size: 1.5em;
line-height: .5em;
color: #6B7D9C;
margin: .5em 1em 1em 1em;
}

#mainMenu p { 
font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 1em;
line-height: 0.1em;}

#profilePhoto { margin: 2em 2em 1em 1em }

/* width */
::-webkit-scrollbar {
  width: 5px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1;
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: #888;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555;
}
 '
]
