
require 'test/unit'

$:.unshift File.join(File.dirname(__FILE__), '../lib')
require 'tweets'


class DbStrategyTest < Test::Unit::TestCase

  def test_count_hashtags
    dbs = Tweets::DbStrategies::DbStrategy.new
    assert_raise(NotImplementedError) do
      dbs.count_hashtags
    end
  end
end

