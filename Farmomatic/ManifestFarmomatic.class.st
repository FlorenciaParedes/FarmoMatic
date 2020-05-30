"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFarmomatic,
	#superclass : #PackageManifest,
	#category : #'Farmomatic-Manifest'
}

{ #category : #'code-critics' }
ManifestFarmomatic class >> ruleRBNoClassCommentRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#PredefinedList)) #'2020-05-23T16:46:26.567676-03:00') )
]
