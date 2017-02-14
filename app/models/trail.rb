class Trail < ApplicationRecord

  belongs_to :category
  has_many :sections
  has_many :resources, through: :sections

end
