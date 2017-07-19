module FindDriver
  extend ActiveSupport::Concern
  def find_driver(_source, is_pink)
    lat = _source.split(',')[0].to_f
    lng = _source.split(',')[1].to_f

    records = User.find_by_sql ["SELECT id, (3959 * acos (
      cos(radians(?))
      * cos(radians(current_lat))
      * cos(radians(current_long) - radians(?))
      + sin(radians(?))
      * sin(radians(current_lat))
      )
    ) AS distance FROM Users ORDER BY (3959 * acos (
      cos(radians(?))
      * cos(radians(current_lat))
      * cos(radians(current_long) - radians(?))
      + sin(radians(?))
      * sin(radians(current_lat))
      )
    ) LIMIT 20", lat, lng, lat, lat, lng, lat]

    records.each do |_r|
      user = User.find(_r.id)
      return user if user.available && user.car.is_pink
    end

    nil
  end
end
