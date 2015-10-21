class Concoction
  include Neo4j::ActiveNode
  include Neo4j::Timestamps

  # Properties
  property :name, type: String

  # Relationships
  has_one :out, :concoction_type,
    type: :MAKES_CONCOCTION_TYPE

  has_one :out, :recipe,
    type: :USES_RECIPE

  validates :name, presence: true
end
