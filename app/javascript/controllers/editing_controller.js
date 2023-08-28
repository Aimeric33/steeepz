import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="editing"
export default class extends Controller {
  static targets = [ "item" ]

  save() {
    const newText = this.itemTarget.innerText
    const itemId = this.itemTarget.dataset.id
    const itemType = this.itemTarget.dataset.type
    const route = this.itemTarget.dataset.route

    fetch(`/${route}/${itemId}`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content')
      },
      body: JSON.stringify({ [itemType]: newText }),
    })
  }
}
