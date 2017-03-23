module DeviseHelper
  def devise_error_messages!
    if !resource.errors.empty?
      messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join.html_safe
      flash[:error] = messages
    end

    return ''
  end
end