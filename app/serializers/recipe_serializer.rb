class RecipeSerializer < ActiveModel::Serializer
  attributes :title,
    :description,
    :directions,
    :yields,
    :yields_unit,
    :created_at,
    :updated_at

  has_one :concoction_type
end
