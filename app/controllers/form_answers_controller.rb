class FormAnswersController < ApplicationController
  before_action :find_test_form
  before_action :find_form_question
  before_action :find_form_answer, only: [:edit]

  def create
    @form_answer = FormAnswer.new(permitted_params)
    @form_answer.form_question = @form_question

    if @form_answer.save
      @next_form_question = get_next_or_process_last(@form_question)
      unless @next_form_question.present?
        return redirect_to root_path
      end
      redirect_to test_form_form_question_path(test_form_id: @test_form.id, id: @next_form_question.id)
    else
      redirect_to test_form_form_question_path(test_form_id: @test_form.id, id: @form_question.id)
    end
  end

  def edit
    if @form_answer.update(permitted_params)
      @next_form_question = get_next_or_process_last(@form_question)
      unless @next_form_question.present?
        return redirect_to root_path
      end
      redirect_to test_form_form_question_path(test_form_id: @test_form.id, id: @next_form_question.id)
    else
      redirect_to test_form_form_question_path(test_form_id: @test_form.id, id: @form_question.id)
    end
  end

  private

  def find_form_answer
    @form_answer = FormAnswer.find(params[:id])
  end

    def find_form_question
      @form_question = FormQuestion.friendly.find(params[:form_question_id])
    end

    def find_test_form
      @test_form = TestForm.find(params[:test_form_id])
    end

    def permitted_params
      params.require(:form_answer).permit(:score)
    end

    def get_next_or_process_last(question)
      if question.last?
        nil
      else
        question.lower_item
      end
    end

end
