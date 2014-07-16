Fabricator :recipe do
  title { Faker::Name.title }
  description { Faker::Lorem.sentence }
  directions { Faker::Lorem.paragraphs(2).join("\n") }
  concoction_type { %w[beer wine mead cider].sample }
end

Fabricator :recipe_with_extras, from: :recipe do
  yields { "#{rand(1..10.0)} gallons"}
end
