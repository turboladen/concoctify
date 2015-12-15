class Api::NeedsIngredientsController < ApplicationController
  include ControllerPaging

  before_action :set_needs_ingredient, only: [:show, :update, :destroy]

  # GET /needs_ingredients.json
  def index
    @needs_ingredients = NeedsIngredient.all

    render json: @needs_ingredients
  end

  # GET /needs_ingredients/1.json
  def show
    render json: @needs_ingredient
  end

  # POST /needs_ingredients.json
  def create
    @needs_ingredient = NeedsIngredient.new(needs_ingredient_params)

    if @needs_ingredient.save
      render json: @needs_ingredient, status: :created, location: @needs_ingredient
    else
      render json: @needs_ingredient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /needs_ingredients/1.json
  def update
    @needs_ingredient = NeedsIngredient.find(params[:id])

    if @needs_ingredient.update(needs_ingredient_params)
      head :no_content
    else
      render json: @needs_ingredient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /needs_ingredients/1.json
  def destroy
    @needs_ingredient.destroy

    head :no_content
  end

  private

  def set_needs_ingredient
    @needs_ingredient = NeedsIngredient.find(params[:id])
  end

  def needs_ingredient_params
    params[:needs_ingredient]
  end
end
