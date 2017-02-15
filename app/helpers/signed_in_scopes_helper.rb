module SignedInScopesHelper

  def current_path
    request.env['PATH_INFO'] || ''
  end

  def admin_scope?
    current_path.match(/\.*\/admins\/.*/)
  end

  def admin_signed_in_scope?
    admin_signed_in? && admin_scope?
  end

  def current_scope
    if admin_scope?
      :admin
    end
  end

end
