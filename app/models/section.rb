class Section < ApplicationRecord

  has_many :resources, dependent: :destroy
  belongs_to :trail

end
