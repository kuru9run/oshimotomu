import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select"
export default class extends Controller {
  static targets = [ "groupSelect", "contentSelect" ]

  connect() {
    this.groupSelectTarget.style.display = "none"
    this.contentSelectTarget.style.display = "none"
  }

  rendering_now() {
    const selected = document.getElementById("selectedExistence_now")
    if (selected.value == 'person') {
      this.groupSelectTarget.style.display = "block"
      this.contentSelectTarget.style.display = "none"
    } else if (selected.value == 'character') {
      this.groupSelectTarget.style.display = "none"
      this.contentSelectTarget.style.display = "block"
    }
  }

  rendering_before() {
    const selected = document.getElementById("selectedExistence_before")
    if (selected.value == 'person') {
      this.groupSelectTarget.style.display = "block"
      this.contentSelectTarget.style.display = "none"
    } else if (selected.value == 'character') {
      this.groupSelectTarget.style.display = "none"
      this.contentSelectTarget.style.display = "block"
    }
  }
}
