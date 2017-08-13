require 'rails_helper'

RSpec.describe Student, type: :model do
  bad_names = ["aa@#", "s d", "...wqwq!"]
  bad_emails = ["a s@wp", "qwe@.pl", "a@222222", "121sdasd"]

  context "when is associate" do
    it { should have_one(:tenancy_contract) }
    it { should have_one(:room).through(:tenancy_contract) }
  end

  context 'when is validate' do
    it { should validate_presence_of(:nickname) }
    it { should validate_uniqueness_of(:nickname).case_insensitive }
    it { should validate_length_of(:nickname).is_at_least(5).is_at_most(20)}
    it { should_not allow_value("!@ 32sad >>,").for(:nickname) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    bad_emails.each { |b| it { should_not allow_value(b).for(:email) } }
    bad_names.each do |b|
      it { should_not allow_value(b).for(:first_name)}
      it { should_not allow_value(b).for(:last_name)}
    end
    it { should validate_length_of(:first_name).is_at_most(30)}
    it { should validate_length_of(:last_name).is_at_most(30)}
    it { should validate_presence_of(:id_number) }
    it { should validate_uniqueness_of(:id_number) }
    it { should_not allow_value("aSd!@#").for(:id_number) }

  end
end
