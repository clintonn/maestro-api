class Section < ApplicationRecord

  has_many :resources
  belongs_to :trail

end
