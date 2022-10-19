class GroupsController < ApplicationController
  def create
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
