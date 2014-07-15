class Recipe
  include Neo4j::ActiveNode

  property :title
  validates :title, presence: true
  index :title

  property :description
  validates :description, presence: true

  property :directions
  validates :directions, presence: true

  property :concoction_type
  validates :concoction_type, presence: true
  index :concoction_type

  property :yields
  property :created_at
  property :updated_at
end
