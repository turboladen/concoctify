class ConcoctionType
  include Neo4j::ActiveNode

  # Properties
  property :name, type: String, constraint: :unique
  property :updated_at
  property :created_at
  index :name

  # Relationships
  has_many :in, :concoctions, origin: :concoction
  has_many :in, :recipes, origin: :recipe

  validates :name,
    presence: true,
    uniqueness: true
end
