"
Mentor hints:
- fairly straight forward solution, using an OrderedDictionary (or OrderedCollection of Associations)
- look for using the bit radix 2rX, and mask messages

"
Class {
	#name : 'SecretHandshake',
	#superclass : 'Object',
	#classVars : [
		'Secrets'
	],
	#category : 'Exercise@SecretHandshake',
	#package : 'Exercise@SecretHandshake'
}

{ #category : 'accessing' }
SecretHandshake class >> secrets [
	^ Secrets
		ifNil: [ Secrets := OrderedDictionary new
				at: 2r1 put: 'wink';
				at: 2r10 put: 'double blink';
				at: 2r100 put: 'close your eyes';
				at: 2r1000 put: 'jump';
				yourself ]
]

{ #category : 'accessing' }
SecretHandshake >> commandsNumber: anInteger [
	| handshake |
	handshake := Array
		streamContents: [ :aStream | 
			self class secrets
				keysAndValuesDo: [ :secret :value | 
					(anInteger allMask: secret)
						ifTrue: [ aStream nextPut: value ] ] ].
	^ (anInteger allMask: 2r10000)
		ifTrue: [ handshake reversed ]
		ifFalse: [ handshake ]
]
