require File.join(File.dirname(__FILE__), '..', 'last_tweet')

desc 'Load last tweet'
task :load_tweets => :environment do
  puts 'Loading...'

  Twitter.configure do |config|
    config.consumer_key = LastTweet.configuration.consumer_key
    config.consumer_secret = LastTweet.configuration.consumer_secret
    config.oauth_token = LastTweet.configuration.oauth_token
    config.oauth_token_secret = LastTweet.configuration.oauth_token_secret
  end

  LastTweet.configuration.twitter_accounts.each do |twitter_account|
    begin
      tweets = Twitter.user_timeline(twitter_account[:name])[0..twitter_account[:count]-1].map(&:text)
      puts "#{twitter_account[:name]}_tweets"
      Rails.cache.write("#{twitter_account[:name]}_tweets", tweets)
      puts Rails.cache.read("#{twitter_account[:name]}_tweets")
      puts 'Done.'
    rescue => e
      puts "ERROR: #{e}"
    end
  end
end