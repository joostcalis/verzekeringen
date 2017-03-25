class QuestionsController < ApplicationController
  before_action :find_question, only: [:show]

  def index
    @questions = Question.published
    @insurers = Insurer.published
  end

  def show
  end

  def faq_filter
    @questions = if params[:q_id].present? && params[:q_id] != 'All'
                   [Question.find(params[:q_id])]
                 else
                   Question.published
                 end

    @insurers = if params[:i_id].present? && params[:i_id] != 'All'
                   [Insurer.find(params[:i_id])]
                 else
                   Insurer.published
                 end

   @single_insurer = @insurers.count == 1

    respond_to do |format|
      format.js
    end

  end

  protected

    def find_question
      @question = Question.published.friendly.find(params[:id])
    end

end
