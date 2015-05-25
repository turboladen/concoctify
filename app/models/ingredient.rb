class Ingredient
  include Neo4j::ActiveNode

  # Properties
  property :name
  index :name
  property :updated_at
  property :created_at

  # Relationships
  has_many :in, :recipes, rel_class: NeedsIngredient
  has_many :in, :concoctions, rel_class: NeedsIngredient

  # Validations
  validates :name, presence: true, uniqueness: true
end
