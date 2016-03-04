require 'rails_helper'

RSpec.describe Api::NeedsIngredientsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/needs_ingredients').to route_to('api/needs_ingredients#index')
    end

    it 'routes to #new' do
      expect(get: '/api/needs_ingredients/new').to route_to('api/needs_ingredients#new')
    end

    it 'routes to #show' do
      expect(get: '/api/needs_ingredients/1').to route_to('api/needs_ingredients#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/api/needs_ingredients/1/edit').to route_to('api/needs_ingredients#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/needs_ingredients').to route_to('api/needs_ingredients#create')
    end

    it 'routes to #update' do
      expect(put: '/api/needs_ingredients/1').to route_to('api/needs_ingredients#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/needs_ingredients/1').to route_to('api/needs_ingredients#destroy', id: '1')
    end
  end
end
