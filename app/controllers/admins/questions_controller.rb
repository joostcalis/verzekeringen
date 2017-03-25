class Admins::QuestionsController < Admins::AdminsController
  before_action :find_question, only: [:show, :update]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(permitted_params)

    if @question.save
      redirect_to admins_question_path(@question)
    else
      render :new
    end
  end

  def update
    if @question.update(permitted_params)
      redirect_to admins_question_path(@question)
    else
      render :edit
    end
  end

  protected

    def find_question
      @question = Question.friendly.find(params[:id])
    end

end
