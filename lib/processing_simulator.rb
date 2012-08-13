module Tweets
  # simulate file processing
  # - 1000 tweets -> 5s
  # -  200 tweets -> 1s
  class ProcessingSimulator
    def self.load_big_file; sleep 5; end
    def self.load_small_file; sleep 1; end
  end
end

