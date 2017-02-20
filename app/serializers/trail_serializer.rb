class TrailSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category_id, :author_id, :votes, :follows
  belongs_to :author
  has_many :sections
end
