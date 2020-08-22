Class {
	#name : #FAAEventForm,
	#superclass : #FAFormsComponent,
	#instVars : [
		'name',
		'date',
		'amount',
		'author'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #rendering }
FAAEventForm >> back [
self answer 
]

{ #category : #rendering }
FAAEventForm >> renderContentOn: html [
	html
		tbsRow: [ html tbsColumn: [ super renderContentOn: html ] mediumSize: 3.
			html
				tbsColumn: [ html tbsRow: [html div
						id: 'mainHeader';
						with: [ html render: (header withRoot: rootComp).html tbsButton
						class: 'addFarmButtom';
						with: [ html anchor
								callback: [ self back];
								with: 'BACK' ]]. ].
											
					html heading
						level: 2;
						with: 'Add new event'.
					html
						form: [ html strong: 'Type: '.
							html break.
							html textInput
								placeholder: 'Enter a type';
								callback: [ :value | name := value ];
								required.
							html break.
							html strong: 'date '.
							html break.
							html textInput
								placeholder: 'Enter a date ';
								callback: [ :value | date := value ];
								required.
							html break.
							html strong: 'Author: '.
							html break.
							html textInput
								placeholder: 'Enter an Author:';
								callback: [ :value | author:= value ].
								html break.
								html strong: 'amount:  '.
							html break.
							html textInput
								placeholder: 'Enter an amount ';
								callback: [ :value | amount := value ];
								required.
							html break.
							html tbsSubmitButton
								bePrimary;
								class: 'farmFormButtom';
								callback: [ self save ];
								with: 'SAVE' ] ]
				mediumSize: 3 ]
]

{ #category : #rendering }
FAAEventForm >> save [
]
