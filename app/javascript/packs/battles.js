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


var playerTwo = JSON.parse(document.querySelector("#playerTwoData").innerText);
var playerTwoMonsterOneHp = JSON.parse(document.querySelector("#playerTwoMonsterOneHp").innerText);
var playerTwoMonsterTwoHp = JSON.parse(document.querySelector("#playerTwoMonsterTwoHp").innerText);
var playerTwoMonsterThreeHp = JSON.parse(document.querySelector("#playerTwoMonsterThreeHp").innerText);

var two_one_hp = document.querySelector("h1.hp.monster_4");
var two_two_hp = document.querySelector("h1.hp.monster_5");
var two_three_hp = document.querySelector("h1.hp.monster_6");
 two_one_hp.textContent = playerTwoMonsterOneHp; 
 two_two_hp.textContent = playerTwoMonsterTwoHp; 
 two_three_hp.textContent = playerTwoMonsterThreeHp; 
 var winning_exp = Math.ceil(((playerTwoMonsterOneHp + playerTwoMonsterTwoHp + playerTwoMonsterThreeHp)/9) * playerTwo["level"]);
 console.log(winning_exp);
 set_players();
 charger_check();
 npcFight();   
};






var monsterBoxes = document.querySelectorAll("div.grid");

for(let x = 0; x < 3; x++){
     monsterBoxes[x].addEventListener("click", tagIn);
};



function tagIn(){
    var buttons = document.querySelectorAll(".one_tagged_in button");
    
        buttons.forEach(function(el){
            el.classList.add("hide_button");
        });

      monsterBoxes.forEach(function(el){
          el.classList.remove("one_tagged_in");
         

      });

     this.classList.add("one_tagged_in");

    
    var buttons = document.querySelectorAll(".one_tagged_in button");

      if(buttons.length != 0){
      buttons[0].classList.remove("hide_button");
      buttons[0].addEventListener("click", useAttack);
      charger_check();
    };
     
 };


 var player_one = {};
 var player_two = {};
 var one_tagged_in_hp = document.querySelector("div.one_tagged_in h1.hp");
 var two_tagged_in_hp = document.querySelector("div.two_tagged_in h1.hp");
 var charger = 0;




function useAttack(){
    
    if(check_game_status() != "game over"){
    set_players();
    var one_hp = document.querySelector("div.one_tagged_in h1.hp").innerText;
    var two_hp = document.querySelector("div.two_tagged_in h1.hp").innerText;
    if( Math.floor(Math.random() * 21) + player_one.monster.attack >= 8 + player_two.monster.counter){
        two_hp -=  player_one.fast_attack.damage_points + player_one.monster.recoil;
        one_hp -=  player_two.monster.recoil;
        console.log("hit");
        
        charger += .5 + player_one.player.level/3;
    } else {
        console.log("miss");
    };
    document.querySelector("div.one_tagged_in h1.hp").textContent = one_hp;
    document.querySelector("div.two_tagged_in h1.hp").textContent = two_hp;
    document.querySelector("div.one_tagged_in p#charger").textContent = charger;
    charger_check();
    check_if_fainted();
    
};
};




function useChargedAttack(){
    if (check_game_status() != "game over"){
    set_players();
    var one_hp = document.querySelector("div.one_tagged_in h1.hp").innerText;
    var two_hp = document.querySelector("div.two_tagged_in h1.hp").innerText;
        two_hp -=  player_one.charged_attack.damage_points;
        one_hp -=  player_two.monster.recoil;
    charger = 0;
    document.querySelector("div.one_tagged_in h1.hp").textContent = one_hp;
    document.querySelector("div.two_tagged_in h1.hp").textContent = two_hp;
    document.querySelector("div.one_tagged_in p#charger").textContent = charger;
    var button = document.querySelector(".one_tagged_in button.charged");
    button.classList.add("hide_button");
    
    check_if_fainted();
    
    };
};






function charger_check(){
    var charge_meter =  document.querySelector("div.one_tagged_in p#charger").textContent;
    var button = document.querySelector(".one_tagged_in button.charged");
   
if (charge_meter >= (player_one.charged_attack.damage_points/6)){
    button.classList.remove("hide_button");
    button.addEventListener("click", useChargedAttack);
};
};




/**/ 

