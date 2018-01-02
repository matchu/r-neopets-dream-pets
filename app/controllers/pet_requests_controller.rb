class PetRequestsController < ApplicationController
  before_action :require_signed_in, except: [:index]
  before_action :set_editable_pet_request, only: [:edit, :update, :destroy]
  before_action :set_attribute_collections, only: [:new, :create, :edit, :update]

  # GET /pet_requests
  # GET /pet_requests.json
  def index
    all_pet_requests = PetRequest.
      includes(:creator, :conversion_state, :species, :color, :minimum_name_quality).
      joins(:species, :color, :conversion_state).
      order('conversion_states.name, species.name, colors.name, pet_requests.created_at')
    
    @recent_pet_requests = []
    @older_pet_requests = []
    all_pet_requests.each do |pet_request|
      if pet_request.updated_at >= 1.year.ago
        @recent_pet_requests << pet_request
      else
        @older_pet_requests << pet_request
      end
    end
  end

  # GET /pet_requests/new
  def new
    @pet_request = current_user.pet_requests.build
  end

  # GET /pet_requests/1/edit
  def edit
  end

  # POST /pet_requests
  # POST /pet_requests.json
  def create
    @pet_request = current_user.pet_requests.build(pet_request_params)

    respond_to do |format|
      if @pet_request.save
        format.html { redirect_to pet_requests_path, notice: 'Pet request was successfully created.' }
        format.json { render :show, status: :created, location: @pet_request }
        PostInDiscordJob.perform_later(@pet_request)
      else
        format.html { render :new }
        format.json { render json: @pet_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_requests/1
  # PATCH/PUT /pet_requests/1.json
  def update
    respond_to do |format|
      if @pet_request.update(pet_request_params)
        format.html { redirect_to pet_requests_path, notice: 'Pet request was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet_request }
      else
        format.html { render :edit }
        format.json { render json: @pet_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_requests/1
  # DELETE /pet_requests/1.json
  def destroy
    @pet_request.destroy
    respond_to do |format|
      format.html { redirect_to pet_requests_path, notice: 'Pet request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editable_pet_request
      @pet_request = current_user.editable_pet_requests.find(params[:id])
    end

    def set_attribute_collections
      @species = Species.order(:name)
      @colors = Color.order(:name)
      @conversion_states = ConversionState.order(:name)
      @name_qualities = NameQuality.sorted
    end

    def require_signed_in
      unless user_signed_in?
        redirect_to pet_requests_path, alert: 'Please sign in to request dream pets'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_request_params
      params.require(:pet_request).permit(:species_id, :color_id, :conversion_state_id, :minimum_name_quality_id, :info, :requires_clothes)
    end
end
