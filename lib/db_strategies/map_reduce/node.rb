
module Tweets
  module DbStrategies
    module MapReduce

      class Node
        def self.perform(filename)
          ProcessingSimulator.load_small_file
          Extractor.count_hashtags_in_file(filename)
        end
      end

    end
  end
end


