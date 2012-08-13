module Tweets


  class Extractor
    PATTERN_HASHTAG = /(?:^|\s)(#\S+)/
    PATTERN_MENTION = /(?:^|\s)(@\S+)/

    def self.hashtags(line)
      line.scan(PATTERN_HASHTAG).map{|raw_hashtag| clean_hashtag(raw_hashtag)}
    end

    def self.mentions(lines)
      line.scan(PATTERN_MENTION)
    end

    # count hashtags in file
    # output: {'hashtag1' => 282, 'hashtag2' => 45, ...}
    # output: not sorted
    def self.count_hashtags_in_file(filename)
      hashtags = {}
      File.open(filename).each_line do |line|
        hashtags(line).each do |hashtag|
          sym = hashtag.to_sym
          hashtags[sym] ||= 0
          hashtags[sym] += 1
        end
      end
      hashtags
    end

    private
    def self.clean_hashtag(raw_hashtag)
      h = raw_hashtag[0]
      %w(, ! # @ ?).each{|w| h.gsub!(w, '')}
      h.downcase
    end
  end
end
