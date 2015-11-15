json.attributes do
  json.quantity needs_ingredient.quantity
  json.quantity_unit needs_ingredient.quantity_unit
end

json.relationships do
  json.ingredient do
    json.data do
      json.id needs_ingredient.to_node.id
      json.type needs_ingredient.to_node.model_name.plural
    end
  end

  json.recipe do
    json.data do
      json.id recipe.id
      json.type 'recipes'
    end
  end
end
