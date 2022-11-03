const batch = 1017; // change to your own batch id
const baseUrl = `https://wagon-chat.herokuapp.com/${batch}/messages`;

// Your turn to code!
const message = document.querySelector("#your-message");
const name = document.querySelector("#your-name");
const button = document.querySelector(".btn");
const list = document.querySelector(".list-unstyled");

// Gets the time difference from time created and time now
function getTimeDifference(timeStamp) {
  const now = new Date();
  const timePosted = new Date(timeStamp.created_at);
  const timeElapsed = now.getTime() - timePosted.getTime();
  return Math.round(timeElapsed / 60000);
}

const liLists = (data) => {
  const messages = data.messages;
  list.innerHTML = "";
  messages.forEach((mes) => {
  // 3. Change the DOM (display the movies in the list)
    list.insertAdjacentHTML(
      "beforeend",
      `<li class='list-inline-item'>
        ${mes.content} (posted <span class="date">${getTimeDifference(mes)} minute ago</span>) by ${mes.author}
      </li>`
    );
  });
};

const refresh = () => {
  fetch(baseUrl)
    .then(response => response.json())
    .then((data) => {
      liLists(data);
    });
};

window.onload = refresh();

// push new messages to server
button.addEventListener("click", (event) => {
  event.preventDefault();
  const mensahe = { author: name.value, content: message.value };
  fetch(baseUrl, {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(mensahe)
  });
  refresh();
});
