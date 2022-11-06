import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['city', 'date', 'input', 'description', 'temperature']

  apiKey = `f5bb9c18e1cae406a301c977835c9190`;


  connect() {
    console.log('Hello from submit_button_controller.js');
    // console.log(this.testTarget)
    navigator.geolocation.getCurrentPosition((data) => {
      const latitude = data.coords.latitude;
      const longtitue = data.coords.longitude;
      this.displayWeather(longtitue, latitude);
    });
  }

  submit(event) {
    event.preventDefault();
    console.log("Submit button method");
    this.fetchMapbox(this.inputTarget);
  }

  displayWeather(lon, lat) {
    const baseURL = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${this.apiKey}`;
    this.fetchMapbox(baseURL);
  }

  fetchMapbox(baseURL) {
    fetch(baseURL)
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        this.temperatureTarget.innerText = data.main.temp;
      });
  }
}
