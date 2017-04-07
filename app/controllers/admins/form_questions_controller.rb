class Admins::FormQuestionsController < Admins::AdminsController
  before_action :find_test_form_template
  before_action :find_form_question, only: [:show, :update]

  def index
    @form_questions = @test_form_template.form_questions.published
  end

  def show
  end

  def new
    @form_question = FormQuestion.new
  end

  def create
    @form_question = FormQuestion.new(permitted_params)
    if @form_question.save
      @form_question.test_form_templates << @test_form_template
      redirect_to admins_test_form_template_form_question_path(test_form_template_id: @test_form_template.id, id: @form_question.id)
    else
      render :new
    end
  end

  def update
    if @form_question.update(permitted_params)
      redirect_to admins_test_form_template_form_question_path(test_form_id: @test_form_template.id, id: @form_question.id)
    else
      render :show
    end
  end

  private

    def permitted_params
      params.require(:form_question).permit(:content, :name, :position, subject_category_ids: [])
    end

    def find_test_form_template
      @test_form_template = TestFormTemplate.friendly.find(params[:test_form_template_id])
    end

    def find_form_question
      @form_question = FormQuestion.friendly.find(params[:id])
    end

end
