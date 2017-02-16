class HomeController < ApplicationController

  def index
    @insurers = Insurer.all
  end

end
