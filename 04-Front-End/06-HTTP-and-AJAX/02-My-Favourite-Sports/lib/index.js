// TODO: write your code here!
// Select an element
const selected = document.querySelectorAll(".clickable");
// Add an event listener when selected class is clicked
selected.addEventListener("click", (event) => {
  console.log(event);
  selected.classList.add("active");
  selected.classList.replace("clickable", "active");
});
// Change DOM by using CSS to show it is selected
