require 'capybara'
require 'capybara/poltergeist'
require 'site_prism'

Capybara.run_server = false
Capybara.app_host = 'http://www.monarch.co.uk'
Capybara.default_wait_time = 10

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {
    :phantomjs_options => ['--ignore-ssl-errors=yes'], 
    :js_errors => false
  })
end

Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

require_relative 'test_home'

@test = TestHome.new
@test.load
puts @test.current_url
puts "page displayed = #{@test.displayed?}"
puts "page secure = #{@test.secure?}"
puts "departure date exists = #{@test.has_departure_date?}"
puts "destination airports exists = #{@test.has_destination_airports?}"
@test.dest
@test.flying_out_date
@test.coming_back_date
@test.screenshot
