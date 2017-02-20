class Trail < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :category
  has_many :sections, dependent: :destroy
  has_many :resources, through: :sections
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user
  has_many :follows
  has_many :followers, through: :follows, source: :user
end
