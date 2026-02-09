module ChamadosHelper
  def gov_date_picker(form, method, label, options = {})
    content_tag(:div, class: "input-group") do
      concat content_tag(:span, content_tag(:i, "", class: "bi bi-calendar"), class: "input-group-text")
      concat form.text_field(method, options.merge(
        class: "form-control",
        data: {
          controller: "flatpickr",
          flatpickr_enable_time_value: "false",
          flatpickr_date_format_value: "d/m/Y"
        }
      ))
    end
  end

  def gov_time_picker(form, method, label, options = {})
    content_tag(:div, class: "input-group") do
      concat content_tag(:span, content_tag(:i, "", class: "bi bi-clock"), class: "input-group-text")
      concat form.text_field(method, options.merge(
        class: "form-control",
        value: form.object.send(method)&.strftime("%H:%M"),
        data: {
          controller: "flatpickr",
          flatpickr_enable_time_value: "true",
          flatpickr_no_calendar_value: "true",
          flatpickr_date_format_value: "H:i",
          flatpickr_time_24hr_value: "true"
        }
      ))
    end
  end

  def gov_datetime_picker(form, method, label, options = {})
    content_tag(:div, class: "input-group") do
      concat content_tag(:span, content_tag(:i, "", class: "bi bi-calendar-check"), class: "input-group-text")
      concat form.text_field(method, options.merge(
        class: "form-control",
        data: {
          controller: "flatpickr",
          flatpickr_enable_time_value: "true",
          flatpickr_date_format_value: "d/m/Y H:i",
          flatpickr_time_24hr_value: "true"
        }
      ))
    end
  end
end
