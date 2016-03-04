namespace :db do
  desc 'Seed some development data'
  task seed_dev: :environment do
    30.times do
      r = Fabricate(:recipe)
      puts "Created #{r.concoction_type.name} recipe: #{r.title}"
    end

    recipes = Recipe.all.to_a

    50.times do
      c = Fabricate(:concoction, recipe: recipes.sample)
      puts "Created concoction: #{c.name}"
    end
  end
end
