json.data do
  json.partial! 'recipe', recipe: @recipe
end

json.included @recipe.includeds, partial: 'includeds',
  as: :included,
  locals: { recipe: @recipe }
