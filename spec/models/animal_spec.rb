require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe "Animal" do
    it "has to be real" do
      expect{Animal.new}.to_not raise_error
    end
    it "should save" do
      my_animal = Animal.new(common_name: "lion", latin_name: "latinlion", kingdom: "mammal")
      my_animal.save
      expect(my_animal.common_name).to eq "lion"
      expect(my_animal.latin_name).to eq "latinlion"
      expect(my_animal.kingdom).to eq "mammal"
      expect(my_animal.common_name).to be_a String
      expect(my_animal.latin_name).to be_a String
      expect(my_animal.kingdom).to be_a String
    end
    it "is required to have a common name" do
      my_animal = Animal.new(common_name: "", latin_name: "latinlion", kingdom: "mammal")
      expect(my_animal.save).to be false
    end
    it "is required to have a common name greater than 2 characters" do
      my_animal = Animal.new(common_name: "l", latin_name: "latinlion", kingdom: "mammal")
      expect(my_animal.save).to be false
    end
    it "is required to have a kingdom" do
      my_animal = Animal.new(common_name: "lion", latin_name: "latinlion", kingdom: "")
      expect(my_animal.save).to be false
    end
    it "is required to have a common name greater than 2 characters" do
      my_animal = Animal.new(common_name: "lion", latin_name: "latinlion", kingdom: "m")
      expect(my_animal.save).to be false
    end
  end
end
