class ConcoctionTypesController < ApplicationController
  before_action :set_concoction_type, only: %i[show edit update destroy]

  # GET /concoction_types
  def index
    @concoction_types = ConcoctionType.all.order :name
  end

  # GET /concoction_types/1
  def show
  end

  # GET /concoction_types/new
  def new
    @concoction_type = ConcoctionType.new
  end

  # GET /concoction_types/1/edit
  def edit
  end

  # POST /concoction_types
  def create
    @concoction_type = ConcoctionType.new(concoction_type_params)

    if @concoction_type.save
      redirect_to @concoction_type,
        notice: 'Concoction type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /concoction_types/1
  def update
    if @concoction_type.update(concoction_type_params)
      redirect_to @concoction_type,
        notice: 'Concoction type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /concoction_types/1
  def destroy
    @concoction_type.destroy
    redirect_to concoction_types_url,
      notice: 'Concoction type was successfully destroyed.'
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
