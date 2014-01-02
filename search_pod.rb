class Monarch
  class SearchPodSection < SitePrism::Section
    element :departure_date, "input[id='content_0_homepagerail_1_Flights_fromDate']"
    element :arrival_date, "input[id='content_0_homepagerail_1_Flights_toDate']"
    element :departure_airport, "select[id='content_0_homepagerail_1_Flights_OriginList']"
    element :destination_airport, "select[id='content_0_homepagerail_1_Flights_DestinationList']"
    element :number_of_adults, "select[id='content_0_homepagerail_1_Flights_AdultsList']"
    element :number_of_children, "select[id='content_0_homepagerail_1_Flights_ChildrenList']"
    element :number_of_infants, "select[id='content_0_homepagerail_1_Flights_InfantList']"
    element :return_trip, "input[id='content_0_homepagerail_1_Flights_ReturnTrip']"
    element :one_way_trip, "input[id='content_0_homepagerail_1_Flights_OneWayTrip']"
    element :search_button, "button[id='FindFlightsButton']"

    def fill_form
      departure_airport.select('Manchester')
      destination_airport.select(destination)
      departure_date.set "14/03/2014"
      arrival_date.set "21/03/2014"
      number_of_adults.select(3)
      number_of_children.select(2)
      number_of_infants.select(1)
      one_way_trip.set(true)
    end

    def submit_form
      search_button.click
    end

    private

    def destination
      "Faro"
    end
  end
end