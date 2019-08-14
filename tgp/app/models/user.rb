class User < ApplicationRecord
 has_many :gossips
  belongs_to :city, optional: true
  has_many :comments

end
