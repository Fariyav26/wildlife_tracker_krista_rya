require 'rails_helper'

RSpec.describe Sighting, type: :model do
  before(:each) do
    @animal = Animal.new(common_name: "Lion", latin_name: "Latinlion", kingdom: "Mammal")
    @animal.save
    @region = Region.new(name: "South")
    @region.save
  end
  describe "Sighting" do
    it "has to be real" do
      expect{Sighting.new}.to_not raise_error
    end
    it "should save" do
      my_sighting = Sighting.new(date: Date.new(2015,01,05), time: Time.new(2000, 01, 01, 12, 30, 0), latitude: "100.1", longitude: "40.2", animal: @animal, region: @region)
      my_sighting.save
      expect(my_sighting.date).to eq Date.new(2015,01,05)
      expect(my_sighting.time).to eq Time.new(2000, 01, 01, 12, 30, 0)
      expect(my_sighting.latitude).to eq 100.1
      expect(my_sighting.longitude).to eq 40.2
      expect(my_sighting.animal.id).to eq @animal.id
      expect(my_sighting.region.id).to eq @region.id
    end
    it "is required to have a date" do
      my_sighting = Sighting.new(date: "", time: Time.new(2000, 01, 01, 12, 30, 0), latitude: "100.1", longitude: "40.2", animal: @animal, region: @region)
      expect(my_sighting.save).to be false
    end
    it "is required to have a time" do
      my_sighting = Sighting.new(date: Date.new(2015,01,05), time: "", latitude: "100.1", longitude: "40.2", animal: @animal, region: @region)
      expect(my_sighting.save).to be false
    end
    it "is required to have an animal" do
      my_sighting = Sighting.new(date: Date.new(2015,01,05), time: Time.new(2000, 01, 01, 12, 30, 0), latitude: "100.1", longitude: "40.2", region: @region)
      expect(my_sighting.save).to be false
    end
    it "is required to have a region" do
      my_sighting = Sighting.new(date: Date.new(2015,01,05), time: Time.new(2000, 01, 01, 12, 30, 0), latitude: "100.1", longitude: "40.2", animal: @animal)
      expect(my_sighting.save).to be false
    end
  end
end
