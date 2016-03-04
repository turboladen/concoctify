class Ingredient
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  # Properties
  property :name, constraint: :unique

  # Relationships
  has_many :in, :recipes, rel_class: NeedsIngredient

  # Validations
  validates :name,
    presence: true,
    uniqueness: true

  def concoction_types
    recipes.map(&:concoction_type).uniq
  end

  def concoctions
    recipes.flat_map do |recipe|
      recipe.concoctions.to_a
    end.uniq
  end
end
