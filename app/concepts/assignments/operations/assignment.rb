module Assignments
  module Operations
    class Assignment
      def initialize(seat_array, passengers)
        @seat_array = seat_array || []
        @passengers = passengers || 0
      end

      def draw
        return if @seat_array.blank?

        counter = 0
        (1..max_columns).each_with_index do |mc, maxcindex|
          rows.each_with_index do |row, rsindex|
            (1..row).each_with_index do |seat, rindex|
              counter += 1
              if columns[rsindex] <= maxcindex
                seat_create(Seat::EMPTY, counter)
              elsif rsindex == 0 && rindex == 0 || rows.size == rsindex + 1 && row == rindex + 1
                seat_create(Seat::WINDOW, counter)
              elsif row == rindex + 1 || rindex == 0
                seat_create(Seat::AISLE, counter)
              else
                seat_create(Seat::MIDDLE, counter)
              end
            end # end of row
          end # end of rows
        end # end of max columns
        seat_filler
      end # end of draw

      def seat_create(category, counter)
        Seat.create(category: category, original_seat_number: counter)
      end

      def rows
        @rows ||= @seat_array.collect(&:first)
      end

      def columns
        @columns ||= @seat_array.collect(&:last)
      end

      def max_columns
        @max_columns ||= columns.max
      end

      def rows_sum
        @rows_sum ||= rows.sum
      end

      def total_seats
        @total_seats ||= rows_sum * columns.max
      end

      def seat_filler
        Assignments::Operations::SeatFiller.new(total_seats, @passengers).fill
      end

    end
  end
end