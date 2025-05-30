"
I am a composite test that gathers all the test cases in Exercism so you can easily run them all in a System Browser or from the Playground.

e.g.

AllExercismTests suite run.
"
Class {
	#name : 'AllExercismTests',
	#superclass : 'TestCase',
	#category : 'ExercismSystemTests',
	#package : 'ExercismSystemTests'
}

{ #category : 'private' }
AllExercismTests class >> allExercismTests [
	"gather all the TestCases in the Execercism package"

	^ self allExercismTestsFor: #( #ExercismTests #ExercismSystemTests), BaselineOfExercism exercisePackageNames 
]

{ #category : 'private' }
AllExercismTests class >> allExercismTestsFor: packagesNameList [
	"gather all the TestCases in the Execercsim package"

	^ packagesNameList
		inject: Set new
		into: [ :finalResult :pkgName | 
			(RPackageOrganizer default packageNamed: pkgName) packages
				inject: finalResult
				into: [ :result :pkg | 
					result
						addAll: (pkg classes select: [ :c | c isTestCase ]);
						yourself ] ]
]

{ #category : 'private' }
AllExercismTests class >> allUserExercismTests [
	"gather all the TestCases in the Execercsim package"

	^ self allExercismTestsFor: BaselineOfExercism exercisePackageNames
]

{ #category : 'private' }
AllExercismTests class >> suite [
	^ self allExercismTests
		inject: TestSuite new
		into: [ :suite :test | suite addTest: test buildSuiteFromSelectors ]
]

{ #category : 'tests' }
AllExercismTests >> testAll [
	"Create a suite to eaily run all the tests - this is a stub that gives a browser button 
	to easily click on to run all the composite tests"
	
	^true 
	
]
