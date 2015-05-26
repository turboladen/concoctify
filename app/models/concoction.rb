class Concoction
  include Neo4j::ActiveNode

  # Properties
  property :title, type: String
  property :updated_at
  property :created_at

  # Relationships
  has_one :out, :concoction_type, type: 'MAKES_CONCOCTION_TYPE'
  has_one :out, :recipe, type: 'BASED_ON_RECIPE'
  has_many :out, :ingredients, rel_class: NeedsIngredient

  validates :title, presence: true
end
