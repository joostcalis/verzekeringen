class TestFormsController < ApplicationController
  before_action :find_test_form_template

  def create
    @test_form = @test_form_template.create_new_from_template
    if @test_form.save
      redirect_to test_form_form_question_path(test_form_id: @test_form.id, id: @test_form.test_form_template.form_questions.first)
    else
      redirect_back_or_default
    end
  end

  private

    def find_test_form_template
      @test_form_template = TestFormTemplate.friendly.find(params[:test_form_template_id])
    end

end
