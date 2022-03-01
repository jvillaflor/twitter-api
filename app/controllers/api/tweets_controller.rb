class Api::TweetsController < ApplicationController
  api :POST, '/tweets/temperatures', "tweets current and 5 days forecast temperatures."
  param :appid, String, desc: "Open Weather Map appid (Visit https://openweathermap.org/appid)", :required => true
  returns :code => :created, :desc => "Tweet has successful sent." do
    property :status, String, :desc => "tweeted"
    property :url, String, :desc => "the tweet url"
    # property ...
    # param_group ...
  end
  def temperatures
    begin
      appid = params.require(:appid)
      tweeter = Tweeter.new
      tweet = tweeter.tweet_temperature(appid)
      
      if tweet.created?
        render json: { status: 'tweeted', url: tweet.url.host + tweet.url.path }, status: :created
      else
        render json: { status: 'error', message: "Internal Server Error" }, status: :error
      end
    rescue ActionController::ParameterMissing
      render json: { status: 'error', message: "Appid is required" }, status: :bad_request
    end
  end
end
