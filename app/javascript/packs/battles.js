var playerOne = JSON.parse(document.querySelector("#playerOneData").innerText);
var playerOneMonsters = JSON.parse(document.querySelector("#playerOneMonsters").innerText);

var playerOneMonsterOne = JSON.parse(document.querySelector("#playerOneMonsterOne").innerText);
var playerOneMonsterOneSpecs = JSON.parse(document.querySelector("#playerOneMonsterOneSpecs").innerText);
var playerOneMonsterOneHp = JSON.parse(document.querySelector("#playerOneMonsterOneHp").innerText);
var playerOneMonsterOneFastAttack = JSON.parse(document.querySelector("#playerOneMonsterOneFastAttack").innerText);
var playerOneMonsterOneChargedAttack = JSON.parse(document.querySelector("#playerOneMonsterOneChargedAttack").innerText);

var playerOneMonsterTwo = JSON.parse(document.querySelector("#playerOneMonsterTwo").innerText);
var playerOneMonsterTwoSpecs = JSON.parse(document.querySelector("#playerOneMonsterTwoSpecs").innerText);
var playerOneMonsterTwoFastAttack = JSON.parse(document.querySelector("#playerOneMonsterTwoFastAttack").innerText);
var playerOneMonsterTwoChargedAttack = JSON.parse(document.querySelector("#playerOneMonsterTwoChargedAttack").innerText);
var playerOneMonsterTwoHp = JSON.parse(document.querySelector("#playerOneMonsterTwoHp").innerText);

var playerOneMonsterThree = JSON.parse(document.querySelector("#playerOneMonsterThree").innerText);
var playerOneMonsterThreeSpecs = JSON.parse(document.querySelector("#playerOneMonsterThreeSpecs").innerText);
var playerOneMonsterThreeFastAttack = JSON.parse(document.querySelector("#playerOneMonsterThreeFastAttack").innerText);
var playerOneMonsterThreeChargedAttack = JSON.parse(document.querySelector("#playerOneMonsterThreeChargedAttack").innerText);
var playerOneMonsterThreeHp = JSON.parse(document.querySelector("#playerOneMonsterThreeHp").innerText);





var playerTwo = JSON.parse(document.querySelector("#playerTwoData").innerText);
var playerTwoMonsters = JSON.parse(document.querySelector("#playerTwoMonsters").innerText);

var playerTwoMonsterOne = JSON.parse(document.querySelector("#playerTwoMonsterOne").innerText);
var playerTwoMonsterOneSpecs = JSON.parse(document.querySelector("#playerTwoMonsterOneSpecs").innerText);
var playerTwoMonsterOneHp = JSON.parse(document.querySelector("#playerTwoMonsterOneHp").innerText);
var playerTwoMonsterOneFastAttack = JSON.parse(document.querySelector("#playerTwoMonsterOneFastAttack").innerText);
var playerTwoMonsterOneChargedAttack = JSON.parse(document.querySelector("#playerTwoMonsterOneChargedAttack").innerText);

var playerTwoMonsterTwo = JSON.parse(document.querySelector("#playerTwoMonsterTwo").innerText);
var playerTwoMonsterTwoSpecs = JSON.parse(document.querySelector("#playerTwoMonsterTwoSpecs").innerText);
var playerTwoMonsterTwoHp = JSON.parse(document.querySelector("#playerTwoMonsterTwoHp").innerText);
var playerTwoMonsterTwoFastAttack = JSON.parse(document.querySelector("#playerTwoMonsterTwoFastAttack").innerText);
var playerTwoMonsterTwoChargedAttack = JSON.parse(document.querySelector("#playerTwoMonsterTwoChargedAttack").innerText);


var playerTwoMonsterThree = JSON.parse(document.querySelector("#playerTwoMonsterThree").innerText);
var playerTwoMonsterThreeSpecs = JSON.parse(document.querySelector("#playerTwoMonsterThreeSpecs").innerText);
var playerTwoMonsterThreeHp = JSON.parse(document.querySelector("#playerTwoMonsterThreeHp").innerText);
var playerTwoMonsterThreeFastAttack = JSON.parse(document.querySelector("#playerTwoMonsterThreeFastAttack").innerText);
var playerTwoMonsterThreeChargedAttack = JSON.parse(document.querySelector("#playerTwoMonsterThreeChargedAttack").innerText);

var one_one_hp = document.querySelector("h1.hp.monster_1");
var one_two_hp = document.querySelector("h1.hp.monster_2");
var one_three_hp = document.querySelector("h1.hp.monster_3");
 one_one_hp.textContent = playerOneMonsterOneHp; 
 one_two_hp.textContent = playerOneMonsterTwoHp; 
 one_three_hp.textContent = playerOneMonsterThreeHp; 

var two_one_hp = document.querySelector("h1.hp.monster_4");
var two_two_hp = document.querySelector("h1.hp.monster_5");
var two_three_hp = document.querySelector("h1.hp.monster_6");
 two_one_hp.textContent = playerTwoMonsterOneHp; 
 two_two_hp.textContent = playerTwoMonsterTwoHp; 
 two_three_hp.textContent = playerTwoMonsterThreeHp; 
 


 var one_tagged_in_hp = document.querySelector("div.one_tagged_in h1.hp");
 var two_tagged_in_hp = document.querySelector("div.two_tagged_in h1.hp");




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



function useAttack(){
    var one_tagged_in_monster = JSON.parse(document.querySelector(".one_tagged_in p#monster").innerText);
    var one_tagged_in_fast_attack = JSON.parse(document.querySelector(".one_tagged_in p#fast_attack").innerText);
    var one_tagged_in_charged_attack = JSON.parse(document.querySelector(".one_tagged_in p#charged_attack").innerText);
console.log(one_tagged_in_monster.name);
console.log(one_tagged_in_fast_attack.name);
console.log(one_tagged_in_charged_attack.name);

};


/* function useAttack(attacker, opponent){
    if( Math.floor(Math.random() * 21)+attacker["attack"] >= 8 + opponent["counter"]){

        console.log("hey");
    /*  two_tagged_in_hp.innerText -= attacker["attack"]; */
     
 /*   } else {
    
    }

};

*/
