import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="editing"
export default class extends Controller {
  static targets = [ "item", "button" ]

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

  add() {
    const newItem = this.buttonTarget.dataset.newItem
    const parentId = this.buttonTarget.dataset.parentId
    let route = ""

    if (newItem === "step") {
      route = `/sections/${parentId}/steps`
    } else if (newItem === "section") {
      route = `/checklists/${parentId}/sections`
    }

    fetch(route, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content')
      },
      body: JSON.stringify({ title: `New ${newItem}` }),
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.buttonTarget.insertAdjacentHTML('beforebegin', data.inserted_item)
        }
      })
  }

  delete() {
    const itemId = this.buttonTarget.dataset.id
    const route = this.buttonTarget.dataset.route

    fetch(`/${route}/${itemId}`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content')
      }
    })
      .then((data) => {
        if (data.ok) {
          this.element.remove()
        }
      })
  }
}
