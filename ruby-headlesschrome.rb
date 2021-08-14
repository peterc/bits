require 'selenium-webdriver'

options = Selenium::WebDriver::Chrome::Options.new(args: ['headless', 'window-size=960,540'])

driver = Selenium::WebDriver.for(:chrome, options: options)

driver.get('https://reactjs.org/blog/2019/02/23/is-react-translated-yet.html')



puts driver.title

el = driver.find_element(:tag_name, 'body')
puts el.text


els = driver.find_elements(:tag_name, 'h1')
p els.map { |el| el.text }
els = driver.find_elements(:tag_name, 'h2')
p els.map { |el| el.text }
els = driver.find_elements(:tag_name, 'h3')
p els.map { |el| el.text }
els = driver.find_elements(:tag_name, 'p')
p els.map { |el| el.text }


driver.save_screenshot('ss.png')

driver.quit
