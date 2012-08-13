module Tweets
  module DbStrategies
    
    # Lazy approach:
    # - load a big file (1Go or more...), it's dangerous
    # - no scalability
    class OneBigFile < DbStrategy
      BIG_FILE_NAME = "data/one_big_file.tweets"

      def count_hashtags
        ProcessingSimulator.load_big_file
        Extractor.count_hashtags_in_file(BIG_FILE_NAME)
      end
    end
  end
end

