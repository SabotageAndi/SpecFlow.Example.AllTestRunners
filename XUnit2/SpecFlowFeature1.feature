Feature: XUnit2
	In order to avoid silly mistakes
	As a math idiot
	I want to be told the sum of two numbers


@Tag2
@calculator
Scenario: Scenario1
	Given I have entered 50 into the calculator
	And I have entered 70 into the calculator
	When I press add
	Then the result should be 120 on the screen


@Tag1
@calculator
Scenario: Scenario2
	Given I have entered 50 into the calculator
	And I have entered 70 into the calculator
	When I press add
	Then the result should be 120 on the screen

@ignore
@calculator
Scenario: ignored Scenario
	Given I have entered 50 into the calculator
	And I have entered 70 into the calculator
	When I press add
	Then the result should be 120 on the screen
