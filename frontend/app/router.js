import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('ingredients');
  this.route('concoction-types');
  this.route('recipes');
});

export default Router;
