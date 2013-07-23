require 'twitter'

class User
  attr_accessor :twitter_username

  def last_five_tweets
    Twitter.user_timeline("furikuri").take(5).map do |tweet|
      tweet.text
    end.to_a
  end
end