function set_players(){
    if (check_game_status() != "game over"){
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
};



function check_if_fainted() {
    var one_hp = document.querySelector("div.one_tagged_in h1.hp").innerText;
    var two_hp = document.querySelector("div.two_tagged_in h1.hp").innerText;
    if (one_hp <= 0 ){
       let div = document.querySelector("div.one_tagged_in");
       div.parentNode.removeChild(div);
       
     /*  if(document.querySelectorAll("div.onesy").length != 0){ */
        document.querySelectorAll("div.onesy")[0].classList.add("one_tagged_in");
        document.querySelector("div.one_tagged_in p#charger").textContent = 0;
        /*];*/ 
    };
    if (two_hp <= 0 ){
       let div =  document.querySelector("div.two_tagged_in");
       div.parentNode.removeChild(div);
       
        if(document.querySelectorAll("div.twosy").length != 0){
            document.querySelectorAll("div.twosy")[0].classList.add("two_tagged_in");
            document.querySelector("div.two_tagged_in p#charger").textContent = 0;
        };
     
    };
    document.querySelectorAll("div.onesy")[0].click();
    check_game_status();
};




function check_game_status(){
        let ones = document.querySelectorAll("div.onesy").length;
        let twos = document.querySelectorAll("div.twosy").length;
    if(ones == 0 || twos == 0){
        declare_winner();
    return "game over";

};
};

function declare_winner(){
    let ones = document.querySelectorAll("div.onesy").length;
    let twos = document.querySelectorAll("div.twosy").length;

    div = Math.max(ones, twos);
    
    if (div == ones){
        var div_2 = document.querySelector("div.one_tagged_in");
        var banner = document.querySelector("h2.item_1");
        banner.textContent = "You Won!!!!!";
   
        var user_won = document.querySelector("input#battle_user_won");
        user_won.value = true;

        div_2.classList.add("winner");

        
        console.log("You Won!");
    } else {
        var banner = document.querySelector("h2.item_1");
        banner.textContent = "Good Effort!";
        console.log("Good Effort!");
    };


    var leave = document.querySelector(".destroy");
    leave.classList.add("hide_button");
    var get_exp = document.querySelector(".get_exp");
    get_exp.classList.remove("hide_button");
};


















/* NPC BATTLE CODES */

var npcCharger = 0;


function npcUseAttack(){
    
    if(check_game_status() != "game over"){
    
    var one_hp = document.querySelector("div.one_tagged_in h1.hp").innerText;
    var two_hp = document.querySelector("div.two_tagged_in h1.hp").innerText;
    if( Math.floor(Math.random() * 21) + player_two.monster.attack >= 8 + player_one.monster.counter){
        one_hp -=  player_two.fast_attack.damage_points + player_two.monster.recoil;
        two_hp -=  player_one.monster.recoil;
        console.log("hit");
        
        npcCharger += .5 + player_two.player.level/3;
    } else {
        console.log("miss");
    };
    document.querySelector("div.one_tagged_in h1.hp").textContent = one_hp;
    document.querySelector("div.two_tagged_in h1.hp").textContent = two_hp;
    document.querySelector("div.two_tagged_in p#charger").textContent = npcCharger;
    npc_charger_check();
    check_if_fainted();
    
};
};




function npcUseChargedAttack(){
    if (check_game_status() != "game over"){
    set_players();
    var one_hp = document.querySelector("div.one_tagged_in h1.hp").innerText;
    var two_hp = document.querySelector("div.two_tagged_in h1.hp").innerText;
        one_hp -=  player_two.charged_attack.damage_points;
        two_hp -=  player_one.monster.recoil;
    npcCharger = 0;
    document.querySelector("div.one_tagged_in h1.hp").textContent = one_hp;
    document.querySelector("div.two_tagged_in h1.hp").textContent = two_hp;
    document.querySelector("div.two_tagged_in p#charger").textContent = charger;
 
    console.log("used charged attack");
    check_if_fainted();
    
    };
};

                             








function npc_charger_check(){
    var npc_charge_meter =  document.querySelector("div.two_tagged_in p#charger").textContent;
    var button = document.querySelector(".two_tagged_in button.charged");
   
if (npc_charge_meter >= (player_two.charged_attack.damage_points/6)){
    button.classList.remove("hide_button");
    button.addEventListener("click", npcUseChargedAttack);
};
};





function npcFight() {         //  create a loop function
    setTimeout(function() {   //  call a 3s setTimeout when the loop is called
                               //  your code here
      npcUseAttack();
                                
      if (check_game_status() != "game over") {           //  if the counter < 10, call the loop function
        npcFight();             //  ..  again which will trigger another 
      }                       //  ..  setTimeout()
    }, 500)
  }
  
 
  