module ApplicationHelper
  # Returnts the full title when it does not have a title to add
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App" # Simple variable assignment as a string
    if page_title.empty? # Boolean Test
      base_title
    else
      page_title + " | " + base_title # String concatenation
    end
  end
end
