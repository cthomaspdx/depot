
class Review < ActiveRecord::Base
  belongs_to :product
  attr_accessible :comment, :rating
 
  validates_presence_of :comment, :rating, on: :create, message: "can't be blank"

end
