import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar", "toggleButton", "openIcon", "closeIcon"]

  connect() {
    this.sidebarOpen = true
    this.updateUI()
  }

  toggle() {
    this.sidebarOpen = !this.sidebarOpen
    this.updateUI()
  }

  updateUI() {
    if (this.sidebarOpen) {
      this.sidebarTarget.classList.remove("hidden")
      this.openIconTarget.classList.remove("hidden")
      this.closeIconTarget.classList.add("hidden")
    } else {
      this.sidebarTarget.classList.add("hidden")
      this.openIconTarget.classList.add("hidden")
      this.closeIconTarget.classList.remove("hidden")
    }
  }

  close(event) {
    if (!this.sidebarTarget.contains(event.target) && !this.toggleButtonTarget.contains(event.target)) {
      this.sidebarOpen = false
      this.updateUI()
    }
  }
}
