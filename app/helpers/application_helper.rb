module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def buttoned_link_to(title, path)
    "<div class=\"new-button\">
        <a href=\"#{path}\">
          <span class=\"bg\">
            <span class=\"l\"></span>
            <span class=\"r\"></span>
            <span class=\"icon\"></span>
            <span class=\"text\">#{title.to_s}</span>
          </span>
        </a>
     </div>".html_safe
  end
  
end
