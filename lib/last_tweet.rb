require 'twitter'
require "last_tweet/version"
require "last_tweet/configuration"

module LastTweet
  if defined?(Rails) and Rails::VERSION::STRING =~ /^3./
    require 'last_tweet/railtie'
  end
end
