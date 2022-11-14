class GroupsController < ApplicationController
  def create
    @group = Group.new(group_params)
    if @group.save
      flash.now[:success] = t('.success')
    else
      flash.now[:alert] = t('.fail')
    end
    @flash = flash
    # createテンプレートをレンダリング
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
