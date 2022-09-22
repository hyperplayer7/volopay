class Seat < ApplicationRecord

  AISLE = 'aisle'
  WINDOW = 'window'
  MIDDLE = 'middle'
  EMPTY = 'x'

  WEIGHT_CATEGORY = [AISLE, WINDOW, MIDDLE]

end
