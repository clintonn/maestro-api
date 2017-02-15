class SectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :trail_id
  has_many :resources
end
