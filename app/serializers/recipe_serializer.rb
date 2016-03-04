class RecipeSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :title,
    :description,
    :directions,
    :yields,
    :yields_unit,
    :created_at,
    :updated_at

  has_one :concoction_type
  has_many :ingredients
  has_many :needs_ingredients

  def ingredients
    # Have to call #to_a here to avoid NoMethodError on #model_name
    object.ingredients.to_a
  end

  def needs_ingredients
    object.ingredients.rels
  end

  # @return [Hash]
  def links
    {
      self: api_recipe_path(object.id),
      concoction_type: concoction_type_api_recipe_path(object.id),
      concoctions: {
        href: concoctions_api_recipe_path(object.id),
        meta: {
          count: object.concoctions.count
        }
      },
      influencing_recipes: {
        href: influencing_recipes_api_recipe_path(object.id),
        meta: {
          count: object.influencing_recipes.count
        }
      },
      ingredients: {
        href: ingredients_api_recipe_path(object.id),
        meta: {
          count: object.ingredients.count
        }
      }
    }
  end
end
