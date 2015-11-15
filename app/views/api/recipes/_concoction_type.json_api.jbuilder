json.attributes { json.name concoction_type.name }
json.links { json.self api_concoction_type_url(concoction_type) }

json.relationships do
  json.recipe do
    json.data do
      json.id recipe.id
      json.type 'recipes'
    end
  end
end
