import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkbox"];

  submitForm(form) {
    form.requestSubmit();
  }

  checkboxTargetConnected(checkbox) {
    checkbox.addEventListener("change", () => this.submitForm(this.element));
  }

  checkboxTargetDisconnected(checkbox) {
    checkbox.removeEventListener("change", this.submitForm);
  }
}
