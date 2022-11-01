// TODO: React to a click on the button!
const button = document.getElementById("clickme");
button.addEventListener("click", () => {
  button.disabled = true;
  button.innerHTML = "Bingo";
});
