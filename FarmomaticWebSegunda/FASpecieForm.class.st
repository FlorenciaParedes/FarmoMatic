Class {
	#name : #FASpecieForm,
	#superclass : #FAListFormStrategy,
	#category : #FarmomaticWebSegunda
}

{ #category : #accessing }
FASpecieForm >> save [
	farmomatic addSpecieWithName: name andDescription: description.	self return
]
