class HomeController < ApplicationController

  def index
    require 'nokogiri'
    require 'open-uri'
    doc = Nokogiri::HTML(open("http://www.telegraaf.nl"))
    puts doc.css("//a")
    @insurers = Insurer.all
  end

end
