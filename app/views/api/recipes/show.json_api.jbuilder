json.data do
  json.id @recipe.id
  json.type @recipe.model_name.plural

  json.attributes do
    json.title @recipe.title
    json.yields @recipe.yields
    json.yields_unit @recipe.yields_unit
    json.description @recipe.description
    json.directions @recipe.directions

    json.created_at @recipe.created_at
    json.updated_at @recipe.updated_at
  end

  json.relationships do
    json.concoction_type do
      json.links do
        json.self "#{api_recipe_url(@recipe)}/relationships/concoction_type"
      end

      json.data do
        json.type @recipe.concoction_type.model_name.plural
        json.id @recipe.concoction_type.id
      end
    end

    json.ingredients(@recipe.ingredients) do |ingredient|
      json.links do
        json.self "#{api_recipe_url(@recipe)}/relationships/ingredients"
      end

      json.data(@recipe.ingredients) do
        json.type ingredient.model_name.plural
        json.id ingredient.id
      end
    end
  end
end

json.included(@includeds) do |included|
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
end
