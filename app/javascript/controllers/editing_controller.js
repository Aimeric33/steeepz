import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="editing"
export default class extends Controller {
  static targets = [ "checklistData" ]

  connect() {
    console.log("hello from editing controller")
  }

  saveChecklist() {
    const newText = this.checklistDataTarget.innerText
    const checklistId = this.checklistDataTarget.dataset.checklistId
    const dataType = this.checklistDataTarget.dataset.type
    fetch(`/checklists/${checklistId}`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content')
      },
      body: JSON.stringify({ [dataType]: newText }),
    })
  }
}
