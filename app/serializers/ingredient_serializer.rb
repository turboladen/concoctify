class IngredientSerializer < ActiveModel::Serializer
  attributes :name,
    :quantity,
    :quantity_unit

  def quantity
    object.rels.first.quantity
  end

  def quantity_unit
    object.rels.first.quantity_unit
  end
end
