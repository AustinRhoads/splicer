var playerOne = JSON.parse(document.querySelector("#playerOneData").innerText);
var playerOneMonsters = JSON.parse(document.querySelector("#playerOneMonsters").innerText);
var playerTwo = JSON.parse(document.querySelector("#playerTwoData").innerText);
var playerTwoMonsters = JSON.parse(document.querySelector("#playerTwoMonsters").innerText);
console.log(playerOne);
console.log(playerOneMonsters);
console.log(playerTwo);
console.log(playerTwoMonsters);
var phrase_1 = playerOne["name"] + " has "  + playerOneMonsters.length + " monsters."
console.log(phrase_1);