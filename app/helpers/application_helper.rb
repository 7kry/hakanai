module ApplicationHelper
  def multiline_html(str)
    h(str).lines.map!(&:chomp).join("<br />").html_safe
  end
end
