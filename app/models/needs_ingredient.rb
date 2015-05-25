class NeedsIngredient
  include Neo4j::ActiveRel

  from_class :any
  to_class Ingredient
  type 'needs_ingredient'

  property :quantity, type: Float
  property :quantity_unit, type: String
  property :created_at
  property :updated_at

  validates :quantity, presence: true
  validates :quantity_unit, presence: true
end
