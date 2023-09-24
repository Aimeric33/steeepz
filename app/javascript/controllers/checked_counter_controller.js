import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checked-counter"
export default class extends Controller {
  static targets = [ "input", "total" ]

  connect() {
  }

  update() {
    let total = 0
    this.inputTargets.forEach((input) => {
      if (input.checked) {
        total += 1
      }
    })
    console.log(total)
    this.totalTarget.innerText = total
  }
}
