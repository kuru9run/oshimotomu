class GroupsController < ApplicationController
  def create
    @favorite = Favorite.find_by(id: params[:group][:favorite_id])
    @group = Group.new(group_params)
    @group.save
    @request = request.headers[:HTTP_TURBO_FRAME]
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
