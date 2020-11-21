/*
var playerOneMonsters = JSON.parse(document.querySelector("#playerOneMonsters").innerText);

var playerOneMonsterOne = JSON.parse(document.querySelector("#playerOneMonsterOne").innerText);
var playerOneMonsterOneSpecs = JSON.parse(document.querySelector("#playerOneMonsterOneSpecs").innerText);

var playerOneMonsterOneFastAttack = JSON.parse(document.querySelector("#playerOneMonsterOneFastAttack").innerText);
var playerOneMonsterOneChargedAttack = JSON.parse(document.querySelector("#playerOneMonsterOneChargedAttack").innerText);

var playerOneMonsterTwo = JSON.parse(document.querySelector("#playerOneMonsterTwo").innerText);
var playerOneMonsterTwoSpecs = JSON.parse(document.querySelector("#playerOneMonsterTwoSpecs").innerText);
var playerOneMonsterTwoFastAttack = JSON.parse(document.querySelector("#playerOneMonsterTwoFastAttack").innerText);
var playerOneMonsterTwoChargedAttack = JSON.parse(document.querySelector("#playerOneMonsterTwoChargedAttack").innerText);


var playerOneMonsterThree = JSON.parse(document.querySelector("#playerOneMonsterThree").innerText);
var playerOneMonsterThreeSpecs = JSON.parse(document.querySelector("#playerOneMonsterThreeSpecs").innerText);
var playerOneMonsterThreeFastAttack = JSON.parse(document.querySelector("#playerOneMonsterThreeFastAttack").innerText);
var playerOneMonsterThreeChargedAttack = JSON.parse(document.querySelector("#playerOneMonsterThreeChargedAttack").innerText);







var playerTwoMonsters = JSON.parse(document.querySelector("#playerTwoMonsters").innerText);

var playerTwoMonsterOne = JSON.parse(document.querySelector("#playerTwoMonsterOne").innerText);
var playerTwoMonsterOneSpecs = JSON.parse(document.querySelector("#playerTwoMonsterOneSpecs").innerText);

var playerTwoMonsterOneFastAttack = JSON.parse(document.querySelector("#playerTwoMonsterOneFastAttack").innerText);
var playerTwoMonsterOneChargedAttack = JSON.parse(document.querySelector("#playerTwoMonsterOneChargedAttack").innerText);

var playerTwoMonsterTwo = JSON.parse(document.querySelector("#playerTwoMonsterTwo").innerText);
var playerTwoMonsterTwoSpecs = JSON.parse(document.querySelector("#playerTwoMonsterTwoSpecs").innerText);

var playerTwoMonsterTwoFastAttack = JSON.parse(document.querySelector("#playerTwoMonsterTwoFastAttack").innerText);
var playerTwoMonsterTwoChargedAttack = JSON.parse(document.querySelector("#playerTwoMonsterTwoChargedAttack").innerText);


var playerTwoMonsterThree = JSON.parse(document.querySelector("#playerTwoMonsterThree").innerText);
var playerTwoMonsterThreeSpecs = JSON.parse(document.querySelector("#playerTwoMonsterThreeSpecs").innerText);

var playerTwoMonsterThreeFastAttack = JSON.parse(document.querySelector("#playerTwoMonsterThreeFastAttack").innerText);
var playerTwoMonsterThreeChargedAttack = JSON.parse(document.querySelector("#playerTwoMonsterThreeChargedAttack").innerText);
*/
 
window.onload = function(){
var playerOneMonsterOneHp = JSON.parse(document.querySelector("#playerOneMonsterOneHp").innerText);
var playerOneMonsterTwoHp = JSON.parse(document.querySelector("#playerOneMonsterTwoHp").innerText);
var playerOneMonsterThreeHp = JSON.parse(document.querySelector("#playerOneMonsterThreeHp").innerText);


var one_one_hp = document.querySelector("h1.hp.monster_1");
var one_two_hp = document.querySelector("h1.hp.monster_2");
var one_three_hp = document.querySelector("h1.hp.monster_3");
 one_one_hp.textContent = playerOneMonsterOneHp; 
 one_two_hp.textContent = playerOneMonsterTwoHp; 
 one_three_hp.textContent = playerOneMonsterThreeHp; 

var playerTwoMonsterOneHp = JSON.parse(document.querySelector("#playerTwoMonsterOneHp").innerText);
var playerTwoMonsterTwoHp = JSON.parse(document.querySelector("#playerTwoMonsterTwoHp").innerText);
var playerTwoMonsterThreeHp = JSON.parse(document.querySelector("#playerTwoMonsterThreeHp").innerText);

var two_one_hp = document.querySelector("h1.hp.monster_4");
var two_two_hp = document.querySelector("h1.hp.monster_5");
var two_three_hp = document.querySelector("h1.hp.monster_6");
 two_one_hp.textContent = playerTwoMonsterOneHp; 
 two_two_hp.textContent = playerTwoMonsterTwoHp; 
 two_three_hp.textContent = playerTwoMonsterThreeHp; 
set_players();
 set_hp();
};






var monsterBoxes = document.querySelectorAll("div.grid");

for(let x = 0; x < 3; x++){
     monsterBoxes[x].addEventListener("click", tagIn);
    

};

var button = document.querySelector(".one_tagged_in button");

function tagIn(){
    var button = document.querySelector(".one_tagged_in button");
    button.classList.add("hide_button");
  monsterBoxes.forEach(function(el){
      el.classList.remove("one_tagged_in");

  });
  let temp = this.classList.toggle("one_tagged_in");
  
  var button = document.querySelector(".one_tagged_in button");
  button.classList.remove("hide_button");
  button.addEventListener("click", useAttack);
 };


 var player_one = {};
 var player_two = {};
 var one_tagged_in_hp = document.querySelector("div.one_tagged_in h1.hp");
 var two_tagged_in_hp = document.querySelector("div.two_tagged_in h1.hp");


function useAttack(){

    set_players();

    if( Math.floor(Math.random() * 21) + player_one.monster.attack >= 4 + player_two.monster.counter){
        player_one.monster.hp -=   1;
        player_two.monster.hp -=  1;

        console.log("hit");
    
    } else {
        console.log("miss");

    };


    console.log(player_one.monster.hp);

    console.log(player_two.monster.hp);

 
    set_hp();

};

/**/ 

function set_players(){

   var playerOne = JSON.parse(document.querySelector("#playerOneData").innerText);
   var one_monster = JSON.parse(document.querySelector(".one_tagged_in p#monster").innerText);
   var one_fast_attack = JSON.parse(document.querySelector(".one_tagged_in p#fast_attack").innerText);
   var one_charged_attack = JSON.parse(document.querySelector(".one_tagged_in p#charged_attack").innerText);

    player_one = {player : playerOne, monster : one_monster, fast_attack : one_fast_attack, charged_attack : one_charged_attack};

   var playerTwo = JSON.parse(document.querySelector("#playerTwoData").innerText);
   var two_monster = JSON.parse(document.querySelector(".two_tagged_in p#monster").innerText);
   var two_fast_attack = JSON.parse(document.querySelector(".two_tagged_in p#fast_attack").innerText);
   var two_charged_attack = JSON.parse(document.querySelector(".two_tagged_in p#charged_attack").innerText);

    player_two = {player : playerTwo, monster : two_monster, fast_attack : two_fast_attack, charged_attack : two_charged_attack};
};

function set_hp(){
console.log("here tit is");
};

