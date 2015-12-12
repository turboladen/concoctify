module Api
  class ConcoctionTypesController < ApplicationController
    before_action :set_concoction_type, only: %i[show edit update destroy]

    # GET /concoction_types
    def index
      @concoction_types = ConcoctionType.all.order :name

      respond_with @concoction_types
    end

    # GET /concoction_types/1
    def show
      respond_with @concoction_type
    end

    # GET /concoction_types/new
    def new
      @concoction_type = ConcoctionType.new

      respond_with @concoction_type
    end

    # POST /concoction_types
    def create
      @concoction_type = ConcoctionType.create(concoction_type_params)

      respond_with @concoction_type
    end

    # PATCH/PUT /concoction_types/1
    def update
      @concoction_type.update(concoction_type_params)

      respond_with @concoction_type
    end

    # DELETE /concoction_types/1
    def destroy
      @concoction_type.destroy

      respond_with @concoction_type
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_concoction_type
      @concoction_type = ConcoctionType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def concoction_type_params
      params.require(:concoction_type).permit(:name)
    end
  end
end
