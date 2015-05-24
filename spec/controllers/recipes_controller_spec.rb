require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe RecipesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Recipe. As you add validations to Recipe, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    Fabricate.attributes_for :recipe
  end

  let(:invalid_attributes) do
    { title: '', description: '', directions: '', concoction_type: '' }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RecipesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all recipes as @recipes' do
      recipe = Recipe.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:recipes)).to eq([recipe])
    end
  end

  describe 'GET show' do
    it 'assigns the requested recipe as @recipe' do
      recipe = Recipe.create! valid_attributes
      get :show, { id: recipe.to_param }, valid_session
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe 'GET new' do
    it 'assigns a new recipe as @recipe' do
      get :new, {}, valid_session
      expect(assigns(:recipe)).to be_a_new(Recipe)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested recipe as @recipe' do
      recipe = Recipe.create! valid_attributes
      get :edit, { id: recipe.to_param }, valid_session
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Recipe' do
        expect do
          post :create, { recipe: valid_attributes }, valid_session
        end.to change(Recipe, :count).by(1)
      end

      it 'assigns a newly created recipe as @recipe' do
        post :create, { recipe: valid_attributes }, valid_session
        expect(assigns(:recipe)).to be_a(Recipe)
        expect(assigns(:recipe)).to be_persisted
      end

      it 'redirects to the created recipe' do
        post :create, { recipe: valid_attributes }, valid_session
        expect(response).to redirect_to(Recipe.last)
      end
    end

    describe 'with invalid params' do
      before do
        post :create, { recipe: invalid_attributes }, valid_session
      end

      it 'assigns a newly created but unsaved recipe as @recipe' do
        expect(assigns(:recipe)).to be_a_new(Recipe)
      end

      it "re-renders the 'new' template" do
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    let(:recipe) do
      Recipe.create! valid_attributes
    end

    describe 'with valid params' do
      let(:new_attributes) do
        Fabricate.attributes_for :recipe
      end

      before do
        put :update, { id: recipe.to_param, recipe: new_attributes }, valid_session
      end

      it 'updates the requested recipe' do
        recipe.reload
        expect(recipe.attributes).to eq('title' => new_attributes[:title],
                                        'description' => new_attributes[:description],
                                        'directions' => new_attributes[:directions],
                                        'concoction_type' => new_attributes[:concoction_type],
                                        'yields' => nil,
                                        'created_at' => recipe.created_at,
                                        'updated_at' => recipe.updated_at)
      end

      it 'assigns the requested recipe as @recipe' do
        expect(assigns(:recipe)).to eq(recipe)
      end

      it 'redirects to the recipe' do
        expect(response).to redirect_to(recipe)
      end
    end

    describe 'with invalid params' do
      before do
        put :update, { id: recipe.to_param, recipe: invalid_attributes }, valid_session
      end

      it 'assigns the recipe as @recipe' do
        expect(assigns(:recipe)).to eq(recipe)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:recipe) do
      recipe = Recipe.create! valid_attributes
    end

    it 'destroys the requested recipe' do
      expect do
        delete :destroy, { id: recipe.to_param }, valid_session
      end.to change(Recipe, :count).by(-1)
    end

    it 'redirects to the recipes list' do
      delete :destroy, { id: recipe.to_param }, valid_session
      expect(response).to redirect_to(recipes_url)
    end
  end
end
