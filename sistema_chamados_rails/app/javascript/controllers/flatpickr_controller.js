import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import "flatpickr/dist/l10n/pt.js"

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static values = {
    enableTime: Boolean,
    noCalendar: Boolean,
    dateFormat: String,
    defaultDate: String
  }

  connect() {
    const config = {
      locale: "pt",
      enableTime: this.enableTimeValue,
      noCalendar: this.noCalendarValue,
      dateFormat: this.dateFormatValue || "d/m/Y",
      allowInput: true,
      time_24hr: true
    }

    if (this.defaultDateValue) {
      config.defaultDate = this.defaultDateValue
    }

    this.fp = flatpickr(this.element, config)
  }

  disconnect() {
    this.fp.destroy()
  }
}
