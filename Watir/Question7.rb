require 'watir'
b = Watir::Browser.new:chrome
#opens tripadvisor website through chrome browser
b.goto "https://www.tripadvisor.com/"
#enters San Francisco as search text to the input field
b.text_field(:class,/typeahead_input/).set"San Francisco"
#clicks Check In field to open the calendar 
b.span(:text,"Check In").click
#picks first selectable date which is today's date. Check in date is today's date and by default check out day is the next date
b.div(:class,/dsdc-wrapper dsdc-active-calendar/).span(:class,/dsdc-cell dsdc-day dsdc-today/).click
#clicks the find hotels button
b.button(:class,/form_submit/).click
#waiting for 3 seconds to view the search results
sleep 3
