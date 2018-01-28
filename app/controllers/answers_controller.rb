class AnswersController < ApplicationController
  before_action :authenticate_user!

  def new
    @poll = Poll.find_by(uuid: params[:uuid])
    render 'already_voted' if current_user.already_voted?(@poll)
  end

  def create
    @answer = Answer.new(answer_params.merge(user: current_user))
    if @answer.save
      redirect_to polls_path
    else
      @poll = Poll.find(answer_params['poll_id'])
      render 'new'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:poll_id, :option)
  end

end
