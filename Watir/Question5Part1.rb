require 'watir'
require 'logger'
#creating a log file to be recorded on a dialy basis and providing its path 
log = Logger.new('C:/Users/user/eclipse-workspace/Watir/Question5Part1Log.txt','daily')
#log level is mentioned as information to specify details of when a task starts and ends
log.level = Logger::INFO
#formating log time stamp in a readable format
log.datetime_format = '%Y-%m-%d %H:%M:%S'
#this script can be executed for any browser by just replacing the browser name
browser = Watir::Browser.new :chrome
#maximizing the window screen
browser.driver.manage.window.maximize
#opening google search
browser.goto "https://www.google.com"
log.info "Google search opened"
#setting the search keyword
browser.text_field(:name,"q").set "SmartBiz"
log.info "Entered keyword"
#waiting for 3 seconds for the page to load completely
sleep 3
#hit the search button
browser.input(:value,"Google Search").click
#validating search attempts using log.info
if browser.text.include? "Quality assurance"
  log.info "Found text test passed"
else
  log.error "Did not find text test failed"
end  
sleep 3


