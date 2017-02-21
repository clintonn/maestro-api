class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :trail, :counter_cache => true
end
