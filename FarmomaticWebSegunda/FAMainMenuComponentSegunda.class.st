Class {
	#name : #FAMainMenuComponentSegunda,
	#superclass : #WAComponent,
	#instVars : [
		'profile140x140',
		'user',
		'farmomatic',
		'rootComp'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #rendering }
FAMainMenuComponentSegunda class >> withRoot: aRootComp [

^self new withRoot: aRootComp
]

{ #category : #rendering }
FAMainMenuComponentSegunda class >> withRoot: aRootComp system: aFarmomatic user: aUser [
	^ self new withRoot: aRootComp system: aFarmomatic user: aUser
]

{ #category : #rendering }
FAMainMenuComponentSegunda >> initialize [ 
super initialize. 
profile140x140 := 'MyFileLibrary / profile.jpg'
]

{ #category : #initialization }
FAMainMenuComponentSegunda >> lookFarms [
	rootComp
		main:
			(FACardsGroupFarmsSegunda
				withUser:
					user
				root: rootComp
				farmomatic: farmomatic)
]

{ #category : #initialization }
FAMainMenuComponentSegunda >> lookPlots [
	rootComp
		main:
			(FACardsGroupPlotsSegunda
				withUser:
					user "(farmomatic users
						detect: [ :userFarms | userFarms fullName match: 'Jorge Schelotto' ])"
				root: rootComp
				farmomatic: farmomatic)
]

{ #category : #accessing }
FAMainMenuComponentSegunda >> profile140x140 [

^ profile140x140 
]

{ #category : #rendering }
FAMainMenuComponentSegunda >> renderContentOn: html [
	" Vertical menu Jasny "

	html
		tbsContainerSmooth: [ html tbsNavmenu
				id: 'mainMenu';
				beDefault;
				with: [ html div
						id: 'profilePhoto';
						with: [ html tbsImage
								beCircle;
								url: TBSFileLibrary / #profileJpg;
								width: 140 ].
	
					user isNotNil
						ifTrue: [ html heading
								level: 3;
								with: user fullName .
					user expert
						ifTrue: [ html heading
								level: 4;
								with: 'Expert' ]
						ifFalse: [ html heading
								level: 4;
								with: 'Productor' ].
	
							html paragraph: user mail.].
				
					html horizontalRule.
					"html tbsNavmenuBrand: 'Brand'."
					html tbsNav
						beNavmenuNavigation;
						with: [ html tbsNavItem
								beActive;
								with: [ html anchor: 'News' ].
							html
								tbsNavItem: [ html anchor
										callback: [ self lookFarms ];
										with: 'Farm' ].
							html
								tbsNavItem: [ html anchor
										callback: [ self lookPlots ];
										with: 'Plots' ].
							html tbsNavItem: [ html anchor: 'Reports' ].
							html tbsNavItem: [ html anchor: 'Contacs' ].
							html horizontalRule.
							html heading
								level: 8;
								with: 'Settings'.
							html tbsNavItem: [ html anchor: 'Main Settings' ].
							html tbsNavItem: [ html anchor: 'Integrations' ] ] ] ]
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

{ #category : #rendering }
FAMainMenuComponentSegunda >> withRoot: aRootComp [

	rootComp:= aRootComp 
]

{ #category : #rendering }
FAMainMenuComponentSegunda >> withRoot: aRootComp system: aFarmomatic user: aUser [
	rootComp := aRootComp.
	farmomatic := aFarmomatic.
	user := aUser 
]
