import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['searchForm', 'searchField' , 'submitButton']

  initialize() {
    console.log('initialize');
  }

  connect() {
    console.log('connect');
  }

  search() {
    console.log('search', this.searchFieldTarget.value);

    if (this.searchFieldTarget.value.lenght >= 3) {
      this.submitButtonTarget.click()
    }
  }
}