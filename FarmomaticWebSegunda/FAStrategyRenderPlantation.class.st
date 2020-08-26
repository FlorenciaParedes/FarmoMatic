Class {
	#name : #FAStrategyRenderPlantation,
	#superclass : #FAStrategyEventComponent,
	#category : #FarmomaticWebSegunda
}

{ #category : #rendering }
FAStrategyRenderPlantation >> renderStrategyOn: html [

	html
		text: ' | Species Name: ' , event getPredefined name, ' | Amount ' . html text: event amount.
]
