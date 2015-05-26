require_relative '../support/fabricator_help'

Fabricator :recipe do

  title { Faker::Name.title }
  description { Faker::Lorem.sentence }
  directions { Faker::Lorem.paragraphs(2).join("\n") }
  yields { rand(1..15) }
  yields_unit 'gallons'

  after_create do |recipe, _|
    FabricatorHelp.make_concoction_type(recipe)
    3.times { FabricatorHelp.make_ingredient(recipe) }
    recipe.save!
  end
end

Fabricator :recipe_with_extras, from: :recipe do
  yields { "#{rand(1..10.0)} gallons" }
end
