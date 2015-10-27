module RecipesHelper
  # @param ingredient [Ingredient]
  # @return [String]
  def ingredient_line_item(ingredient)
    rel = ingredient.rels.first

    "#{rel.quantity} #{rel.quantity_unit} #{ingredient.name}".strip
  end

  # @param recipe_id [String]
  # @return [Array<Array<String, String>>]
  def other_recipes_for_select(recipe_id)
    Recipe.where_not(id: recipe_id)
  end
end
