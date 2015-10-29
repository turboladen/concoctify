import DS from 'ember-data';

export default DS.Model.extend({
  quantity: DS.attr('number'),
  quantityUnit: DS.attr('string'),

  ingredient: DS.belongsTo('ingredient')
});
