Feature: CustomerDetailsNewCall
	In order to test customer details
	As an agent
	I want to pass the landing page and test all fields in customer

	//testing title, names, emails, messages, postcodes, adresses

Background:
	Given I go to dialerSimulator link
	When I put 1234 and enter 456
		And I click submit new call
		And I press yes
		And I click consent done button
	Then I get redirected to customer information 


@smoke
Scenario: New call with Card empty
	Given I come from a new call
	When I get redirected to customer information
	Then card is empty


@smoke
Scenario Outline: Title selecting
	Given I get redirected to customer information
	Then I select <title>

	Examples:
	| title |
	| Mr    |
	| Mrs   |
	| Miss  |

@ignore
Scenario Outline: Validation Errors shown on screen
	Given I get redirected to customer information
	When I select <title> and insert <firstname> and <lastname> then <email> and <confirm> and <postcode>
	Then I have a validation <message> on screen

	Examples:
	| title | firstname | lastname | email | confirm | postcode | message                             |
	| Mr    |           |          |       |         |          |                                     |
	|       | a         | b        |       |         |          | Please enter at least 2 characters. |
	|       |           |          |       |         |          | Email is required                   |
	|       |           |          | a     |         |          | Email is not valid                  |
	|       |           |          | a@a.a | a       |          | Emails should match                 |
	|       |           |          |       |         | a        | Invalid postcode                    |

@smoke @critical
Scenario Outline: TC-217 Insertion of correct data from customer
	Given I get redirected to customer information
	When I select <title> and insert <firstname> and <lastname> then <email> and <confirm> and <postcode>
	Then I can select an address
	And I can go to fuel section

	Examples: 
	| title | firstname | lastname | email | confirm | postcode | 
	| Mr    | P1        | J2       | a@a.a | a@a.a   | n13lr    | 
