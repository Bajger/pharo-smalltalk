"
# Armstrong Numbers

An [Armstrong number](https://en.wikipedia.org/wiki/Narcissistic_number) is a number that is the sum of its own digits each raised to the power of the number of digits.

For example:

- 9 is an Armstrong number, because `9 = 9^1 = 9`
- 10 is *not* an Armstrong number, because `10 != 1^2 + 0^2 = 1`
- 153 is an Armstrong number, because: `153 = 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153`
- 154 is *not* an Armstrong number, because: `154 != 1^3 + 5^3 + 4^3 = 1 + 125 + 64 = 190`

Write some code to determine whether a number is an Armstrong number.

## Instructions append

Browse the class Integer for some inspiration
"
Class {
	#name : 'ArmstrongNumbersTest',
	#superclass : 'ExercismTest',
	#instVars : [
		'armstrongNumbersCalculator'
	],
	#category : 'Exercise@ArmstrongNumbers',
	#package : 'Exercise@ArmstrongNumbers'
}

{ #category : 'config' }
ArmstrongNumbersTest class >> exercise [
	^ (self createExerciseAfter: TwoFerTest)
		difficulty: 2;
		topics: #('math' 'integers');
		yourself
]

{ #category : 'config' }
ArmstrongNumbersTest class >> uuid [
	"Answer a unique id for this exercise"
	^'04c308a8-9794-4b15-9a73-775fca80ce9d'
]

{ #category : 'config' }
ArmstrongNumbersTest class >> version [
	"Generated from specification: 29 March 2019"
	^'1.0.0'
]

{ #category : 'running' }
ArmstrongNumbersTest >> setUp [
	super setUp.
	armstrongNumbersCalculator := ArmstrongNumbers new
]

{ #category : 'tests' }
ArmstrongNumbersTest >> test01_SingleDigitNumbersAreArmstrongNumbers [
	| result |

	result := armstrongNumbersCalculator isArmstrongNumber: 5 .
	self assert: result equals: true
]

{ #category : 'tests' }
ArmstrongNumbersTest >> test02_ThereAreNo2DigitArmstrongNumbers [
	| result |

	result := armstrongNumbersCalculator isArmstrongNumber: 10 .
	self assert: result equals: false
]

{ #category : 'tests' }
ArmstrongNumbersTest >> test03_ThreeDigitNumberThatIsAnArmstrongNumber [
	| result |

	result := armstrongNumbersCalculator isArmstrongNumber: 153 .
	self assert: result equals: true
]

{ #category : 'tests' }
ArmstrongNumbersTest >> test04_ThreeDigitNumberThatIsNotAnArmstrongNumber [
	| result |

	result := armstrongNumbersCalculator isArmstrongNumber: 100 .
	self assert: result equals: false
]

{ #category : 'tests' }
ArmstrongNumbersTest >> test05_FourDigitNumberThatIsAnArmstrongNumber [
	| result |

	result := armstrongNumbersCalculator isArmstrongNumber: 9474 .
	self assert: result equals: true
]

{ #category : 'tests' }
ArmstrongNumbersTest >> test06_FourDigitNumberThatIsNotAnArmstrongNumber [
	| result |

	result := armstrongNumbersCalculator isArmstrongNumber: 9475 .
	self assert: result equals: false
]

{ #category : 'tests' }
ArmstrongNumbersTest >> test07_SevenDigitNumberThatIsAnArmstrongNumber [
	| result |

	result := armstrongNumbersCalculator isArmstrongNumber: 9926315 .
	self assert: result equals: true
]

{ #category : 'tests' }
ArmstrongNumbersTest >> test08_SevenDigitNumberThatIsNotAnArmstrongNumber [
	| result |

	result := armstrongNumbersCalculator isArmstrongNumber: 9926314 .
	self assert: result equals: false
]
