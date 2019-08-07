class VolunteerProfilesController < ApplicationController


  before_action :set_volunteer_profile, only: [:show, :edit, :update, :destroy]

# GET /volunteer_profiles
# GET /volunteer_profiles.json
def index
  @volunteer_profiles = VolunteerProfile.all
end


# GET /volunteer_profiles/1
# GET /volunteer_profiles/1.json
def show
end

def location
end


# GET /volunteer_profiles/new
def new
  @volunteer_profile = VolunteerProfile.new
end

# GET /volunteer_profiles/1/edit
def edit
end

# POST /volunteer_profiles
# POST /volunteer_profiles.json
def create
  @volunteer_profile = VolunteerProfile.new(volunteer_profile_params)

  respond_to do |format|
    if @volunteer_profile.save
      format.html { redirect_to @volunteer_profile, notice: 'Volunteer Profile was successfully created.' }
      format.json { render :show, status: :created, location: @volunteer_profile }
    else
      format.html { render :new }
      format.json { render json: @volunteer_profile.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /volunteer_profiles/1
# PATCH/PUT /volunteer_profiles/1.json
def update
  respond_to do |format|
    if @volunteer_profile.update(volunteer_profile_params)
      format.html { redirect_to @volunteer_profile, notice: 'Volunteer Profile was successfully updated.' }
      format.json { render :show, status: :ok, location: @volunteer_profile }
    else
      format.html { render :edit }
      format.json { render json: @volunteer_profile.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /volunteer_profiles/1
# DELETE /volunteer_profiles/1.json
def destroy
  @volunteer_profile.destroy
  respond_to do |format|
    format.html { redirect_to volunteer_profiles_url, notice: 'Volunteer profile was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_volunteer_profile
    @volunteer_profile = VolunteerProfile.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def volunteer_profile_params
    params.require(:volunteer_profile).permit(:tagline)
  end
end
