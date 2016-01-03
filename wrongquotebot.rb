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

# Max is 106 chars.
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
  "In the end, it's not the years in your life that count. It's the life in your years",
  "I'm not a businessman, I'm a business, man",
  "When you invite people to your home, you invite them to yourself",
  "You can have it all. You just can't have it all at once",
  "Whatever you fear most has no power - it is your fear that has the power",
  "The more you praise and celebrate your life, the more there is in life to celebrate",
  "Devote today to something so daring even you can’t believe you’re doing it",
  "A friend's frown is better than a fool's smile",
  "A friend is easier lost than found",
  "Before you meet the handsome prince you have to kiss a lot of toads",
  "If you can't handle me at my worst, you don't deserve me at my best",
  "Brevity is the soul of wit",
  "In the land of the blind, the one-eyed man is king",
  "Early to bed, early to rise, makes you healthy, wealthy & wise",
  "Melts in your mouth, not in your hand",
  "Sticks and stones may break my bones but words will never hurt me",
  "Better to stay silent and be thought a fool, than to open one's mouth and remove all doubt",
  "When a fox hears a rabbit screaming it comes running, but not to help",
  "It's easier to do a job right, than to explain why you didn't",
  "We choose to go to the moon and do the other things, not because they are easy, but because they are hard!",
  "That's no moon",
  "Do, or do not. There is no try",
  "If you strike me down, I shall become more powerful than you could ever imagine",
  "I find your lack of faith disturbing",
  "One has to kill a few of one's natural selves to let the rest grow - a painful slaughter of innocents",
  "Like Korosawa, I make mad films. K, I don't make films. But if I did, they'd have a samurai",
  "Everything has its beauty, but not everyone sees it",
  "The heroes are the ones still changing, while the villains are locked, petrified, into what they are",
  "The truth is only harsh for those with delusions",
  "Get in tune with Sailor Moon cuz that cartoon has got the BOOM anime babes that make me think the wrong thing",
  "I have a tendency to wear my mind on my sleeve. I have a history of losing my shirt",
  "Don't be mad once you see that he want it. If you liked it then you should've put a ring on it",
  "The first cut is the deepest",
  "You can't always get what you want. But if you try sometimes, you just might find, you can get what you need"
]

# Max is 24 chars.
people = [
  "Abe Lincoln",
  "Moby Dick",
  "Wayne Gretsky",
  "Michael Scott",
  "Clifford the Big Red Dog",
  "Frankenstein",
  "Aquaman",
  "Winnie the Pooh",
  "Gandalf",
  "Yoda",
  "Chewbacca",
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
  "Bob Dylan",
  "Kermit",
  "Obi Wan",
  "King Henry VIII",
  "Marilyn Monroe",
  "Martin Van Buren",
  "Ronald Reagan",
  "Captain Pickard",
  "Kurosawa",
  "Fred Durst",
  "Hamilton",
  "Beyonce",
  "Bob Dylan"
]

# Max of 14 chars.
hashtags = [
  "#quote",
  "#QOTD",
  "#quotes",
  "#motivation",
  "#quoteoftheday",
  "#quotestoliveby",
  "#inspiration"
]

selected_quote = quotes.sample
selected_person = people.sample
selected_hashtag = hashtags.sample

loop do
  tweet "\"%s\" \n-%s %s" % [selected_quote, selected_person, selected_hashtag]
  # Once an hour.
  sleep(3600)
end
