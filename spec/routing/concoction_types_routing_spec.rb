require 'rails_helper'

RSpec.describe ConcoctionTypesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/concoction_types').to route_to('concoction_types#index')
    end

    it 'routes to #new' do
      expect(get: '/concoction_types/new').to route_to('concoction_types#new')
    end

    it 'routes to #show' do
      expect(get: '/concoction_types/1').to route_to('concoction_types#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/concoction_types/1/edit').to route_to('concoction_types#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/concoction_types').to route_to('concoction_types#create')
    end

    it 'routes to #update' do
      expect(put: '/concoction_types/1').to route_to('concoction_types#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/concoction_types/1').to route_to('concoction_types#destroy', id: '1')
    end
  end
end
