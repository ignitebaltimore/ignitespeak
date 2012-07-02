module ApplicationHelper
  def alert_class(name)
    alert_str = case name.to_sym
    when :error, :alert
      "alert-error"
    when :success
      "alert-success"
    when :info, :notice
      "alert-info"
    else
      ""
    end

    return "alert #{alert_str}"
  end
end
