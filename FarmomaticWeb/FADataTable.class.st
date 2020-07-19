Class {
	#name : #FADataTable,
	#superclass : #WAComponent,
	#category : #FarmomaticWeb
}

{ #category : #rendering }
FADataTable >> renderContentOn: html [
|headerBlock data tableBlock |


	data := #(('1' 'Mark' 'Otto' '@mdo') ('2' 'Jacob' 'Thornton' '@fat') ('3' 'Larry' 'the Bird' '@twitter')).	
		
	headerBlock := [ 
			html tableHeading: '#'.
			html tableHeading: 'First Name'.
			html tableHeading: 'Last Name'.
			html tableHeading: 'Username' ].
		
	tableBlock := [ 	
		html tableHead: (headerBlock).
		html tableBody: [ 
			data do: [:row | html tableRow: [ row do: [:col | html tableData: col ]]]]].	

html div id:'table'; with: [ 
	html heading level: 2; with: 'Hover table'.
	html tbsTable 
			beHover;
			with: tableBlock].
	
]
