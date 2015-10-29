class RecipeSerializer < ActiveModel::Serializer
  attributes :description,
    :directions,
    :title,
    :yields,
    :yields_unit

  has_many :ingredients
  has_many :needs_ingredients
  has_one :concoction_type

  def needs_ingredients
    h = ActiveModel::SerializableResource.new(object.ingredients.rels).serializable_hash[:data]
    h.map do |ni|
      { needs_ingredient: ni }
    end
  end
end
