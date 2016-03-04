class ConcoctionSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :name,
    :created_at,
    :updated_at

  has_one :recipe

  def links
    {
      self: api_concoction_path(object.id),
      recipe: recipe_api_concoction_path(object.id)
    }
  end
end
