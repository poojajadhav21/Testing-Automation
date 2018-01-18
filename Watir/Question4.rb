require 'watir'
#type gem install watir-scroll in cmd to install the scroll requirement for this script
require 'watir-scroll'
#require 'selenium-webdriver'
#add required driver path for specific browser testing
#Selenium::WebDriver::Firefox.driver_path="C:/Users/user/Downloads/chromedriver_win32/chromedriver.exe"
#Selenium::WebDriver::Firefox.driver_path="C:/Users/user/Downloads/geckodriver-v0.19.1-win64/geckodriver.exe"
#Selenium::WebDriver::IE.driver_path="C:/Users/user/Downloads/IEDriverServer_x64_3.6.0/IEDriverServer.exe"
browser = Watir::Browser.new :chrome
browser.driver.manage.window.maximize

#testing for account creation
password = "amazontester" 
id = "amazontester200@gmail.com" 
begin
browser.goto "https://www.amazon.com/ap/signin?_encoding=UTF8&ignoreAuthState=1&openid.assoc_handle=usflex&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.mode=checkid_setup&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&openid.ns.pape=http%3A%2F%2Fspecs.openid.net%2Fextensions%2Fpape%2F1.0&openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2F%3Fref_%3Dnav_ya_signin&switch_account="
browser.a(:id,"createAccountSubmit").click
browser.text_field(:id,"ap_customer_name").set"Amazon Tester"
browser.text_field(:id,"ap_email").set id 
browser.text_field(:id,"ap_password").set password
browser.text_field(:id,"ap_password_check").set password
browser.button(:id,"continue").click
sleep 3
end

#testing for Sign in
browser.goto "https://www.amazon.com/ap/signin?_encodingUTF8&ignoreAuthState=1&openid.assoc_handle=usflex&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.mode=checkid_setup&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&openid.ns.pape=http%3A%2F%2Fspecs.openid.net%2Fextensions%2Fpape%2F1.0&openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2F%3Fref_%3Dnav_ya_signin&switch_account="
browser.text_field(:id,"ap_email").set id 
browser.text_field(:id,"ap_password").set password
browser.button(:id,"signInSubmit").click
sleep 5

#testing for adding items into cart and verify if cart is updated
browser.goto "https://amazon.com"
sleep 5
browser.text_field(:name,"field-keywords").set("Alexa Echo")
sleep 3
browser.button(:value,"Go").click
sleep 2
browser.image(:alt,/Product Details/).click
browser.image(:src,"https://images-na.ssl-images-amazon.com/images/I/51baceIpz0L._SS36_.jpg").click
browser.select_list(:id,"quantity").option(:value,"2").select
browser.button(:value,"Pre-order: Add to Cart").click
sleep 4
#continuebutton = browser.button(:class,"a-button-input")
#continuebutton.scroll.to :bottom
#browser.button(:class,"a-button-input").click
browser.div(:class,/a-column a-span8 a-push4/).click
sleep 4
#browser.button(:class,"a-button-input").click

#testing for sign out
browser.div(:id=>"nav-tools").a(:text=>"Not Amazon? Sign Out").click



