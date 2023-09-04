// app/javascript/controllers/toggle_controller.js
import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  connect(){
    
  }

  toggle(event) {
    event.preventDefault();
    console.log("cliked")

    // Toggle the icon classes
    event.target.classList.toggle("fa-minus-square");
    event.target.classList.toggle("fa-plus-square");

    // Toggle visibility of elements
    event.target.nextElementSibling.nextElementSibling.classList.toggle("hidden");
  }
}
