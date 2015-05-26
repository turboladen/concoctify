class Recipe
  include Neo4j::ActiveNode

  # Properties
  property :title, type: String
  property :description, type: String
  property :directions, type: String
  property :yields, type: Float
  property :yields_unit, type: String
  property :created_at
  property :updated_at

  index :title

  # Relationships
  has_one :out, :concoction_type, type: 'MAKES_CONCOCTION_TYPE'
  has_many :in, :concoctions, type: 'BASED_ON_RECIPE'
  has_many :out, :ingredients, rel_class: NeedsIngredient

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :directions, presence: true
  # TODO: Can't figure out how to validate this.
  # validates :concoction_type, presence: true
end
