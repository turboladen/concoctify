class RecipeSerializer < ActiveModel::Serializer
  attributes :title,
    :description,
    :directions,
    :yields,
    :yields_unit,
    :created_at,
    :updated_at

  has_one :concoction_type
  has_many :ingredients
  has_many :needs_ingredients

  def ingredients
    # Have to call #to_a here to avoid NoMethodError on #model_name
    object.ingredients.to_a
  end

  def needs_ingredients
    object.ingredients.rels
  end
end
