class ConcoctionTypeSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :name,
    :created_at,
    :updated_at

  # @return [Hash]
  def links
    {
      self: api_concoction_type_path(object.id),
      concoctions: {
        href: concoctions_api_concoction_type_path(object.id),
        meta: {
          count: object.concoctions.count
        }
      },
      ingredients: {
        href: ingredients_api_concoction_type_path(object.id),
        meta: {
          count: object.ingredients.count
        }
      },
      recipes: {
        href: recipes_api_concoction_type_path(object.id),
        meta: {
          count: object.recipes.count
        }
      }
    }
  end
end
