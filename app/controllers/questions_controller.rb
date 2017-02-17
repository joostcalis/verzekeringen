class QuestionsController < ApplicationController
  before_action :find_question, only: [:show]

  def index
    @questions = Question.published
  end

  def show
  end

  protected
    def find_question
      @question = Question.published.friendly.find(params[:id])
    end

end
