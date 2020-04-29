Class {
	#name : #Aplication,
	#superclass : #Event,
	#instVars : [
		'product',
		'amount'
	],
	#category : #Farmomatic
}

{ #category : #'as yet unclassified' }
Aplication class >> withDate: aDate Author: aUser Amount: amount Product: aProduct [
	^ self new
		withDate: aDate
		Author: aUser
		Amount: amount
		Product: aProduct
]

{ #category : #'as yet unclassified' }
Aplication class >> withDate: aDate Author: aUser Comments: aComment Amount: amount Product: aProduct [
	^self new withDate: aDate
		Author: aUser
		Comments: aComment
		Amount: amount
		Product: aProduct.
]

{ #category : #'as yet unclassified' }
Aplication >> withDate: aDate Author: aUser Amount: aAmount Product: aProduct [
	date := aDate.
	author := aUser.
	amount := aAmount.
	product := aProduct
]

{ #category : #'as yet unclassified' }
Aplication >> withDate: aDate Author: aUser Comments: aComment Amount: aAmount Product: aProduct [
	date := aDate.
	author := aUser.
	comments := aComment.
	amount := aAmount.
	product := aProduct    
]
