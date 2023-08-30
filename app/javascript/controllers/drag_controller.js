import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

// Connects to data-controller="drag"
export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      handle: ".bx-move-vertical",
      onEnd: this.end.bind(this)
    })
  }

  end(event) {
    // console.log(event)
    const id = event.item.dataset.id
    const route = event.from.dataset.route
    const data = { position: event.newIndex + 1 }

    fetch(`${route}/${id}`, {
      method: "PATCH",
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content')
      },
      body: JSON.stringify(data)
    })
  }
}
