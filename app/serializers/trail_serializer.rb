class TrailSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category_id, :author_id
  belongs_to :author
end
