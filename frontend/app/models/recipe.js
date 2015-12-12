import DS from 'ember-data';

export default DS.Model.extend({
  createdAt: DS.attr('date'),
  description: DS.attr('string'),
  directions: DS.attr('string'),
  title: DS.attr('string'),
  updatedAt: DS.attr('date'),
  yields: DS.attr('number'),
  yieldsUnit: DS.attr('string'),

  concoctionType: DS.belongsTo('concoctionType', { async: false }),
  influencingRecipes: DS.hasMany('recipe', { async: true }),
  needsIngredients: DS.hasMany('needsIngredient', { async: false })
});
