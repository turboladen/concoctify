class IngredientSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :name,
    :created_at,
    :updated_at

  def links
    {
      self: api_ingredient_path(object.id),
      concoction_types: concoction_types_api_ingredient_path(object.id),
      concoctions: concoctions_api_ingredient_path(object.id),
      recipes: recipes_api_ingredient_path(object.id)
    }
  end
end
