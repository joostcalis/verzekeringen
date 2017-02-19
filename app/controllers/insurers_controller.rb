class InsurersController < ApplicationController
  before_action :find_insurer, except: [:index]

  def index
    @insurers = Insurer.all
  end

  def show
    @insurer_questions = Question.per_insurer(@insurer)
  end

  protected

    def find_insurer
      @insurer = Insurer.friendly.find(params[:id])
    end

end
