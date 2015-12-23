module Api
  class ConcoctionTypesController < ApplicationController
    include ControllerPaging

    before_action :set_concoction_type,
      only: %i[show edit update destroy
               recipes concoctions ingredients]

    # GET /concoction_types
    def index
      @concoction_types = paginate(ConcoctionType.all, default_sort_by: :name)

      render json: @concoction_types, content_type: 'application.vnd.json+api'
    end

    # GET /concoction_types/1
    def show
      render json: @concoction_type
    end

    # GET /concoction_types/1/recipes
    def recipes
      render json: paginate(@concoction_type.recipes)
    end

    # GET /concoction_types/1/concoctions
    def concoctions
      render json: paginate(@concoction_type.concoctions)
    end

    # GET /concoction_types/1/ingredients
    def ingredients
      render json: paginate(@concoction_type.ingredients)
    end

    # GET /concoction_types/new
    def new
      @concoction_type = ConcoctionType.new

      respond_with @concoction_type
    end

    # POST /concoction_types
    def create
      @concoction_type = ConcoctionType.new(concoction_type_params)

      if @concoction_type.save
        render json: @concoction_type, location: api_concoction_type_url(@concoction_type), status: :created
      else
        render json: @concoction_type.errors
      end
    end

    # PATCH/PUT /concoction_types/1
    def update
      @concoction_type.update(concoction_type_params)

      respond_with @concoction_type
    end

    # DELETE /concoction_types/1
    def destroy
      if @concoction_type.destroy
        head :no_content
      else
        render json: @concoction_type.errors
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_concoction_type
      @concoction_type = ConcoctionType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def concoction_type_params
      data_params.require(:attributes).permit(:name)
    end
  end
end
