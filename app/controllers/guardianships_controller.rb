class GuardianshipsController < ApplicationController
  before_action :set_guardianship, only: [:show, :edit, :update, :destroy]

  # GET /guardianships
  # GET /guardianships.json
  def index
    @guardianships = Guardianship.all
  end

  # GET /guardianships/1
  # GET /guardianships/1.json
  def show

  end

  # GET /guardianships/new
  def new
    @guardianship = Guardianship.new
  end

  # GET /guardianships/1/edit
  def edit
  end

  # POST /guardianships
  # POST /guardianships.json
  def create
    @guardianship = Guardianship.new(guardianship_params)

    respond_to do |format|
      if @guardianship.save
        format.html { redirect_to @guardianship, notice: 'Guardianship was successfully created.' }
        format.json { render :show, status: :created, location: @guardianship }
      else
        format.html { render :new }
        format.json { render json: @guardianship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guardianships/1
  # PATCH/PUT /guardianships/1.json
  def update
    respond_to do |format|
      if @guardianship.update(guardianship_params)
        format.html { redirect_to @guardianship, notice: 'Guardianship was successfully updated.' }
        format.json { render :show, status: :ok, location: @guardianship }
      else
        format.html { render :edit }
        format.json { render json: @guardianship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guardianships/1
  # DELETE /guardianships/1.json
  def destroy
    @guardianship.destroy
    respond_to do |format|
      format.html { redirect_to guardianships_url, notice: 'Guardianship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guardianship
      @guardianship = Guardianship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guardianship_params
      params.require(:guardianship).permit(:endtime)
    end
end
