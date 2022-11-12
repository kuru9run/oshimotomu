class GroupsController < ApplicationController
  def create
    @group = Group.new(group_params)
    @group.save
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
