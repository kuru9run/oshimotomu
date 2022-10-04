class UserSessionsController < ApplicationController
  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to(requests_path, notice: 'ログインしました')
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'ログアウトしました')
  end
end