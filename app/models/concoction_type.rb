class ConcoctionType
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  # Properties
  property :name, type: String, constraint: :unique

  # Relationships
  has_many :in, :recipes, type: :MAKES_CONCOCTION_TYPE

  validates :name,
    presence: true,
    uniqueness: true

  def concoctions
    recipes.flat_map { |recipe| recipe.concoctions.uniq.to_a }
  end

  def ingredients
    recipes.flat_map { |recipe| recipe.ingredients.uniq.to_a }
  end
end
