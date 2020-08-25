Class {
	#name : #FAStrategyRenderAplication,
	#superclass : #FAStrategyEventComponent,
	#category : #FarmomaticWebSegunda
}

{ #category : #initialization }
FAStrategyRenderAplication >> renderStrategyOn: html [

				html text: ' | Comercial Name: ' , event getPredefined comercialName, ' | Composition: ' , event getPredefined composition.
			html break.
			html break
]
