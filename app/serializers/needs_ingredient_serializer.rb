class NeedsIngredientSerializer < ActiveModel::Serializer
  attributes :quantity,
    :quantity_unit

  has_one :ingredient
end
