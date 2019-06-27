require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should belong_to(:vertical) }
  it { should have_many(:courses).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:state) }
  it { should validate_uniqueness_of(:name) }
end
