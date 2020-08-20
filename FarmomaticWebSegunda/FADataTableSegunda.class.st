Class {
	#name : #FADataTableSegunda,
	#superclass : #WAComponent,
	#instVars : [
		'title',
		'headers',
		'data'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #rendering }
FADataTableSegunda class >> withTitle: aTitle headers: aHeaders data: aData [

^self new withTitle: aTitle headers: aHeaders data: aData
]

{ #category : #rendering }
FADataTableSegunda >> lookProblem [
]

{ #category : #rendering }
FADataTableSegunda >> renderContentOn: html [
|headerBlock tableBlock |



		
	headerBlock := [ headers do: [ :each | html tableHeading: each.]].
		
	tableBlock := [ 	
		html tableHead: (headerBlock).
		html tableBody: [ 
			"data do: [:row | html tableRow: [ row do: [:col | html tableData: col ]]]."
			data do: [:row | html tableRow: [ html tableData: row type. html tableData: row creationDate. html tableData: row amount. html tableData: row author fullName. html tableData: [html tbsBadge: [ html anchor callback: [ self lookProblem ]; with: 'Select' ]. ]]]]].		

html div id:'table'; with: [ 
	html heading level: 2; with: title .
	html tbsTable 
			beHover;
			with: tableBlock].

]

{ #category : #rendering }
FADataTableSegunda >> withTitle: aTitle headers: aHeaders data: aData [

title:= aTitle. 
headers:= aHeaders.
data:= aData 
]
