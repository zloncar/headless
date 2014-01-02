class TestHome < SitePrism::Page

  set_url "/"
  set_url_matcher /monarch.co.uk\/?/

  element :departure_date, "input[id='content_0_homepagerail_1_Flights_fromDate']"
  element :arrival_date, "input[id='content_0_homepagerail_1_Flights_toDate']"
  element :destination_airport, "select[id='content_0_homepagerail_1_Flights_OriginList']"
  elements :destination_airports, "select[id='content_0_homepagerail_1_Flights_OriginList'] option"

  def dd?
    departure_date.value    
  end

  def flying_out_date
    departure_date.set "14/03/2014"
  end

  def coming_back_date
    arrival_date.set "21/03/2014"
  end

  def dest
    destination_airports.each { |airport| puts airport.value }
    puts destination_airports.selected
    destination_airport.select("Birmingham")
  end

  def screenshot
    page.save_screenshot('monarch_home.png', full: false)
  end

end
