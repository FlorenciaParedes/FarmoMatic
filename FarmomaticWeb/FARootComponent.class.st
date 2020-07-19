Class {
	#name : #FARootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #FarmomaticWeb
}

{ #category : #'class initialization' }
FARootComponent class >> initialize [
   "self initialize"
   | app |
   app := WAAdmin register: self asApplicationAt: 'FarmomaticApp'.
   app
      addLibrary: JQDeploymentLibrary;
      addLibrary: JQUiDeploymentLibrary;
      addLibrary: TBSDeploymentLibrary
]

{ #category : #rendering }
FARootComponent >> canBeRoot [
   ^ true
]

{ #category : #rendering }
FARootComponent >> children [
   ^ { main }
]

{ #category : #rendering }
FARootComponent >> initialize [
   super initialize.
   main := FAScreenComponent new.
]

{ #category : #rendering }
FARootComponent >> renderContentOn: html [


   html render: main .



]

{ #category : #rendering }
FARootComponent >> updateRoot: anHtmlRoot [
    super updateRoot: anHtmlRoot.
   anHtmlRoot beHtml5.
   anHtmlRoot title: 'Farmomatic'.
    anHtmlRoot meta
        name: 'viewport';
        content: 'width=device-width, initial-scale=1.0'.
]
