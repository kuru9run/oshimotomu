class AnswersController < ApplicationController
  def create
    answer = current_user.answers.build(answer_params)
    if answer.save
      redirect_to request_path(answer.request)
    else
      render 'requests#show'
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    answer.destroy!
    redirect_to request_path(answer.request)
  end

  private

  def answer_params
    params.require(:answer).permit(:body).merge(request_id: params[:request_id])
  end
end
