class VeelgesteldeVragen::FaqsController < ApplicationController
  before_action :find_questions
  before_action :find_insurers

  def index
    @all_insurers = Insurer.published
    @all_questions = Question.published
    @single_insurer = @insurers.count == 1
    @single_question = @questions.count == 1
  end

  protected

    def find_questions
      begin
        @questions = [Question.friendly.find(params[:question_id])]
      rescue ActiveRecord::RecordNotFound
        @questions = Question.published
      end
    end

    def find_insurers
      begin
        @insurers = [Insurer.friendly.find(params[:insurer_id])]
      rescue ActiveRecord::RecordNotFound
        @insurers = Insurer.published
      end
    end

end
