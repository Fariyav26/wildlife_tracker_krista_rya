require 'rails_helper'

RSpec.describe Region, type: :model do
  describe "Region" do
    it "has to be real" do
      expect{Region.new}.to_not raise_error
    end
    it "should save" do
      my_region = Region.new(name: "North")
      my_region.save
      expect(my_region.name).to eq "North"
    end
    it "is required to have a name" do
      my_region = Region.new(name: "")
      expect(my_region.save).to be false
    end
  end
end
