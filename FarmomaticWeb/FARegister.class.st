Class {
	#name : #FARegister,
	#superclass : #WAComponent,
	#category : #FarmomaticWeb
}

{ #category : #rendering }
FARegister >> renderContentOn: html [ 
	html heading level: 2; with: 'Register'.

	html tbsFormGroup: [ 
		html label for: 'exampleInputName'; with: 'Full Name'.
		html textInput tbsFormControl; id: 'exampleInputName'; placeholder: 'Enter Full Name'.
		html break.
		html label for: 'exampleInputEmail1'; with: 'Email address'.
		html textInput tbsFormControl; id: 'exampleInputEmail1'; placeholder: 'Enter email'.
		html break.
		html label for: 'exampleInputPassword1'; with: 'Password'.
		html passwordInput tbsFormControl id: 'exampleInputPassword1'; placeholder: 'Password'.
		html break.
		html tbsSubmitButton bePrimary;
			callback: [ self register ]; 
			value: 'Register'.].
]
