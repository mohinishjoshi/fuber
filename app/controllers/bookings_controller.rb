class BookingsController < ApplicationController
  include FareEstimate
  include ErrorMessage
  include FindDriver

  layout 'bookings'

  def create
    source = params[:source_location]
    destination = params[:destination_location]
    is_pink = params[:is_pink]

    valid_location?(source, destination)

    if @error.nil?
      distance = calculate_distance(source.split(','), destination.split(',')).round(2)
      price = calculate_fare_estimate(distance, is_pink).round(2)

      @driver = find_driver(source, is_pink)

      if @driver.nil?
        @error = 'Sorry. No cabs around.'
      else
        st_lat, st_long = source.split(',').map(&:to_f)
        dest_lat, dest_long = destination.split(',').map(&:to_f)
        byebug
        @booking = Booking.new(start_lat: st_lat, start_long: st_long, dest_lat: dest_lat, dest_long: dest_long, user_id: @driver.id, price: price)

        if @booking.save
          @driver.update(available: false)
          session[:current_booking] = @booking.id
        else
          @error = @driver.errors.full_messages.first
        end
      end
    end

    if @error.nil?
      redirect_to :action => 'current', :id => @booking.id
    else
      flash[:error] = @error
      render :template => 'home/index'
    end
  end

  def complete
    byebug
    @booking = Booking.find_by_id(params[:id])
    @booking.user.update(available: true, current_lat: @booking.dest_lat, current_long: @booking.dest_long)
    @booking.delete
    redirect_to root_path
  end

  def current
    @booking = Booking.find_by_id(params[:id])
  end
end
