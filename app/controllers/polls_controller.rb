class PollsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_poll, only: [:show, :edit, :destroy]

  def index
    @polls = current_user.polls
  end

  def show
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
    @poll.destroy
    redirect_to polls_path
  end

  private

  def find_poll
    @poll = Poll.find(params[:id])
  end

  def params_with_answer_option_as_array
    attributes = poll_params.dup
    if attributes[:answer_options]
      attributes[:answer_options] = attributes[:answer_options].values.reject { |o| o.empty? }
    end
    attributes
  end

  def poll_params
    params.require(:poll).permit(:title, answer_options: {})
  end
end
