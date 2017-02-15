class User < ApplicationRecord
  has_many :trails, foreign_key: :author_id, class_name: :Trail
  has_secure_password
  # todo: http://guides.rubyonrails.org/association_basics.html#self-joins

  validates_presence_of :email, uniqueness: true
  validates_presence_of :password

end
