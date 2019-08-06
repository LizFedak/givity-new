class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def contact
        @user = User.find_by(id: params[:id])
        unless @user
            redirect_to user_path, alert: 'User Not found !!'
        end
    end

    def notification_settings
        @user = User.find_by(id: params[:id])
        unless @user
            redirect_to user_path, alert: 'User Not found !!'
        end
    end

    def update
        @user = User.find_by(id: params[:id])
        respond_to do |format|
            if @user.update(user_params)
              format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
              format.json { render :show, status: :ok, location: @user }
            else
              format.html { render :edit }
              format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end



      private def user_params
        params.require(:user).permit(:email, :name, :phone_number, :description, :headline, :phone_visible, :email_visible, :birthday_month, :birthday_date, :birthday_visible)
      end

end