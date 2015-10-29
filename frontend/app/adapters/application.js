import DS from 'ember-data';

export default DS.JSONAPIAdapter.extend({
  host: 'http://concoctify.dev',
  pathForType: function(type) {
    return `${Ember.String.underscore(type)}s`;
  }
});
