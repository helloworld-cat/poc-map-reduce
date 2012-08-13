
require 'test/unit'

$:.unshift File.join(File.dirname(__FILE__), '../lib')
require 'tweets'

class ExtractorTest < Test::Unit::TestCase
  TWEET = 'Hello World #lesgens #hello #!hello'
  TWEETS_FILE = 'data/tweets.test'

  def test_hashtags
    hashtags = Tweets::Extractor.hashtags(TWEET)
    assert_equal 3, hashtags.size
    assert_equal 'lesgens', hashtags[0]
    assert_equal 'hello', hashtags[1]
    assert_equal 'hello', hashtags[2]
  end

  def test_count_hashtags_in_file
    hashtags = Tweets::Extractor.count_hashtags_in_file TWEETS_FILE
    assert_equal 2, hashtags.size
    assert_equal 1, hashtags[:lesgens]
    assert_equal 3, hashtags[:hello]
  end

end

