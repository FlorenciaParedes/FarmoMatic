Class {
	#name : #FAAddForm,
	#superclass : #WAComponent,
	#category : #FarmomaticWeb
}

{ #category : #rendering }
FAAddForm >> renderContentOn: html [
| menu |
menu :=  [ html tbsDropdownMenuItem: [ html anchor: 'Action' ].
			     html tbsDropdownMenuItem: [ html anchor: 'Another Action' ].
				html tbsDropdownMenuItem: [ html anchor: 'Something else here' ].
				html tbsDivider.
				html tbsDropdownMenuItem: [ html anchor: 'Separated link' ]].

	html heading level: 2; with: 'Add Something'.

	html tbsFormGroup: [ 
		html label for: 'exampleAuthor'; with: 'Author'.
		html textInput tbsFormControl; id: 'exampleAuthor'; placeholder: 'Enter Author'.
		html break.
		html label for: 'exampleDate'; with: 'Date'.
		html textInput tbsFormControl; id: 'exampleDate'; placeholder: 'Enter Date'.
		html break.
		html label for: 'exampleAumont'; with: 'Aumont'.
		html passwordInput tbsFormControl id: 'exampleAumont'; placeholder: 'Name'.
		html break.
		html label for: 'exampleName'; with: 'Name'.
		html break.
		html tbsButtonGroup: [ html tbsDropdownButton id: 'exampleName'; beInfo; with: [html text: 'Lista predefinida '; tbsCaret]. html tbsDropdownMenu: menu; space ].
		html break.
		html tbsSubmitButton bePrimary;
			callback: [ self register ]; 
			value: 'Register'.].
]
