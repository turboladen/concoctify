class Recipe
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  # Properties
  property :title,        type: String, index: :exact
  property :description,  type: String
  property :directions,   type: String
  property :yields,       type: Float
  property :yields_unit,  type: String

  # Relationships
  has_one :out, :concoction_type,
    type: :MAKES_CONCOCTION_TYPE

  has_many :in, :concoctions,
    type: :USES_RECIPE

  has_many :both, :influencing_recipes,
    type: :INFLUENCING_RECIPE,
    model_class: :Recipe

  has_many :out, :ingredients,
    rel_class: :NeedsIngredient

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :directions, presence: true
  # TODO: Can't figure out how to validate this.
  # validates :concoction_type, presence: true
end
