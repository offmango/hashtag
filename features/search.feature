Feature: Search
	In order to find information that's interesting to me
	As a user
	I should be able to search for tweets

	Scenario: Search Twitter by hashtag
		When I search for the term "tdd"
		Then I should see tweets with the hashtag "tdd"
