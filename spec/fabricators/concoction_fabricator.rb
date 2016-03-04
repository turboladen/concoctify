Fabricator :concoction do
  name { Faker::Commerce.product_name }
end

Fabricator :concoction_with_extras, from: :concoction do
  recipe
end
