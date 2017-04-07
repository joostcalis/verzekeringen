class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_seo_meta_tags

  def after_sign_in_path_for(resource)
    if resource.is_a? Admin
      admins_control_panel_path
    else
      super
    end
  end

  def set_seo_meta_tags
    set_seo_keywords
    set_seo_description
    set_seo_title
  end

  def set_seo_keywords(keywords = nil)
    @seo_keywords = if keywords.present?
                      keywords
                    else
                      'uitvaart, verzekering, uitvaarverzekering, vergelijken, goedkoop, makkelijk'
                    end
  end

  def set_seo_description(description = nil)
    @seo_description = if description.present?
                         description
                       else
                         'Uitvaartverzekeringen makkelijk vergelijken en afsluiten? Wij hebben alles voor je op een rijtje gezet. Gebruik onze veelgestelde vragen vergelijker om makkelijk en snel een duidelijk overzicht te krijgen.'
                       end
  end

  def set_seo_title(title = nil)
    @seo_title = if title.present?
                   title
                 else
                   'Makkelijk en snel uitvaartverzekeringen vergelijken en direct afsluiten'
                 end
  end

  def redirect_back_or_default(fallback = root_path)
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to fallback
  end

end
