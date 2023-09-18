import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal", "input"]

  connect() {
  }

  open(event) {
    event.preventDefault();

    this.modalTarget.showModal();
  }

  close(event) {
    event.preventDefault();

    this.modalTarget.close();
  }

  clickOutside(event) {
    if (event.target === this.modalTarget) {
      this.modalTarget.close()
    }
  }

  save() {
    const route = this.element.dataset.route;
    const newValue = this.inputTarget.value;

    fetch(route, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ name: newValue })
    })

    window.location.reload();
  }
}
