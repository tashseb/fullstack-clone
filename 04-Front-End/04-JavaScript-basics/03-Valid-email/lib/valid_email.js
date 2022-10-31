const valid = (email) => {
  // TODO: return true if the `email` string has the right pattern!
  const regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

  if (email.match(regex)) {
    return true;
  }
  return false;
};

module.exports = valid; // Do not remove.
