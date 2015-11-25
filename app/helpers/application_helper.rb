module ApplicationHelper
  def progress_as_percentage
    number_to_percentage(counter.progress * 100, precision: 2)
  rescue
    "N/D"
  end

  def data_tag(value)
    content_tag :span, value, class: "data"
  end
end
