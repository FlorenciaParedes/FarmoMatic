Class {
	#name : #FAVarietyForm,
	#superclass : #FAProblemForm,
	#category : #FarmomaticWebSegunda
}

{ #category : #accessing }
FAVarietyForm >> save [
	farmomatic
		addVarietyVulgarName: name
		scientificName: scientificName
		url: url
		description: description.
			self return
]
