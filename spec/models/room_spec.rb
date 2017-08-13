require 'rails_helper'

RSpec.describe Room, type: :model do

  context "when is associate" do
    it { should have_many(:tenancy_contracts) }
    it { should have_many(:students).through(:tenancy_contracts) }
  end

  context 'when is validate' do
    it { should validate_presence_of(:capacity) }
    it { should validate_presence_of(:number) }
    it { should validate_uniqueness_of(:number) }

    it { should validate_length_of(:name).is_at_least(5).is_at_most(150)}
  end
end
