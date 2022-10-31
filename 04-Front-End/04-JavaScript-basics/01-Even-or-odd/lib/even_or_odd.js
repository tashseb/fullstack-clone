const evenOrOdd = (number) => {
  // TODO: this should return "even" if the number is even, "odd" otherwise
  let result = "odd";
  if (number % 2 === 0) {
    result = "even";
  }
  return result;
};

module.exports = evenOrOdd; // Do not remove. We need this for the spec to know about your method.
