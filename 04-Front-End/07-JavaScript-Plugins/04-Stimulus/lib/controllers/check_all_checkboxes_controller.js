import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['checkbox'];

  connect() {
    console.log('Hello from check_all_checkboxes_controller.js');
    // console.log(this.testTarget)
  }

  checkbox(event) {
    console.log("check All");
    this.checkboxTargets.forEach((target) => {
      console.log(event.currentTarget.checked);
      target.checked = event.currentTarget.checked;
    });
  }
}
