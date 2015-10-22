module RecipesHelper
  # @param ingredient [Ingredient]
  # @return [String]
  def ingredient_line_item(ingredient)
    rel = ingredient.rels.first

    "#{rel.quantity} #{rel.quantity_unit} #{ingredient.name}".strip
  end
end
