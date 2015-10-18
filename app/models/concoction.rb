class Concoction
  include Neo4j::ActiveNode

  # Properties
  property :title, type: String
  property :created_at
  property :updated_at

  # Relationships
  has_one :out, :concoction_type, type: :makes_concoction_type
  has_one :out, :recipe, type: :based_on_recipe
  has_many :out, :ingredients, rel_class: NeedsIngredient

  validates :title, presence: true
end
