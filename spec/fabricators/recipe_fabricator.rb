Fabricator :recipe do
  title { Faker::Name.title }
  description { Faker::Lorem.sentence }
  directions { Faker::Lorem.paragraphs(2).join("\n") }
  concoction_type { %w[beer wine mead cider].sample }
  yields { "#{rand(1..10.0)} gallons"}
  created_at { Time.now }
  updated_at { Time.now }
end
