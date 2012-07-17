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