require 'open-uri'
require 'json'

raw = open('https://hacker-news.firebaseio.com/v0/newstories.json').read
item_ids = JSON.parse(raw)

item_ids.first(10).each do |id|
  url = "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
  story = JSON.load(open(url).read)
  age = Time.now.to_i - story['time']
  puts "#{age}s - #{story['title']} - #{story['url']}"
end
