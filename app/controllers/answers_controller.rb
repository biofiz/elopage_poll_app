class AnswersController < ApplicationController
  before_action :authenticate_user!

  def new
    @poll = Poll.find_by(uuid: params[:uuid])
  end

  def create
    @poll = Poll.find(params['poll_id'])
    authorize @poll, :vote?

    @answer = Answer.new(answer_params.merge(user: current_user, poll: @poll))
    if @answer.save
      redirect_to polls_path
    else
      render 'new'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:option)
  end
end
