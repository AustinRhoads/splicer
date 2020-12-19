
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

 var monsterBoxes = document.querySelectorAll("div.grid");

 for(let x = 0; x < 3; x++){
      monsterBoxes[x].addEventListener("click", tagIn);
 };







countdown();


};


function countdown(){

            var all = document.querySelectorAll(".countdown");
        var one = document.querySelector("img.countdown_1");
        var two = document.querySelector("img.countdown_2");
        var three = document.querySelector("img.countdown_3");
        var fight = document.querySelector("img.countdown_fight");
        

        setTimeout(function(){ 
            all.forEach(function(el){
                el.classList.add("hide_button");
            });
            three.classList.remove("hide_button");
        }, 1000);


        setTimeout(function(){ 
            all.forEach(function(el){
                el.classList.add("hide_button");
            });
            two.classList.remove("hide_button");
        }, 2000);

        setTimeout(function(){ 
            all.forEach(function(el){
                el.classList.add("hide_button");
            });
            one.classList.remove("hide_button");
        }, 3000);


        setTimeout(function(){ 
            all.forEach(function(el){
                el.classList.add("hide_button");
            });
            fight.classList.remove("hide_button");
        }, 4000);

        setTimeout(function(){ 
            all.forEach(function(el){
                el.classList.add("hide_button");
            });
            var goodGuys = document.querySelectorAll("div.onesy");
            goodGuys[0].click();
            npc_tagIn();
            set_players();
             npcFight(); 
            
        }, 5000);

       
  
};





var monsterBoxes = document.querySelectorAll("div.grid");


function tagIn(){


            if(this.classList.contains("available")){
            
            var last = document.querySelector("#roster_one div.in_the_ring");
            
            if(last){
                last.classList.remove("in_the_ring");
            };
        
            var old_div = document.querySelector(".one_tagged_in");
        
            if(old_div){
             old_div.parentElement.removeChild(old_div);
            };
        
        
            this.classList.add("in_the_ring");
            var arena = document.querySelector("div.arena");
            var new_div = this.cloneNode(true);

            new_div.classList.remove("onesy");
            new_div.style.height = "400px";
           // new_div.classList.add("in_the_ring");
            new_div.classList.add("one_tagged_in");
        
         //   var all_divs = document.querySelectorAll("div.onesy");
         //  
         //   all_divs.querySelector(".monster_image").classList.add("hide_button");
         //   all_divs.querySelector(".monster_image_thumb").classList.remove("hide_button");
        
        
        
        
            var images = document.querySelectorAll(".onesy img.monster_image");
            var thumb_images = document.querySelectorAll(".onesy img.monster_image_thumb");
        //
        //
        
        
        
        
           thumb_images.forEach(function(el){
               el.classList.remove("hide_button");
           });
       

               images.forEach(function(el){
                   el.classList.add("hide_button");
               });
           
           
           
        new_div.querySelector(".monster_image").classList.remove("hide_button");
        new_div.querySelector("img.power_flask").classList.remove("hide_button");
        new_div.querySelector(".monster_image_thumb").classList.add("hide_button");
        arena.appendChild(new_div);
           
            var baddy = document.querySelector(".two_tagged_in");
            if(baddy){
            baddy.addEventListener("click", useAttack);
            };
         };
      charger_check();
};


 var player_one = {};
 var player_two = {};
 var one_tagged_in_hp = document.querySelector("div.one_tagged_in h1.hp");
 var two_tagged_in_hp = document.querySelector("div.two_tagged_in h1.hp");
 
 var charger = 0;



