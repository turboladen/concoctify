import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('list-ingredients', { path: '/ingredients' });
  this.route('list-concoction-types', { path: '/concoction_types' });
  this.route('list-recipes', { path: '/recipes' });
  this.route('show-recipe', { path: '/recipes/:recipe_id' });
});

export default Router;
