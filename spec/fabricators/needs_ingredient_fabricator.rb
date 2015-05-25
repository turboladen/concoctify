Fabricator :needs_ingredient do
  quantity { rand(1..50) }
  quantity_unit { %w[lbs teaspoons tablespoons gallons litres cups ounces].sample }
  from_node { Fabricate(%i[concoction].sample) }
  to_node { Fabricate(:ingredient) }
end
