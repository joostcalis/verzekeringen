class Admins::TestFormTemplatesController < Admins::AdminsController
  before_action :find_test_form_template, only: [:show]

  def index
    @test_form_templates = TestFormTemplate.published
  end

  def show
  end

  def new
    @test_form_template = TestFormTemplate.new
  end

  def create
    @test_form_template = TestFormTemplate.new(permitted_params)
    if @test_form_template.save
      redirect_to admins_test_form_template_path(@test_form_template)
    else
      render :new
    end
  end

  private

    def permitted_params
      params.require(:test_form_template).permit(:type, :name)
    end

    def find_test_form_template
      @test_form_template = TestFormTemplate.friendly.find(params[:id])
    end

end
