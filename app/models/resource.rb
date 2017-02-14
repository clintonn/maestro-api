class Resource < ApplicationRecord

  belongs_to :section
  has_and_belongs_to_many :trails

end
