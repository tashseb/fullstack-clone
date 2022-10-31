const sumOfNegative = (numbers) => {
  // TODO: You are getting a `numbers` array. Return the sum of **negative** numbers only.
  let result = 0;

  numbers.forEach((num) => {
    if (num < 0) result += num;
  });
  return result;
};

module.exports = sumOfNegative; // Do not remove.
