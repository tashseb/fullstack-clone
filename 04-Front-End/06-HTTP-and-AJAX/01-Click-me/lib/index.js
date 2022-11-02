const displayAlertOnButtonClick = () => {
  // TODO: Select the big green button
  const button = document.querySelector(".btn");
  // TODO: Bind the `click` event to the button
  button.addEventListener("click", (event) => {
    console.log(event);
    alert("Thank you!");
  });
  // TODO: On click, display `Thank you!` in a JavaScript alert!
};

displayAlertOnButtonClick(); // Do not remove!
