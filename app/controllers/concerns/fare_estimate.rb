module FareEstimate
  extend ActiveSupport::Concern

  def calculate_distance(_source, _destination)
    Geocoder::Calculations.distance_between(_source, _destination)
  end

  def calculate_fare_estimate(_distance, _is_pink)
    fare = (_distance * 2.0)
    byebug
    fare = fare + 5.0 if _is_pink
    fare
  end
end
