// TODO: write your code here!
// Select an element
const selection = document.querySelectorAll(".clickable");
// Add an event listener when selected class is clicked
selection.forEach((selected) => {
  selected.addEventListener("click", (event) => {
    console.log(event);
    // toggle functions changes it from original to the new class (clickable <-> active)
    event.currentTarget.classList.toggle("active");
  });
});
// Change DOM by using CSS to show it is selected
