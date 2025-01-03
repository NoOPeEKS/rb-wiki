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
    messageDiv.className = 'flex ' + (sender === 'user' ? 'justify-end' : 'justify-start')
    
    const innerDiv = document.createElement('div')
    innerDiv.className = this.getMessageStyles(sender)
    
    // Use innerText instead of textContent to preserve newlines
    innerDiv.innerText = message
    
    // Determine if message is long (more than 100 characters)
    if (message.length > 100) {
      innerDiv.classList.add('w-full')
    }
    
    messageDiv.appendChild(innerDiv)
    this.messagesTarget.appendChild(messageDiv)
    this.scrollToBottom()
  }

  getMessageStyles(sender) {
    const baseStyles = 'p-4 rounded-lg break-words max-w-lg whitespace-pre-wrap'
    
    if (sender === 'user') {
      return `${baseStyles} bg-primary text-primary-foreground`
    } else {
      return `${baseStyles} bg-blue-100 text-blue-800`
    }
  }

  scrollToBottom() {
    this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight
  }
}
