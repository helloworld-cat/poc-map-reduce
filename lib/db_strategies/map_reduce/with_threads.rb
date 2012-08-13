module Tweets
  module DbStrategies
    module MapReduce

      # Map/Reduce approach with threads in local machinne
      # big file split to many other smaller files
      # methods call operations in threads (or process...)
      class WithThreads < DbStrategy
        require 'thread'

        DIR_FILES = 'data/tweets'

        def initialize
          @mutex = Mutex.new
          @mapping_results = []
        end

        def files
          Dir.entries(DIR_FILES).drop(2) # remove '.' and '..'
        end

        # Map/Reduce approach
        def count_hashtags
          # Mapping
          threads = []
          files.each do |filename|
            threads << Thread.new do
              emit MapReduce::Node.perform("#{DIR_FILES}/#{filename}")
            end
          end
          # start process
          threads.each{|t| t.join}

          # Reduction
          totals_hashtags = {}
          @mapping_results.each do |hashtags|
            hashtags.each do |k, v|
              totals_hashtags[k] ||= 0
              totals_hashtags[k] += v
            end
          end
          totals_hashtags
        end

        private
        def emit(results)
          @mutex.synchronize {@mapping_results << results}
        end
      end

    end
  end
end
