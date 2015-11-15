json.attributes { json.name ingredient.name }
json.links { json.self api_ingredient_url(ingredient) }

json.relationships do
  json.needs_ingredient do
    json.data do
      json.id ingredient.id
      json.type ingredient.rels.first.model_name.plural
    end
  end

  json.recipe do
    json.data do
      json.id recipe.id
      json.type 'recipes'
    end
  end
end
