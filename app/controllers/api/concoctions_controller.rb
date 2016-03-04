module Api
  class ConcoctionsController < ApplicationController
    include ControllerPaging

    before_action :set_concoction,
      only: %i[show edit update destroy
               recipe influencing_recipes concoction_type ingredients
    ]

    # GET /concoctions
    def index
      @concoctions = paginate(Concoction.all)

      render json: @concoctions, content_type: 'application/vnd.json+api'
    end

    # GET /concoctions/1
    def show
      render json: @concoction, include: %w[recipe]
    end

    # GET /concoctions/1/recipe
    def recipe
      render json: @concoction.recipe
    end

    # GET /concoctions/new
    def new
      @concoction = Concoction.new
    end

    # POST /concoctions
    def create
      @concoction = Concoction.new(concoction_params)

      if @concoction.save
        redirect_to @concoction, notice: 'Concoction was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /concoctions/1
    def update
      if @concoction.update(concoction_params)
        redirect_to @concoction, notice: 'Concoction was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /concoctions/1
    def destroy
      @concoction.destroy
      redirect_to concoctions_url,
        notice: 'Concoction was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_concoction
      @concoction = Concoction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def concoction_params
      params[:concoction]
    end
  end
end
