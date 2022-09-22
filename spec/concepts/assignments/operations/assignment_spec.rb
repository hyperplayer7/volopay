require 'rails_helper'
RSpec.describe Assignments::Operations::Assignment do
  let(:service) { described_class.new([[3,4], [4,5], [2,3], [3,4]], 30) }

  it 'get all the rows' do
    expect(service.rows).to eq([3, 4, 2, 3])
  end

  it 'get all the columns' do
    expect(service.columns).to eq([4, 5, 3, 4])
  end

  it 'get max columns' do
    expect(service.max_columns).to eq(5)
  end

  it 'get rows_sum' do
    expect(service.rows_sum).to eq(12)
  end

  it 'get the total_seats' do
    expect(service.total_seats).to eq(60)
  end

  it 'get the total generated seat count' do
    expect(service.draw.size).to eq(60)
  end
end
