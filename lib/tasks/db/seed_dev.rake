namespace :db do
  desc 'Seed some development data'
  task seed_dev: :environment do
    indgredient_names = %w[Honey Brown\ Sugar
     Apricots Apples Peaches Pears Oranges Raisins
     Almond\ Extract]

    indgredient_names.each { |name| Ingredient.find_or_create_by(name: name) }
  end
end
