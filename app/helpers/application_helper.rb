module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def button(title, path)
    #TODO
  end
  
end
