"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFarmomaticWebSegunda,
	#superclass : #PackageManifest,
	#category : #'FarmomaticWebSegunda-Manifest'
}

{ #category : #'code-critics' }
ManifestFarmomaticWebSegunda class >> ruleRBStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#FACardsGroupEvents #renderContentOn: #false)) #'2020-08-22T22:22:08.90618-03:00') )
]
