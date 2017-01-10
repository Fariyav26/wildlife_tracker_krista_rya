class Animal < ActiveRecord::Base
  has_many :sightings

  validates :common_name, presence: true
  validates :common_name, length: { minimum: 2 }
  validates :kingdom, presence: true
  validates :kingdom, length: { minimum: 2 }
end
