module ApplicationHelper

  # Returns the full title on a per-page basis
  # Hartl tutorial...
  def full_title(page_title)
    base_title = "Ruby on Rials Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
