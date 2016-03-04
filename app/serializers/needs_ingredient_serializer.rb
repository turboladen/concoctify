class NeedsIngredientSerializer < ActiveModel::Serializer
  attributes :quantity,
    :quantity_unit

  has_one :ingredient
  has_one :recipe

  def recipe
    object.from_node
  end
end
