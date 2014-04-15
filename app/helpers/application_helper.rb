# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def flash_messages
    if flash[:notice]
      %{<p class='flash good'>#{flash[:notice]}</p>}
    end
  end
end
