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
      text = Twitter.user_timeline(twitter_account).first.text
      puts "last_tweet_#{twitter_account}"
      Rails.cache.write("last_tweet_#{twitter_account}", text)
      puts Rails.cache.read("last_tweet_#{twitter_account}")
      puts 'Done.'
    rescue => e
      puts "ERROR: #{e}"
    end
  end
end