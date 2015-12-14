class ConcoctionSerializer < ActiveModel::Serializer
  attributes :name,
    :created_at,
    :updated_at

  has_one :recipe
end
