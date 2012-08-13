
$:.unshift File.join(File.dirname(__FILE__), '../lib')
require 'tweets'


class Cli
  def self.print_hashtags(tweets_tab)
    tweets_tab.sort_by{|k,v| v}.reverse.each do |k,v|
      label = "#{k.to_s}: "
      puts "#{label.rjust(50)} x#{v}"
    end
  end
end

if ARGV[0].to_s == 'bigfile'
  print 'Load big file... '
  db = Tweets::Database.new(Tweets::DbStrategies::OneBigFile.new)
  puts 'OK'

else
  print 'Load many smaller files... '
  db = Tweets::Database.new(Tweets::DbStrategies::MapReduceWithThreads.new)
  puts 'OK'
end

Cli.print_hashtags db.count_hashtags


