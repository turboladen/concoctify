json.links do
  json.self api_recipes_url
end

json.data(@recipes) do |recipe|
  json.partial! 'recipe', recipe: recipe
end

json.included @includeds, partial: 'includeds', as: :included
