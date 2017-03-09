module ApplicationHelper

  def check_box_class_name(value)
    class_name = 'unchecked'
    class_name = 'checked' if value
    class_name
  end

  def todos_active_counter(count)
    if (count == 1)
      return "#{count} item left"
    else
      return  "#{count} items left"
    end
  end

end
