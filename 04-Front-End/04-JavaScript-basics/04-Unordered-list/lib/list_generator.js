const listItem = (content) => {
  // TODO: return the proper <li> HTML tag with its content (as a string)
  return `<li class="list-group-item">${content}</li>`;
};

const unorderedList = (items) => {
  // TODO: return the proper <ul> markup (as a string)
  let result = "";
  result += '<ul class="list-group">';
  items.forEach((item) => {
    result += `<li class="list-group-item">${item}</li>`;
  });
  result += "</ul>";
  return result;
};

module.exports = { listItem, unorderedList }; // Do not remove.
