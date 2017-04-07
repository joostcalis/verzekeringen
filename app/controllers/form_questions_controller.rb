class FormQuestionsController < ApplicationController
  before_action :find_test_form
  before_action :find_form_question, only: [:update]

  def show
    @form_question = FormQuestion.friendly.find(params[:id])
    @form_answer = @form_question.form_answers.belonging_to_test_form(@test_form.id).first || FormAnswer.new
  end

  def update
    if @form_question.update(permitted_params)
      @next_form_question = get_next_or_process_last(@form_question)
      redirect_to test_form_form_question_path(test_form_id: @test_form.id, id: @next_form_question.id)
    else
      render :show
    end
  end


  private

    def permitted_params
      params.require(:form_question).permit(:score)
    end

    def find_test_form
      @test_form = TestForm.find(params[:test_form_id])
    end
end
