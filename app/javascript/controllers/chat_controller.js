import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["messages", "input"]

  connect() {
  }

  async sendMessage(event) {
    event.preventDefault()
    
    const message = this.inputTarget.value.trim()
    if (!message) return

    // Add user message
    this.addMessage(message, 'user')
    this.inputTarget.value = ''

    try {
      const response = await fetch('/chat/send_message', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
        },
        body: JSON.stringify({ message })
      })

      const data = await response.json()
      
      if (response.ok) {
        this.addMessage(data.response, 'bot')
      } else {
        this.addMessage('Sorry, there was an error processing your message.', 'bot')
      }
    } catch (error) {
      console.error('Error:', error)
      this.addMessage('Sorry, there was an error processing your message.', 'bot')
    }
  }

  addMessage(message, sender) {
    const messageDiv = document.createElement('div')
    messageDiv.classList.add('message', `${sender}-message`)
    messageDiv.textContent = message
    this.messagesTarget.appendChild(messageDiv)
    this.scrollToBottom()
  }

  scrollToBottom() {
    this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight
  }
}
