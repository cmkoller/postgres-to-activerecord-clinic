class Owner < ActiveRecord::Base
  validates_presence_of :name
  has_many :dogs
end