function useAttack(){
    charger = parseInt(document.querySelector("div.one_tagged_in p#charger").textContent);
    
    if(check_game_status() != "game over"){

    set_players();
    var one_hp = document.querySelector("div.one_tagged_in h1.hp").innerText;
    var two_hp = document.querySelector("div.two_tagged_in h1.hp").innerText;
    if( Math.floor(Math.random() * 21) + player_one.monster.attack >= 8 + player_two.monster.counter){
        two_hp -=  player_one.fast_attack.damage_points + player_one.monster.recoil + Math.floor(player_one.player.level/3);
        one_hp -=  player_two.monster.recoil;
        console.log("hit");
        charger += .5 + player_one.player.level/3;
        
    } else {
        console.log("miss");
    };
    document.querySelector("div.one_tagged_in h1.hp").textContent = one_hp;
    document.querySelector("#roster_one .in_the_ring h1.hp").textContent = one_hp;
    
    document.querySelector("div.two_tagged_in h1.hp").textContent = two_hp;
    document.querySelector("#roster_two .in_the_ring h1.hp").textContent = two_hp;
    
    
   
    
    
    check_if_fainted();
    

    };
    document.querySelector("#roster_one .in_the_ring p#charger").textContent = charger;
        document.querySelector("div.one_tagged_in p#charger").textContent = charger;
    charger_check();
};








function useChargedAttack(){

    var flask = document.querySelector(".one_tagged_in img.power_flask");
    flask.classList.remove("activated");

    flask.removeEventListener("click", useChargedAttack);



    document.querySelector("div.one_tagged_in p#charger").textContent = 0;
    document.querySelector("#roster_one .in_the_ring p#charger").textContent = 0;
    charger_check()


    if (check_game_status() != "game over"){

       
   


  //  set_players();
    var one_hp = document.querySelector("div.one_tagged_in h1.hp").innerText;
    var two_hp = document.querySelector("div.two_tagged_in h1.hp").innerText;
        two_hp -=  player_one.charged_attack.damage_points + player_one.player.level;
        one_hp -=  player_two.monster.recoil;
    
    document.querySelector("div.one_tagged_in h1.hp").textContent = one_hp;
 //   document.querySelector("#roster_one .in_the_ring h1.hp").textContent = one_hp;

    

    document.querySelector("div.two_tagged_in h1.hp").textContent = two_hp;
 //   document.querySelector("#roster_two .in_the_ring h1.hp").textContent = two_hp;
    
    
    

    
    
    check_if_fainted();
    
    };
    console.log(document.querySelector("div.one_tagged_in p#charger").textContent);
 
};






function charger_check(){

    var charge_meter =  document.querySelector("div.one_tagged_in p#charger").textContent;
    var elem = document.querySelector(".one_tagged_in p#my_bar");
    var width = Math.floor((charge_meter * 100)/(player_one.charged_attack.damage_points/6));
    if (width >=100){
        width = 100;
        elem.style.width = width + "%"
        elem.innerText = width + "%";
        elem.style.backgroundColor = "#4CAF50";
        var flask = document.querySelector(".one_tagged_in img.power_flask");
        flask.classList.add("activated");

        flask.addEventListener("click", useChargedAttack);

    };
    if (width <= 99){
    elem.style.width = width + "%"
    elem.innerText = width + "%";
    elem.style.backgroundColor = "orangered";
    };
    if (width < 80){
        elem.style.width = width + "%"
        elem.innerText = width + "%";
        elem.style.backgroundColor = "orangered";
        };
    if (width < 30){
        elem.style.width = width + "%"
        elem.innerText = width + "%";
        elem.style.backgroundColor =  "rgb(19, 219, 233)";
        
        };



   set_health_bar();
    

};


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
    if (check_game_status() == "game on"){
    var one_hp = document.querySelector("div.one_tagged_in h1.hp").innerText;
    var two_hp = document.querySelector("div.two_tagged_in h1.hp").innerText;
    if (one_hp <= 0 ){
       // charger = 0;
         document.querySelector("div.in_the_ring p#charger").textContent = 0;
        
        document.querySelector("#roster_one .in_the_ring h1.hp").textContent = 0;
        
       let div = document.querySelector("div.one_tagged_in");
       div.parentNode.removeChild(div);
       let dead_div = document.querySelector("#roster_one div.in_the_ring");
       dead_div.classList.remove("available");
       dead_div.classList.add("unavailable");
       
       if(document.querySelectorAll("#roster_one div.available").length != 0){ 

        document.querySelectorAll("#roster_one div.available")[0].click();
        document.querySelector("div.one_tagged_in p#charger").textContent = 0;

        
       

        
        var image = document.querySelector(".one_tagged_in img.monster_image");
        var thumb_img = document.querySelector(".one_tagged_in img.monster_image_thumb");
  //      buttons[0].classList.remove("hide_button");
        image.classList.remove("hide_button");
        thumb_img.classList.add("hide_button");
        
 //       buttons[0].addEventListener("click", useAttack);
        charger_check();
        
       };
    };
    if (two_hp <= 0 ){
        document.querySelector("#roster_two .in_the_ring h1.hp").textContent = 0;
        let div = document.querySelector("#roster_two .in_the_ring");
        div.classList.remove("available");
        div.classList.add("unavailable");
        var fight_div = document.querySelector("div.two_tagged_in");
        fight_div.parentNode.removeChild(fight_div);
   

   var skull_count = 3 - document.querySelectorAll("#roster_two div.available").length;
   var new_skull = document.querySelector(".dead_head_" + skull_count);
   new_skull.classList.remove("hide_button");
   
        if(document.querySelectorAll("#roster_two div.available").length != 0){

        npc_tagIn(document.querySelectorAll("#roster_two div.available")[0]);
            document.querySelector("div.two_tagged_in p#charger").textContent = 0;
        };
     
    };
    charger_check
};
  
    check_game_status();

};




