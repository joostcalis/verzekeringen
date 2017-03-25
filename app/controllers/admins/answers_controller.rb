class Admins::AnswersController < Admins::AdminsController
  before_action :find_question
  before_action :find_answer, only: [:show, :update]

  def index
    @answers = @question.answers
  end

  def show
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(permitted_params)
    @answer.question = @question

    if @answer.save
      redirect_to admins_question_answer_path(question_id: @question, id: @answer)
    else
      render :new
    end
  end

  def update
    if @answer.update(permitted_params)
      redirect_to admins_question_answer_path(question_id: @question, id: @answer)
    else
      render :show
    end
  end

  protected

    def permitted_params
      params.require(:answer).permit(:content, :published, :insurer)
    end

    def find_question
      @question = Question.friendly.find(params[:question_id])
    end

    def find_answer
      @answer = Answer.friendly.find(params[:id])
    end

end
