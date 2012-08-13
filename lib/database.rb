module Tweets

  # query class for work with tweets (load, find, etc.)
  class Database
    def initialize(strategy)
      @strategy = strategy
    end

    def count_hashtags
      @strategy.count_hashtags
    end

    # other methods ...
    
  end
end
