class FaqConstraint

  def self.matches?(request)
    path_array = request.fullpath.split('/')
    Insurer.published.pluck(:slug).push('alle').include?(path_array[-2]) && Question.published.pluck(:slug).push('alle').include?(path_array.last)
  end

end
