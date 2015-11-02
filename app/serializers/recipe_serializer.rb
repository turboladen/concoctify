class RecipeSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :created_at,
    :description,
    :directions,
    :links,
    :title,
    :updated_at,
    :yields,
    :yields_unit

  has_many :ingredients
  has_many :needs_ingredients
  has_one :concoction_type

  def needs_ingredients
    h = ActiveModel::SerializableResource.new(object.ingredients.rels).serializable_hash[:data]

    h.map { |ni| { needs_ingredient: ni } }
  end

  def links
    {
      influencing_recipes: influencing_recipes_api_recipe_url(object)
    }
  end

  def concoction_type
    return unless object.concoction_type

    ActiveModel::SerializableResource.new(object.concoction_type).serializable_hash[:data]
  end
end
