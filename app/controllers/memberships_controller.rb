class MembershipsController < ApplicationController
  

    def create
      logger.debug "CREATE MEMBERSHIP"
      user = User.find(params[:user_id])
      group = Group.find(params[:group_id])
      logger.debug user.id
      logger.debug group.id
      res = Membership.new(user_id: user.id, group_id: group.id).save
      #res = Membership.new(user_id: params[:user_id], group_id: params[:user_id]).save
      logger.debug "result "
      logger.debug res
      redirect_to group_path(group)
    end
  
    def destroy
      user = Membership.find(params[:id]).group_followed
      current_user.group_unfollow(group)
      redirect_to group
    end
  end
  