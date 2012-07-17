class FakeTwitter
	def initialize(hashtag, array_of_tweet_hashes)
		@hashtag_and_results = {}
		@hashtag_and_results[hashtag] = array_of_tweet_hashes.map do |hash|
			Twitter::Status.new(hash.stringify_keys)
		end
	end

	def search(hashtag)
		@hashtag_and_results.fetch(hashtag) { [] }
	end
end
