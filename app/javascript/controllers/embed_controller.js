import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="embed"
export default class extends Controller {
  static targets = [ "embedOpen" ]

  connect() {
    if (location.pathname.includes('edit')) {
      for (let i = 0; i < 10; i++) {
        const embedTmp = document.getElementById(`embed_form_${i+1}`)
        if (document.querySelector(`input[type=text][name=embed_url_${i+1}]`).value != "") {
          embedTmp.style.display = "block"
        }
      }
    }
  }

  click() {
    for (let i = 0; i < 10; i++) {
      const embedTmp = document.getElementById(`embed_form_${i+1}`)
      if (embedTmp.style.display == "none") {
        embedTmp.style.display = "block"
        if (i == 9) {
          document.getElementById("embed_open_button").style.display = "none"
        }
        break
      }
    }
  }
}
