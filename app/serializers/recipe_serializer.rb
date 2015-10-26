class RecipeSerializer < ActiveModel::Serializer
  attributes :concoction_type,
    :created_at,
    :description,
    :directions,
    :title,
    :updated_at,
    :yields,
    :yields_unit

  has_many :ingredients

  def concoction_type
    object.concoction_type.try(:name)
  end
end
