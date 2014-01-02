require 'capybara'
require 'capybara/poltergeist'
require 'site_prism'

Capybara.run_server = false
Capybara.app_host = 'https://www.monarch.co.uk'
Capybara.default_wait_time = 10

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {
    :phantomjs_options => ['--ignore-ssl-errors=yes'], 
    :js_errors => false,
    :allow_running_insecure_content => true
  })
end

Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

require_relative 'home'
require_relative 'search_pod'
# require_relative 'flight_result'
# require_relative 'hotel_result'
# require_relative 'review'

class Monarch

  def start
    home_page = Home.new
    home_page.load
    home_page.fill_form
    home_page.screenshot
    puts home_page.current_url
    home_page.submit_form
    home_page.screenshot
    puts home_page.current_url
  end

  def select_flights
    flight_results = FlightResult.new
    flight_results.screenshot
    flight_results.pick
  end

  def review
    review = Review.new
    review.screenshot
    review.pick_transfer
    review.submit_to_checkout
    review.screenshot
  end
end

SitePrism.configure do |config|
  puts config
end
monarch = Monarch.new
monarch.start
# monarch.select_flights
# monarch.review