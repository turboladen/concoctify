json.type included.model_name.plural
json.id included.id

case included
when ConcoctionType
  json.attributes { json.name included.name }
  json.links { json.self api_concoction_type_url(included) }
when Ingredient
  json.attributes { json.name included.name }
  json.links { json.self api_ingredient_url(included) }
when NeedsIngredient
  json.attributes do
    json.quantity included.quantity
    json.quantity_unit included.quantity_unit
  end

  json.relationships do
    json.ingredient do
      json.data do
        json.type included.to_node.model_name.plural
        json.id included.to_node.id
      end
    end
  end
end
