class AnswersController < ApplicationController
  before_action :authenticate_user!

  def new
    @poll = Poll.find_by(uuid: params[:uuid])
  end

  def create
    @poll = Poll.find(params['answer']['poll_id'])
    authorize @poll, :vote?

    @answer = Answer.new(answer_params.merge(user: current_user))
    if @answer.save
      flash[:success] = 'Thank you! You successfully voted!'
      redirect_to polls_path
    else
      render 'new'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:option, :poll_id)
  end
end
