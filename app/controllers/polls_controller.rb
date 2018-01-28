class PollsController < ApplicationController
  before_action :authenticate_user!

  def index
    @polls = Poll.all
  end

  def show
    @poll = Poll.find(params[:id])
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
  end

  def update
    @poll = Poll.find(params[:id])
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
