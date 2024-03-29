@javascript
Feature: Search
	In order to find information that's interesting to me
	As a user
	I should be able to search for tweets

	@external @slow
	Scenario: Search Twitter by hashtag
		When I search for the term "tdd"
		Then I should see tweets with the hashtag "tdd"

	Scenario: Search Twitter for known results
		Given Twitter returns the following tweets when searching for "#tdd":
			| text 						| from_user |
			| #tdd is totally awesome 	| john		|
		When I search for the term "tdd"
		Then I should see the tweet "#tdd is totally awesome" authored by "john"