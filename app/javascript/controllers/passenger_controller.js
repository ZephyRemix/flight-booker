import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    add() {
        console.log("add")
    }

    remove() {
        console.log("removed!")
    }
}