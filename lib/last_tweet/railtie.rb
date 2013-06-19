require 'last_tweet'
require 'rails'

module LastTweet
  class Railtie < Rails::Railtie
    railtie_name :last_tweet

    rake_tasks do
      load "tasks/load_tweets.rake"
    end
  end
end