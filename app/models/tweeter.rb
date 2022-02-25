class Tweeter
    # Tweets a message.
    # (defaults to `:html`)
    #
    # == Parameters:
    # msg::
    #   Message that will be posted on Twitter.
    #
    # == Returns:
    # Twitter::Tweet 
    #
    def tweet(msg)
        client.update(msg)
    end
    
    # Tweets current and 5 day forecast temperatures. 
    # Data collected from Open Weather Map.
    # (defaults to `:html`)
    #
    # == Parameters:
    # appid::
    #   Message that will be posted on Twitter.
    #
    # == Returns:
    # Twitter::Tweet 
    #
    def tweet_temperature(appid)
      owm = OpenWeather.new(appid)
      tweet(owm.temperatures_as_text)
    end

    private

    def client
        Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV["CONSUMER_KEY"]
            config.consumer_secret     = ENV["CONSUMER_SECRET"]
            config.access_token        = ENV["ACCESS_TOKEN"]
            config.access_token_secret = ENV["ACCESS_SECRET"]
        end
    end
end