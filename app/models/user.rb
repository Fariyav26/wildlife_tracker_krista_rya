class User < ActiveRecord::Base
  has_many :sightings

  validates :password, presence: true
  validates :user_id, presence: true
  validates :name, presence: true

  validates :user_id, uniqueness: true
  validates :user_id, length: { minimum: 2}

  validates :password, length: { minimum: 6}
end
