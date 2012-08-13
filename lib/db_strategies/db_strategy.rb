module Tweets
  module DbStrategies

    # Interface
    class DbStrategy
      
      # must return Hash with hashtags count
      # {'hashtag1' => 282, 'hashtag2' => 45, ...}
      def count_hashtags
        raise NotImplementedError
      end
      # ... other methods
    end
  end
end

