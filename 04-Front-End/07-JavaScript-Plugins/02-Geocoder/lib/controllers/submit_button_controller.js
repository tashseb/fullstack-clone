import mapboxgl from "mapbox-gl";
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['form', 'coordinates', 'input']

  apiKey = `pk.eyJ1IjoidGFzaHNlYiIsImEiOiJjbGEwa25xeGYwMHEyM290bTFvcWtzYXRlIn0.dInqeaRqsN6sIU9qP4km7Q`;

  connect() {
    console.log('Hello from submit_button_controller.js');
    // console.log(this.testTarget)
  }

  submit(event) {
    event.preventDefault();
    console.log("Submit button method");
    this.fetchMapbox(this.inputTarget);
  }

  displayMap(coordinate) {
    mapboxgl.accessToken = this.apiKey;
    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/mapbox/streets-v9",
      center: coordinate,
      zoom: 12
    });
    new mapboxgl.Marker()
      .setLngLat(coordinate)
      .addTo(map);
  }

  fetchMapbox(keyword) {
    const baseURL = `https://api.mapbox.com/geocoding/v5/mapbox.places/${keyword.value}.json?access_token=${this.apiKey}`;
    fetch(baseURL)
      .then(response => response.json())
      .then((data) => {
        const coordinate = data.features[0].geometry.coordinates;
        this.coordinatesTarget.innerHTML = coordinate;
        this.displayMap(coordinate);
      });
  }
}
