require 'fake_twitter'

When /^I search for the term "(.*?)"$/ do |search_term|
	visit root_path
	fill_in 'Search Term', with: search_term
	click_button 'Search'
end

Then /^I should see tweets with the hashtag "(.*?)"$/ do |search_term|
	page.current_path.should == search_path(search_term)
	within '[data-role="search-results"]' do
		page.should have_css("li:contains('##{search_term}')")
	end
end

Given /^Twitter returns the following tweets when searching for "(.*?)":$/ do |hashtag, tweets_table|
	fake_twitter = FakeTwitter.new(hashtag, tweets_table.hashes)
	# [{ text: 'whatever'}, {text: 'whatever'}] 
	Searcher.search_implementation = fake_twitter
end

Then /^I should see the tweet "(.*?)" authored by "(.*?)"$/ do |tweet_text, tweet_from_user|
	within '[data-role="search-results"]' do
		page.should have_css("li:contains('#{tweet_text}')")
		page.should have_css("li:contains('#{tweet_from_user}')")
	end
end

Around do |scenario, block|
	old_search_immplementation = Searcher.search_implementation
	block.call
	Searcher.search_implementation = old_search_immplementation
end
