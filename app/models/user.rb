class User < ApplicationRecord
  has_many :trails
  has_secure_password

  # todo: http://guides.rubyonrails.org/association_basics.html#self-joins


end
