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

quotes = [
  "Use the force, Harry",
  "The wonderful thing about Tiggers, is I'm the only one!",
  "What I like doing best is Nothing",
  "A bear, however hard he tries, grows tubby without exercise",
  "It never gets easier, you just get better",
  "If opportunity doesn't knock, build a door",
  "Don't believe everything you read on the internet",
  "If you have no critics you'll likely have no success",
  "If life gives you lemons, make lemonade. Then find someone whose life gave them vodka, and have a party",
  "I love deadlines. I like the whooshing sound they make as they fly by",
  "Weather forecast for tonight: dark",
  "Behind every great man is a woman rolling her eyes",
  "Don't cry because it's over. Smile because it happened",
  "Adults are just outdated children",
  "I like nonsense; it wakes up the brain cells",
  "If you're going through hell: keep going",
  "Choose a job you love, and you will never have to work a day in your life",
  "Our greatest glory is not in never falling, but in rising every time we fall",
  "Better a diamond with a flaw than a pebble without",
  "Only the wisest and stupidest of men never change",
  "In the end, it's not the years in your life that count. It's the life in your years"
]

people = [
  "Abe Lincoln",
  "Winnie the Pooh",
  "Gandalf",
  "Yoda",
  "Thomas Edison",
  "Teddy Roosevelt",
  "P.T. Barnum",
  "Robert E. Lee",
  "Albert Einstein",
  "Napoleon",
  "Malcolm X",
  "Isaac Asimov",
  "Mother Theresa",
  "Dr. Seuss",
  "Confucius",
  "Muhammed Ali",
  "Winston Churchill",
  "Shakespeare",
  "Buddha",
  "Groucho Marx",
  "C.S. Lewis",
  "Bob Dylan"
]

selected_quote = quotes.sample
selected_person = people.sample

loop do
  tweet "\"%s\" \n-%s #quote" % [selected_quote, selected_person]
  # Once an hour.
  sleep(3600)
end
