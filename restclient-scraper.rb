require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'rest-client'
  gem 'nokogiri'
end

###

body = RestClient.get("https://www.reddit.com/r/ruby/").body

puts "Posts from r/ruby front page:"
Nokogiri::HTML(body).xpath("//div[contains(@class, 'scrollerItem')]//h2").each do |h2|
  puts h2.text.strip
end
