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
end
