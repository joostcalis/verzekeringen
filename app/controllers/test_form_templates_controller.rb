class TestFormTemplatesController < ApplicationController

  def show
    @test_form_template = TestFormTemplate.friendly.find(params[:id])
  end

end
