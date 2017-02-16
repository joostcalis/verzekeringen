class QuestionsController < ApplicationController

  def index
    @questions = Question.published
  end

end
