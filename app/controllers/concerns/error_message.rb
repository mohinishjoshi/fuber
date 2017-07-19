module ErrorMessage
  def valid_location?(_source, _destination)
    @error = 'Source Location is invalid' if _source.blank?
    @error = 'Destination is invalid' if _destination.blank?
    @error
  end
end
