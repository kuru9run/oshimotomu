class AnswersController < ApplicationController
  def create
    @answer = current_user.answers.build(answer_params)
    if @answer.save
      # createテンプレートをレンダリング
    else
      render 'requests/show', status: :unprocessable_entity
    end
  end

  def destroy
    answer = current_user.answers.find(params[:id])
    answer.destroy!
    redirect_to request_path(answer.request)
  end

  private

  def answer_params
    params.require(:answer).permit(:body).merge(request_id: params[:request_id])
  end
end
