json.links do
  json.self api_recipes_url
end

json.data(@recipes) do |recipe|
  json.partial! 'recipe', recipe: recipe
end

json.included(@recipes) do |recipe|
  json.array! recipe.includeds, partial: 'api/recipes/includeds', as: :included, locals: { recipe: recipe }
end
