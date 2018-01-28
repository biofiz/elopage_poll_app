class PollsController < ApplicationController
  before_action :authenticate_user!

  def index
    @polls = current_user.polls
  end

  def show
    @poll = Poll.find(params[:id])
    authorize @poll
    @answers_count = @poll.answers.select(:option).group(:option).count
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params_with_answer_option_as_array.merge(user: current_user))
    if @poll.save
      redirect_to polls_path
    else
      render 'new'
    end
  end

  def edit
    @poll = Poll.find(params[:id])
    authorize @poll
  end

  def update
    @poll = Poll.find(params[:id])
    authorize @poll
    if @poll.update_attributes(params_with_answer_option_as_array)
      redirect_to @poll
    else
      render 'edit'
    end
  end

  def destroy
    @poll = Poll.find(params[:id])
    @poll.destroy
    redirect_to polls_path
  end

  private

  def params_with_answer_option_as_array
    attributes = poll_params.dup
    attributes[:answer_options] = attributes[:answer_options].values.reject { |o| o.empty? }
    attributes
  end

  def poll_params
    params.require(:poll).permit(:title, answer_options: {})
  end
end