function check_game_status(){
        let ones = document.querySelectorAll("#roster_one .available").length;
        let twos = document.querySelectorAll("#roster_two .available").length;
    if(ones == 0 || twos == 0){
        declare_winner();
    return "game over";

} else {
    return "game on"
};
};

function declare_winner(){
    let ones = document.querySelectorAll("#roster_one .available").length;
    let twos = document.querySelectorAll("#roster_two .available").length;

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







function set_health_bar(){

    var health_meter =  document.querySelector("div.one_tagged_in h1.hp").textContent;
    var elem = document.querySelector(".one_tagged_in p#my_health_bar");
    var width = (health_meter/player_one.monster.hp) * 100;
    var show_health = Math.ceil(health_meter);
    
    if (width >=100){
        width = 100;
        elem.style.width = width + "%"
        elem.innerText =  show_health + "/" + player_one.monster.hp;
        elem.style.backgroundColor = "#4CAF50";

    };
    if (width <= 99){
        elem.style.width = width + "%"
        elem.innerText =  show_health + "/" + player_one.monster.hp;
        elem.style.backgroundColor = "#4CAF50";
    };
    if (width < 80){
        elem.style.width = width + "%"
        elem.innerText =  show_health + "/" + player_one.monster.hp;
        elem.style.backgroundColor = "#4CAF50";
        };
    if (width < 30){
        elem.style.width = width + "%"
        elem.innerText =  show_health + "/" + player_one.monster.hp;
        elem.style.backgroundColor =  "rgb(255, 000, 000)";
        
        };

        
    var health_meter =  document.querySelector("div.two_tagged_in h1.hp").textContent;
    var elem = document.querySelector(".two_tagged_in p#bad_health_bar");
    
    var width = (health_meter/player_two.monster.hp) * 100;
    var show_health = Math.ceil(health_meter);
    
    if (width >=100){
        width = 100;
        elem.style.width = width + "%"
        elem.innerText =  show_health + "/" + player_two.monster.hp;
        elem.style.backgroundColor = "#4CAF50";

    };
    if (width <= 99){
        elem.style.width = width + "%"
        elem.innerText =  show_health + "/" + player_two.monster.hp;
        elem.style.backgroundColor = "#4CAF50";
    };
    if (width < 80){
        elem.style.width = width + "%"
        elem.innerText =  show_health + "/" + player_two.monster.hp;
        elem.style.backgroundColor = "#4CAF50";
        };
    if (width < 30){
        elem.style.width = width + "%"
        elem.innerText =  show_health + "/" + player_two.monster.hp;
        elem.style.backgroundColor =  "rgb(255, 000, 000)";
        
        };
}










/* NPC BATTLE CODES */

var npcCharger = 0;


function npcUseAttack(){
    
    if(check_game_status() == "game on" && readyPlayerOne() == true){
    
    var one_hp = document.querySelector("div.one_tagged_in h1.hp").innerText;
    var two_hp = document.querySelector("div.two_tagged_in h1.hp").innerText;
    if( Math.floor(Math.random() * 21) + player_two.monster.attack >= 8 + player_one.monster.counter){
        one_hp -=  player_two.fast_attack.damage_points + player_two.monster.recoil + Math.floor(player_two.player.level/3);
        two_hp -=  player_one.monster.recoil;
        
        
        npcCharger += .5 + player_two.player.level/3;
    } else if (check_game_status() == "game on" && readyPlayerOne() == false){
        npcUseAttack();
    } else {
        
    };
    document.querySelector("div.one_tagged_in h1.hp").textContent = one_hp;
    document.querySelector("#roster_one .in_the_ring h1.hp").textContent = one_hp;
    
    document.querySelector("div.two_tagged_in h1.hp").textContent = two_hp;
    document.querySelector("#roster_two .in_the_ring h1.hp").textContent = two_hp;
    
    
    document.querySelector("#roster_two .in_the_ring p#charger").textContent = npcCharger;
    document.querySelector("div.two_tagged_in p#charger").textContent = npcCharger;
    
    npc_charger_check();
    check_if_fainted();
    
};
};




function npcUseChargedAttack(){
    if (check_game_status() == "game on" && readyPlayerOne() == true){
    
    var one_hp = document.querySelector("div.one_tagged_in h1.hp").innerText;
    var two_hp = document.querySelector("div.two_tagged_in h1.hp").innerText;
        one_hp -=  player_two.charged_attack.damage_points + player_two.player.level;
        two_hp -=  player_one.monster.recoil;
    npcCharger = 0;
    document.querySelector("div.one_tagged_in h1.hp").textContent = one_hp;
    document.querySelector("#roster_one .in_the_ring h1.hp").textContent = one_hp;
    
    document.querySelector("div.two_tagged_in h1.hp").textContent = two_hp;
    document.querySelector("#roster_two .in_the_ring h1.hp").textContent = two_hp;
    
    
    document.querySelector("div.two_tagged_in p#charger").textContent = npcCharger;
    
 
    console.log("used charged attack");
    check_if_fainted();
    
    } else if(check_game_status() == "game on" && readyPlayerOne() == false){
        npcUseAttack();
    };
    set_health_bar();
};

                             








function npc_charger_check(){
    var npc_charge_meter =  document.querySelector("div.two_tagged_in p#charger").textContent;
   
if (npc_charge_meter >= (player_two.charged_attack.damage_points/6)){
     npcUseChargedAttack();
};


set_health_bar();
};





function npcFight() {         //  create a loop function
    
    setTimeout(function() {   //  call a 3s setTimeout when the loop is called
                               //  your code here
      npcUseAttack();
      npc_charger_check();
                                
      if (check_game_status() != "game over") {           //  if the counter < 10, call the loop function
        npcFight();             //  ..  again which will trigger another 
      }                       //  ..  setTimeout()
    }, 330)
  }

  function readyPlayerOne(){
    var one = document.querySelector("div.one_tagged_in");
    return (one ? true:false);
     
  };




    function npc_tagIn(){

        
    var last = document.querySelector("#roster_two div.in_the_ring");

    if(last){
        last.classList.remove("in_the_ring");
    };

        var badGuys = document.querySelectorAll("#roster_two div.available");
        
        var next = badGuys[0];
    
       next.classList.add("in_the_ring");
   
    var arena = document.querySelector("div.arena");

      var new_div = next.cloneNode(true);
      new_div.classList.add("two_tagged_in");
      arena.appendChild(new_div);
      new_div.addEventListener("click", useAttack);
      var img = new_div.querySelector("img.monster_image");
      img.classList.remove("hide_button");
      
      


    };

































