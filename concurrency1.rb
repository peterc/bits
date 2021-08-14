# http://ruby-concurrency.github.io/concurrent-ruby/Concurrent.html#dataflow-class_method

require 'concurrent'
require 'open-uri'

urls = [
  'https://en.wikipedia.org/wiki/Linear_algebra',
  'https://reddit.com/',
  'http://example.com/'
]

crawl_jobs = urls.map do |url|
  Concurrent.dataflow do
    open(url).read
  end
end

results = Concurrent.dataflow(*crawl_jobs) do
  results = []
  crawl_jobs.map { |res| results << res.value.length }
  results.inject(:+) / results.length
end

puts "Average length was #{results.value}"
