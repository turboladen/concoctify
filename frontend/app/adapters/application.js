import Ember from 'ember';
import DS from 'ember-data';
import $ from 'jquery';

export default DS.JSONAPIAdapter.extend({
  headers: {
    "X-CSRF-Token": $('meta[name="csrf-token"]').attr('content')
  },
  host: 'http://concoctify.dev',
  pathForType: function(type) {
    return `${Ember.String.underscore(type)}s`;
  }
});
