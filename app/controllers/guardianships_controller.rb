class GuardianshipsController < ApplicationController
  before_action :set_guardianship, only: [:end, :show, :edit, :update, :destroy]

  # GET /guardianships
  # GET /guardianships.json
  def index
    @guardianships = Guardianship.where(endtime: nil)
    if user_signed_in?
      @user_guardianship = Guardianship.where(user_id: current_user.id).where(endtime: nil).take
    end
  end

  # GET /guardianships/1
  # GET /guardianships/1.json
  def show

  end

  # GET /guardianships/new
  def new
    if user_signed_in?
      @guardianship = Guardianship.new

    else
      redirect_to new_user_session_path
    end
  end

  # GET /guardianships/1/edit
  def edit
  end

  def end
    if current_user.id == @guardianship.user_id
      @guardianship.endtime = DateTime.now
      respond_to do |format|
        if @guardianship.save
          format.html { redirect_to @guardianship, notice: 'Hienosti poistuttu.' }
          format.json { render :show, status: :created, location: @guardianship }
        else
          format.html { render :new }
          format.json { render json: @guardianship.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:alert] = "Jäbä koittaa lopettaa muiden vastuun."
    end
  end

  # POST /guardianships
  # POST /guardianships.json
  def create
    @guardianship = Guardianship.new(guardianship_params)
    @guardianship.user_id = current_user.id

    respond_to do |format|
      if @guardianship.save
        format.html { redirect_to root_path, notice: 'Guardianship was successfully created.' }
        format.json { render :show, status: :created, location: @guardianship }
      else
        format.html { render root }
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
