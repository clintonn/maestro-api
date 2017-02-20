class User < ApplicationRecord
  has_many :trails, foreign_key: :author_id, class_name: :Trail
  has_many :votes
  has_many :voted_trails, through: :votes, source: :trail
  has_many :follows
  has_many :followed_trails, through: :follows, source: :trail
  has_secure_password
  # todo: http://guides.rubyonrails.org/association_basics.html#self-joins

  validates_presence_of :email, uniqueness: true
  validates_presence_of :password

end
