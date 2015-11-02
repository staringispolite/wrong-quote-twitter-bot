#!/usr/bin/env ruby

require 'rubygems'
require 'chatterbot/dsl'

if ENV['ENV'] == 'DEVELOPMENT'
  require 'dotenv'
  Dotenv.load
end

consumer_key = ENV['CONSUMER_KEY']
consumer_secret = ENV['CONSUMER_SECRET']
secret = ENV['SECRET']
token = ENV['TOKEN']
db_uri = ENV['CLEARDB_DATABASE_URL']

# Enabling **debug_mode** prevents the bot from actually sending
# tweets. Keep this active while you are developing your bot. Once you
# are ready to send out tweets, you can remove this line.
# debug_mode

# Chatterbot will keep track of the most recent tweets your bot has
# handled so you don't need to worry about that yourself. While
# testing, you can use the **no_update** directive to prevent
# chatterbot from updating those values. This directive can also be
# handy if you are doing something advanced where you want to track
# which tweet you saw last on your own.
no_update

# remove this to get less output when running your bot
verbose

# here's a list of users to ignore
blacklist "abc", "def"

# here's a list of things to exclude from searches
exclude "hi", "spammer", "junk"
exclude "http://", "https://"

streaming do
  replies do |tweet|
    puts "replying to tweet "
    reply "#{tweet_user(tweet)} %s" % "hello world!"
  end
  # Don't go crazy with the infinite looping
end
