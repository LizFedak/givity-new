class ExperiencesController < ApplicationController

  before_action :authenticate_user!, :except => [:show, :index]
  before_action :set_experience, :only => [:show, :edit, :update, :destroy]
  

  def my_index
    @experiences = current_user.experiences
  end

  def index
    @experiences = Experience.all
  end

  def show
  end



  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)

    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @experience }
      else
        format.html { render :new }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
  end

  def location
  end


  def edit
  end


  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to @experience, notice: 'Your experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience }
      else
        format.html { render :edit }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: 'Experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def set_experience
    @experience = Experience.find(params[:id])
  end 

  def experience_params
    params.require(:experience).permit(:experience_type, :guest_limit, :listing_name, :summary, :address, :is_free, :is_public, :ada_accessible, :price, :active)
end

end
