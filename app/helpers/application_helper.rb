module ApplicationHelper
  def heading_title(heading)
    base_heading = "RedMart"

    if heading != ''
      base_heading = base_heading + ' | ' + heading
    else
      base_heading
    end
  end
end
