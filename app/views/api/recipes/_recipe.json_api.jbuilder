json.id recipe.id
json.type recipe.model_name.plural

json.attributes do
  json.title recipe.title
  json.yields recipe.yields
  json.yields_unit recipe.yields_unit
  json.description recipe.description
  json.directions recipe.directions

  json.created_at recipe.created_at
  json.updated_at recipe.updated_at
end

json.relationships do
  json.concoction_type do
    json.data do
      json.type 'concoction_types'
      json.id recipe.concoction_type.try(:id)
      json.attributes { json.name recipe.concoction_type.try(:name) }
    end
  end

  json.ingredients(recipe.ingredients) do |ingredient|
    json.data(recipe.ingredients) do
      json.type ingredient.model_name.plural
      json.id ingredient.id
    end
  end
end

json.links { json.self api_recipe_url(recipe) }
