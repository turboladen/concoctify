class NeedsIngredient
  include Neo4j::ActiveRel
  include Neo4j::Timestamps

  from_class :any
  to_class Ingredient
  type 'needs_ingredient'

  property :quantity, type: Float
  property :quantity_unit, type: String

  validates :quantity, presence: true
  validates :quantity_unit, presence: true
end
