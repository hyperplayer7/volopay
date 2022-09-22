module Assignments
    module Operations
      class SeatFiller
        def initialize(total_seats, passengers)
          @total_seats = total_seats.to_i || 0
          @passengers = passengers.to_i || 0
        end
  
        def fill
          counter = 0

          Seat::WEIGHT_CATEGORY.each do |cat|
            fill_seats = sorted_seats.select { |seat| seat.category == cat }
            fill_seats.each do |seat|
              break if counter >= @passengers
              counter += 1
              seat.update_attribute(:passenger_number, counter)
            end
          end
          sorted_seats
        end

        def seats
          @seats ||= Seat.order('id desc').limit(@total_seats)
        end

        def sorted_seats
          @sorted_seats ||= seats.sort_by &:original_seat_number
        end
  
      end
    end
  end