namespace :db do
  task seed: :environment do
    make_concoction_types
    make_ingredients
  end

  def make_concoction_types
    fermented_types = %w[
      Beer Cauim Chicha Cider Huangjiu Icariine
      Kasiri Kilju Kumis Mead Nihamanchi Pulque Parakari Sakurá Sake Sonti
      Tepache Tonto Tiswin Wine
      ]

    distilled_types = %w[Liqueur Spirit]
    concoction_type_names = fermented_types + distilled_types

    concoction_type_names.each do |name|
      puts "Finding or creating concoction type: #{name}"
      ConcoctionType.find_or_create_by name: name
    end
  end

  def make_ingredients
    indgredient_names = %w[Honey Brown\ Sugar
     Apricots Apples Peaches Pears Oranges Raisins
     Almond\ Extract]

    indgredient_names.each do |name|
      puts "Finding or creating ingredient: #{name}"
      Ingredient.find_or_create_by(name: name)
    end
  end
end
