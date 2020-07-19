Class {
	#name : #FACardsGroup,
	#superclass : #WAComponent,
	#category : #FarmomaticWeb
}

{ #category : #rendering }
FACardsGroup >> renderContentOn: html [

21 timesRepeat: [ 	 
			html tbsColumn: [ 
				html tbsThumbnail id:'card'; with: [ 
					html image placeHolder: '100%x100%'. html break.
					html paragraph: 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.'.
					html anchor: 'Button'.
					 ]] mediumSize:  4.	
	]
]
