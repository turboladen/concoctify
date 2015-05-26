Fabricator :concoction do
  title { Faker::Commerce.product_name }

  after_create do |concoction, _|
    FabricatorHelp.make_concoction_type(concoction)
    3.times { FabricatorHelp.make_ingredient(concoction) }
  end
end

Fabricator :concoction_with_extras, from: :concoction do
  recipe
end
