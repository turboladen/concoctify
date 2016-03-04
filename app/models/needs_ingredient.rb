# frozen_string_literal: true
class NeedsIngredient
  include Neo4j::ActiveRel
  include Neo4j::Timestamps

  from_class :any
  to_class Ingredient
  type 'needs_ingredient'.freeze

  property :quantity, type: Float
  property :quantity_unit, type: String

  validates :quantity, presence: true
  validates :quantity_unit, presence: true

  def ingredient
    to_node
  end
end
