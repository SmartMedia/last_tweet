module LastTweet
  class Configuration
    attr_accessor \
      :consumer_key,
      :consumer_secret,
      :oauth_token,
      :oauth_token_secret,
      :twitter_accounts
  end

  def initialize
    @twitter_accounts = []
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end
end