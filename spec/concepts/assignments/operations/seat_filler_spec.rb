require 'rails_helper'
RSpec.describe Assignments::Operations::SeatFiller do
  let(:service) { described_class.new(4, 30) }

  let(:seat1) { instance_double(Seat, id: 1, category: Seat::AISLE, original_seat_number: 3, update_attribute: nil) }
  let(:seat2) { instance_double(Seat, id: 2, category: Seat::WINDOW, original_seat_number: 2, update_attribute: nil) }
  let(:seat3) { instance_double(Seat, id: 3, category: Seat::MIDDLE, original_seat_number: 1, update_attribute: nil) }

  let(:seats) {[
    seat1, seat2, seat3
  ]}

  let(:expected_response) {[
    seat3, seat2, seat1
  ]}

  it 'should sort the seats by original_seat_number' do
    allow(service).to receive(:seats) {seats}
    expect(service.fill).to eq expected_response
  end

end
