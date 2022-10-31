const good = ["Hobbits", "Elves", "Dwarves", "Eagles"];

const isGood = (soldierType) => {
  // TODO: return `true` if the soldierType is Good.
  // Hint: Hobbits, Elves, Dwarves and Eagles are Good
  if (good.includes(soldierType)) {
    return true;
  } return false;
};

const buildSoldierObject = (battlefield) => {
  // TODO: Given a battlefield (String), return an object of forces.
  const result = {};
  const initialArray = battlefield.split(",");
  initialArray.forEach((item) => {
    let splittedArray = [];
    splittedArray = item.split(":");
    result[splittedArray[0]] = parseInt(splittedArray[1], 10);
  });
  return result;
};

const whoWinsTheWar = (battlefield) => {
  // TODO: Based on the battlefield's description (it's a String), return "Good", "Evil" or "Tie".
  let verdict = "Tie";
  let g = 0;
  let e = 0;
  const players = buildSoldierObject(battlefield);
  const keys = Object.keys(players);
  const values = Object.values(players);

  keys.forEach((item, index) => {
    if (good.includes(keys[index])) {
      g += values[index];
    } else {
      e += values[index];
    }
  });
  if (g > e) {
    verdict = "Good";
  } else if (e > g) {
    verdict = "Evil";
  } else {
    verdict = "Tie";
  }
  return verdict;
};

module.exports = { whoWinsTheWar, buildSoldierObject, isGood }; // Do not remove this line
// console.log(whoWinsTheWar('Hobbits:1,Elves:2,Dwarves:3,Eagles:4,Orcs:5,Wargs:6,Goblins:7'));
