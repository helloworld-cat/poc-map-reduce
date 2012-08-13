require 'test/unit'

$:.unshift File.join(File.dirname(__FILE__), '../../lib')

require 'tweets'
include Tweets::DbStrategies


class WithThreadsTest < Test::Unit::TestCase

  def setup
    @db = MapReduce::WithThreads.new
  end

  def test_count_hashtags
    hashtags = []
    assert_nothing_raised(NotImplementedError) { hashtags = @db.count_hashtags }
    assert_equal 125, hashtags.size
    assert_equal 66, hashtags[:iphone]
  end
end

