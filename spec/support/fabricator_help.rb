module FabricatorHelp
  # @param [Recipe, Concoction] parent
  # @return [NeedsIngredient]
  def self.make_ingredient(parent)
    ingredient =
      if Ingredient.count < 10
        Fabricate(:ingredient)
      else
        Ingredient.all.to_a.sample
      end

    Fabricate(:needs_ingredient, from_node: parent, to_node: ingredient)
  end

  # @param [Recipe, Concoction] parent
  # @return [ConcoctionType]
  def self.make_concoction_type(parent)
    parent.concoction_type =
      if ConcoctionType.count < 10
        Fabricate(:concoction_type)
      else
        ConcoctionType.all.to_a.sample
      end
  end
end
