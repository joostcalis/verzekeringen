class Admins::InsurersController < Admins::AdminsController
  before_action :find_insurer, only: [:show, :update]

  def index
    @insurers = Insurer.all
  end

  def show
  end

  def new
    @insurer = Insurer.new
  end

  def create
    @insurer = Insurer.new(permitted_params)

    if @insurer.save
      redirect_to admins_insurer_path(@insurer)
    else
      render :new
    end
  end

  def update
    if @insurer.update(permitted_params)
      flash[:notice] = "Verzekeraar opgeslagen"
      redirect_to admins_insurer_path(@insurer)
    else
      render :show, flash: 'niet opgeslagen'
    end
  end

  protected

    def permitted_params
      params.require(:insurer).permit(:name, :description, :price, :insured_amount, :extra_info, :affiliate_link, :meta_description, :meta_keywords, :meta_page_title, :logo)
    end

    def find_insurer
      @insurer = Insurer.friendly.find(params[:id])
    end

end
