require 'twitter'
require 'dotenv'
Dotenv.load

# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV["consumer_key "]
  config.consumer_secret     = ENV["consumer_secret"]
  config.access_token        = ENV["access_token "]
  config.access_token_secret = ENV["access_token_secret"]
end

topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end