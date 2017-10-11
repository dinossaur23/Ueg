class UevsController < ApplicationController
  before_action :set_uev, only: [:show, :edit, :update, :destroy]

  # GET /uevs
  # GET /uevs.json
  def index
    @uevs = Uev.all
  end

  # GET /uevs/1
  # GET /uevs/1.json
  def show
  end

  # GET /uevs/new
  def new
    @uev = Uev.new
  end

  # GET /uevs/1/edit
  def edit
  end

  # POST /uevs
  # POST /uevs.json
  def create
    @uev = Uev.new(uev_params)

    respond_to do |format|
      if @uev.save
        format.html { redirect_to @uev, notice: 'Uev was successfully created.' }
        format.json { render :show, status: :created, location: @uev }
      else
        format.html { render :new }
        format.json { render json: @uev.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uevs/1
  # PATCH/PUT /uevs/1.json
  def update
    respond_to do |format|
      if @uev.update(uev_params)
        format.html { redirect_to @uev, notice: 'Uev was successfully updated.' }
        format.json { render :show, status: :ok, location: @uev }
      else
        format.html { render :edit }
        format.json { render json: @uev.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uevs/1
  # DELETE /uevs/1.json
  def destroy
    @uev.destroy
    respond_to do |format|
      format.html { redirect_to uevs_url, notice: 'Uev was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uev
      @uev = Uev.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uev_params
      params.require(:uev).permit(:token)
    end
end
