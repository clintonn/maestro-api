class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :section_id, :image_url, :notes
end
