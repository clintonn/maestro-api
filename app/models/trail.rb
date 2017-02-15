class Trail < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :category
  has_many :sections
  has_many :resources, through: :sections
end
