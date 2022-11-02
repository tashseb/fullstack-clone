// TODO: Autocomplete the input with AJAX calls.
const input = document.querySelector("#search");
const list = document.querySelector("#results");

input.addEventListener("keyup", (event) => {
  console.log(event);
  event.preventDefault();

  const keyword = input.value;
  const url = `https://wagon-dictionary.herokuapp.com/autocomplete/${keyword}`;
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      const results = data.words;
      list.innerHTML = "";
      results.forEach((result) => {
      // 3. Change the DOM (display the movies in the list)
        list.insertAdjacentHTML(
          "beforeend",
          `<li class='list-inline-item'>${result}
          </li>`
        );
      });
    });
});
