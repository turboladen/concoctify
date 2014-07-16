class Recipe
  include Neo4j::ActiveNode

  property :title
  index :title
  validates :title, presence: true

  property :description
  validates :description, presence: true

  property :directions
  validates :directions, presence: true

  property :concoction_type
  index :concoction_type
  validates :concoction_type, presence: true

  property :yields
  property :created_at
  property :updated_at
end
