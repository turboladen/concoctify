class IngredientSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :name,
    :created_at,
    :updated_at

  # @return [Hash]
  def links
    {
      self: api_ingredient_path(object.id),
      concoction_types: {
        href: concoction_types_api_ingredient_path(object.id),
        meta: {
          count: object.concoction_types.count
        }
      },
      concoctions: {
        href: concoctions_api_ingredient_path(object.id),
        meta: {
          count: object.concoctions.count
        }
      },
      recipes: {
        href: recipes_api_ingredient_path(object.id),
        meta: {
          count: object.recipes.count
        }
      }
    }
  end
end
