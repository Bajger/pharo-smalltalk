Class {
	#name : 'FlattenArray2Test',
	#superclass : 'FlattenArrayTest',
	#category : 'Exercise@FlattenArray-Solution2',
	#package : 'Exercise@FlattenArray',
	#tag : 'Solution2'
}

{ #category : 'running' }
FlattenArray2Test >> setUp [
	super setUp.
	flattenArrayCalculator := FlattenArray2 new
]
