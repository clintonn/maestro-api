class VoteSerializer < ActiveModel::Serializer
  attributes :user_id, :trail_id
  belongs_to :user
  belongs_to :trail
end
