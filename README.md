# LastTweet

Load last tweets from twitter accounts and save it to cache.

## Installation

Add this line to your application's Gemfile:

    gem 'last_tweet'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install last_tweet

## Usage

Create intitializer:

    # config/initializers/last_tweet_config.rb
    require 'last_tweet'

    LastTweet.configure do |config|
      config.consumer_key       = ''
      config.consumer_secret    = ''
      config.oauth_token        = ''
      config.oauth_token_secret = ''
      config.twitter_accounts   = [{name: 'SmartMedia_cz', count: 3}, {name: 'sun_marketing', count: 3}, {name: 'rails', count: 1}]
    end

    rake load_tweets

    Rails.cache.read('SmartMedia_cz_tweets').each do |tweet|
      puts tweet
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
