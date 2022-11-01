const parseData = (data) => {
  if (data === 'true') return true;
  if (data === 'false') return false;
  if ((data.match(/\d/g) || []).length === data.length) {
    return Number.parseInt(data, 10);
  }
  return data;
};

const dataset = (element) => {
  // TODO: return the element's data attributes in an object
  const regex = /data-\w+="\w+"/g;
  const firstDiv = element.split(">")[0];
  const rawAttributes = firstDiv.match(regex) || [];
  const result = {};

  rawAttributes.forEach((attribute) => {
    const babySet = attribute.replace("data-", "");
    const key = babySet.split("=")[0];
    const value = babySet.split("=")[1];
    console.log(parseData(value));
    result[key] = parseData(value);
  });
  return result;
};

module.exports = dataset; // Do not remove.
