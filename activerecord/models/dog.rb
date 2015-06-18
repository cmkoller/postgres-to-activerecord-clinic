class Dog < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :age
  belongs_to :owner
end
