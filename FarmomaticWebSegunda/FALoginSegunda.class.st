Class {
	#name : #FALoginSegunda,
	#superclass : #WAComponent,
	#category : #FarmomaticWebSegunda
}

{ #category : #rendering }
FALoginSegunda >> renderContentOn: html [ 
	html heading level: 2; with: 'Login'.

	html tbsFormGroup: [ 
		html label for: 'exampleInputEmail1'; with: 'Email address'.
		html textInput tbsFormControl; id: 'exampleInputEmail1'; placeholder: 'Enter email'.
		html break.
		html label for: 'exampleInputPassword1'; with: 'Password'.
		html passwordInput tbsFormControl id: 'exampleInputPassword1'; placeholder: 'Password'.
		html break.
		html tbsSubmitButton bePrimary;
			callback: [ self validate ]; 
			value: 'Log In'.].
	
	



]
