json.data do
  json.partial! 'recipe', recipe: @recipe
end

json.included @includeds, partial: 'includeds', as: :included
