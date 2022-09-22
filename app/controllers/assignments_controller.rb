class AssignmentsController < ApplicationController
  def index
  end

  def create_seats
    seat_array = JSON.load(params[:seat_array]) || []
    passengers = params[:passengers].to_i || 0
    rows = seat_array.collect(&:first)
    columns = seat_array.collect(&:last)
    total_seats = rows.sum * columns.max
    Assignments::Operations::Assignment.new(seat_array, passengers).draw
    redirect_to show_seats_assignments_path(total_seats: total_seats)
  end

  def show_seats
    total_seats = params[:total_seats].to_i
    seats = Seat.order('id desc').limit(total_seats)
    @sorted_seats = seats.sort_by &:original_seat_number
  end
end
