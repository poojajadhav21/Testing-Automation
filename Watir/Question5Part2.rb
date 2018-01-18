require 'watir'
require 'logger'
log = Logger.new('C:/Users/user/eclipse-workspace/Watir/Question5Part2Log.txt','daily')
log.level = Logger::INFO
log.datetime_format = '%Y-%m-%d %H:%M:%S'
browser = Watir::Browser.new :chrome
browser.driver.manage.window.maximize
browser.goto "https://www.google.com"
log.info "Google search opened"
browser.text_field(:name,"q").set "Red Apple Images"
log.info "Entered keyword"
sleep 3
browser.input(:value,"Google Search").click
if browser.image(:alt,/Red Apple/).exists?
  log.info "Found image test passed"
else
  log.error "Did not find image test failed"
end
sleep 2