import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="editing"
export default class extends Controller {
  static targets = [ "checklistData", "sectionData", "stepData" ]

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

  saveSection() {
    const newText = this.sectionDataTarget.innerText
    const sectionId = this.sectionDataTarget.dataset.sectionId
    const dataType = this.sectionDataTarget.dataset.type

    fetch(`/sections/${sectionId}`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content')
      },
      body: JSON.stringify({ [dataType]: newText }),
    })
  }

  saveStep() {
    const newText = this.stepDataTarget.innerText
    const stepId = this.stepDataTarget.dataset.stepId
    const dataType = this.stepDataTarget.dataset.type

    fetch(`/steps/${stepId}`, {
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content')
      },
      body: JSON.stringify({ [dataType]: newText }),
    })
  }
}
