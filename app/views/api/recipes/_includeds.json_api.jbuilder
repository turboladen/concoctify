json.type included.model_name.plural
json.id included.id

case included
when ConcoctionType
  json.partial! 'concoction_type', locals: {
    concoction_type: included,
    recipe: recipe
  }
when Ingredient
  json.partial! 'ingredient', locals: {
    ingredient: included,
    recipe: recipe
  }
when NeedsIngredient
  json.partial! 'needs_ingredient', locals: {
    needs_ingredient: included,
    recipe: recipe
  }
end
