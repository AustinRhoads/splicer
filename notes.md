fast_attack
  damage_points:integer
  element:string
  weakness_element:string
  strength_element:string
  belong_to_and_has_many :monsters

  
    
charged_attack
  damage_points:integer
  element:string
  weakness_element:string
  strength_element:string
  belong_to_and_has_many :monsters




  battles show original

  
<body class = "battles_show">
<h1>Fight</h1>


<div class = "grid-container">
<h2 class = "item_1"><%= @player_one.name %> VS. <%= @player_two.name %></h2>
<% @player_one.battle_party.monsters.each_with_index do |monster, index| %>
    <% if index == 0 %>
        <div class = "onesy grid item_<%= index + 2 %> one_tagged_in" >
        
            <p hidden id = "monster" ><%= monster.to_json %></p>
            <p hidden id = "fast_attack" ><%= monster.fast_attack.to_json %></p>
            <p hidden id = "charged_attack" ><%= monster.charged_attack.to_json %></p>
            <h1 class = "hp monster_<%= index + 1 %>"></h1>
            <p><%= monster.name %></p>
            <%= image_tag monster.image_url(:medium), :class => "monster_image" %>
            <%= image_tag monster.image_url(:thumb), :class => "monster_image_thumb hide_button" %>
            <button type = "button" class = "quick attack " ><%= monster.fast_attack.name %></button><br>
            <button type = "button" class = "charged attack hide_button" ><%= monster.charged_attack.name %></button>
            <p hidden id = "charger"></p>
            <div id = "my_progress">
            <div id = "my_bar"></div>
            
        </div>
        </div>
    <% else %>

        <div class = "onesy grid item_<%= index + 2 %>" >
        
             <p hidden id = "monster" ><%= monster.to_json %></p>
             <p hidden id = "fast_attack" ><%= monster.fast_attack.to_json %></p>
             <p hidden id = "charged_attack" ><%= monster.charged_attack.to_json %></p>
             <h1 class = "hp monster_<%= index + 1 %>"></h1>
             <p><%= monster.name %></p>
             <%= image_tag monster.image_url(:medium), :class => "monster_image hide_button" %>
             <%= image_tag monster.image_url(:thumb), :class => "monster_image_thumb" %>
             <button type = "button" class = "quick attack hide_button" ><%= monster.fast_attack.name %></button><br>
             <button type = "button" class = "charged attack hide_button" ><%= monster.charged_attack.name %></button>
             <p hidden id = "charger"></p>
             <div id = "my_progress">
             <div id = "my_bar"></div>
         </div>
        </div>
    <% end %>
<% end %>

<% @player_two.battle_party.monsters.each_with_index do |monster, index| %>
    <% if index == 0 %>
        <div class = "twosy grid item_<%= index + 5 %> two_tagged_in" >
             <p hidden id = "monster" ><%= monster.to_json %></p>
             <p hidden id = "fast_attack" ><%= monster.fast_attack.to_json %></p>
             <p hidden id = "charged_attack" ><%= monster.charged_attack.to_json %></p>
             <h1 class = "hp monster_<%= index + 4 %>"></h1>
            <p><%= monster.name %></p>
            <button type = "button" class = "quick attack " ><%= monster.fast_attack.name %></button><br>
            <button type = "button" class = "charged attack hide_button" ><%= monster.charged_attack.name %></button>
            <p hidden id = "charger"></p>
         
        </div>

    <% else %>
        <div class = "twosy grid item_<%= index + 5 %>">
             <p hidden id = "monster" ><%= monster.to_json %></p>
             <p hidden id = "fast_attack" ><%= monster.fast_attack.to_json %></p>
             <p hidden id = "charged_attack" ><%= monster.charged_attack.to_json %></p>
             <h1 class = "hp monster_<%= index + 4 %>"></h1>
            <p><%= monster.name %></p>
            <button type = "button" class = "quick attack hide_button" ><%= monster.fast_attack.name %></button><br>
            <button type = "button" class = "charged attack hide_button" ><%= monster.charged_attack.name %></button>
            <p hidden id = "charger"></p>
        </div>
    <% end %>
<% end %>
</div>

<%= link_to "Leave Battle", "/battles/#{@battle.id}/destroy", class: "destroy" %>

<%= form_for @battle, :url => { :action => "update" },  html: {class: "get_exp hide_button"}  do |f| %>
<%= f.hidden_field :user_won %>
<%= f.submit "Claim Experience Points" %>
<% end %>









BATTLES CSS ORIGINAL




.grid-container{
        display: grid;
        grid-template-columns: repeat(7, 101px);
     
       grid-auto-flow: row;
        grid-gap: 5px;
   
      }
      .item_1{
        grid-column: 1/8;
        grid-row: 1;
        text-align: center;
        border: 3px solid green;
        }
      
        .item_4{
            grid-column: 3;
            grid-row: 5;
            text-align: center;
        
        }
      
      
      
        .item_2{
          grid-column: 1;
        grid-row: 5;
        text-align: center;
        }
        .item_3{
          grid-column: 2;
          grid-row: 5;
          object-fit: fill;
          text-align: center;

        }
        .item_7{
          grid-column: 7;
          grid-row: 5;
          text-align: center;

        }
      
      
        .item_5{
          grid-column: 5;
          grid-row: 5;
          text-align: center;
        }
        .item_6{
            grid-column: 6;
            grid-row: 5;
            text-align: center;
          }
          .item_8{
            grid-column: 3/4;
            grid-row: 1;
          }
          .item_9{
            grid-column: 3;
            grid-row: 2/3;
          }
        
        
        
          .one_tagged_in{
            grid-column: 1/4;
            grid-row: 2/4;
            text-align: center;
            background-size: contain;
        }
      
        .two_tagged_in{
            grid-column: 5/8;
          grid-row: 2/4;
            text-align: center;
            background-color: rgb(196, 95, 0);
        
        }
      
        .monster_image{
          max-width:auto;
          max-height:100%;
          object-fit: contain;
        }
      
        .monster_image_thumb{
          max-width:100%;
          max-height:100%;
          object-fit: contain;
        }
      
        .hide_button{
            display: none;
        }
      
        .winner{
            grid-column: 1/8;
            grid-row: 2/5;
            text-align: center;
        }
      
        #my_progress{
          width: 100%;
          background-color: #ddd;
        }
      
        #my_bar{
          width: 10%;
          height: 30px;
        
          text-align: center;
          line-height: 30px;
          color: white;
        }
      
        div.clickEffect{
          position:fixed;
          box-sizing:border-box;
          border-style:solid;
          border-color:#FFFFFF;
          border-radius:50%;
          animation:clickEffect 0.4s ease-out;
          z-index:99999;
          }
        
        @keyframes clickEffect{
          0% {
             opacity:1;
             width:0.5em; height:0.5em;
             margin:-0.25em;
             border-width:0.5em;
           }
            100%{
                opacity:0.2;
                width:15em; height:15em;
                margin:-7.5em;
                border-width:0.03em;
              }
          }


        




















        BATTLES JS ORIGINAL







        
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
 //npcFight();   

};






var monsterBoxes = document.querySelectorAll("div.grid");

for(let x = 0; x < 3; x++){
     monsterBoxes[x].addEventListener("click", tagIn);
};



function tagIn(){
    var buttons = document.querySelectorAll(".one_tagged_in button");
    var images = document.querySelectorAll(".monster_image");
    var thumb_images = document.querySelectorAll(".monster_image_thumb");


    thumb_images.forEach(function(el){
        el.classList.remove("hide_button");
    });
    
        buttons.forEach(function(el){
            el.classList.add("hide_button");
        });

    

        images.forEach(function(el){
            el.classList.add("hide_button");
        });

      monsterBoxes.forEach(function(el){
          el.classList.remove("one_tagged_in");
      });

     this.classList.add("one_tagged_in");

    
    var buttons = document.querySelectorAll(".one_tagged_in button");

    var main_image = document.querySelector(".one_tagged_in img.monster_image");
   
    var thumb_img = document.querySelector(".one_tagged_in img.monster_image_thumb");
    
    
      if(buttons.length != 0){
      buttons[0].classList.remove("hide_button");
      main_image.classList.remove("hide_button");
      thumb_img.classList.add("hide_button");
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
        two_hp -=  player_one.fast_attack.damage_points + player_one.monster.recoil + Math.floor(player_one.player.level/3);
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
    
      var d=document.createElement("div");
      d.className="clickEffect";
      d.style.top=e.clientY+"px";d.style.left=e.clientX+"px";
      document.body.appendChild(d);
      d.addEventListener('animationend',function(){d.parentElement.removeChild(d);}.bind(this));
};
};




function useChargedAttack(){
    if (check_game_status() != "game over"){
    set_players();
    var one_hp = document.querySelector("div.one_tagged_in h1.hp").innerText;
    var two_hp = document.querySelector("div.two_tagged_in h1.hp").innerText;
        two_hp -=  player_one.charged_attack.damage_points + player_one.player.level;
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
    var elem = document.querySelector(".one_tagged_in div#my_bar");
    var width = Math.ceil((charge_meter * 100)/(player_one.charged_attack.damage_points/6));
    if (width >=100){
        width = 100;
        elem.style.width = width + "%"
        elem.innerText = width + "%";
        elem.style.backgroundColor = "#4CAF50";
    };
    if (width <= 99){
    elem.style.width = width + "%"
    elem.innerText = width + "%";
    elem.style.backgroundColor = "orangered";
    };
    if (width < 80){
        elem.style.width = width + "%"
        elem.innerText = width + "%";
        elem.style.backgroundColor = "#fbff29";
        };
    if (width < 30){
        elem.style.width = width + "%"
        elem.innerText = width + "%";
        elem.style.backgroundColor =  "rgb(19, 219, 233)";
        
        };
    


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
    if (check_game_status() == "game on"){
    var one_hp = document.querySelector("div.one_tagged_in h1.hp").innerText;
    var two_hp = document.querySelector("div.two_tagged_in h1.hp").innerText;
    if (one_hp <= 0 ){
       let div = document.querySelector("div.one_tagged_in");
       div.parentNode.removeChild(div);
       
       if(document.querySelectorAll("div.onesy").length != 0){ 
        document.querySelectorAll("div.onesy")[0].classList.add("one_tagged_in");
        document.querySelector("div.one_tagged_in p#charger").textContent = 0;

        
       

        var buttons = document.querySelectorAll(".one_tagged_in button");
        var image = document.querySelector(".one_tagged_in img.monster_image");
        var thumb_img = document.querySelector(".one_tagged_in img.monster_image_thumb");
        buttons[0].classList.remove("hide_button");
        image.classList.remove("hide_button");
        thumb_img.classList.add("hide_button");
        
        buttons[0].addEventListener("click", useAttack);
        charger_check();
        
       };
    };
    if (two_hp <= 0 ){
       let div =  document.querySelector("div.two_tagged_in");
       div.parentNode.removeChild(div);
       
        if(document.querySelectorAll("div.twosy").length != 0){
            document.querySelectorAll("div.twosy")[0].classList.add("two_tagged_in");
            document.querySelector("div.two_tagged_in p#charger").textContent = 0;
        };
     
    };
};
  
    check_game_status();
};




function check_game_status(){
        let ones = document.querySelectorAll("div.onesy").length;
        let twos = document.querySelectorAll("div.twosy").length;
    if(ones == 0 || twos == 0){
        declare_winner();
    return "game over";

} else {
    return "game on"
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
    
    if(check_game_status() == "game on" && readyPlayerOne() == true){
    
    var one_hp = document.querySelector("div.one_tagged_in h1.hp").innerText;
    var two_hp = document.querySelector("div.two_tagged_in h1.hp").innerText;
    if( Math.floor(Math.random() * 21) + player_two.monster.attack >= 8 + player_one.monster.counter){
        one_hp -=  player_two.fast_attack.damage_points + player_two.monster.recoil + Math.floor(player_two.player.level/3);
        two_hp -=  player_one.monster.recoil;
        console.log("hit");
        
        npcCharger += .5 + player_two.player.level/3;
    } else if (check_game_status() == "game on" && readyPlayerOne() == false){
        npcUseAttack();
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
    if (check_game_status() == "game on" && readyPlayerOne() == true){
    
    var one_hp = document.querySelector("div.one_tagged_in h1.hp").innerText;
    var two_hp = document.querySelector("div.two_tagged_in h1.hp").innerText;
        one_hp -=  player_two.charged_attack.damage_points + player_two.player.level;
        two_hp -=  player_one.monster.recoil;
    npcCharger = 0;
    document.querySelector("div.one_tagged_in h1.hp").textContent = one_hp;
    document.querySelector("div.two_tagged_in h1.hp").textContent = two_hp;
    document.querySelector("div.two_tagged_in p#charger").textContent = charger;
 
    console.log("used charged attack");
    check_if_fainted();
    
    } else if(check_game_status() == "game on" && readyPlayerOne() == false){
        npcUseAttack();
    };
};

                             








function npc_charger_check(){
    var npc_charge_meter =  document.querySelector("div.two_tagged_in p#charger").textContent;
   
if (npc_charge_meter >= (player_two.charged_attack.damage_points/6)){
     npcUseChargedAttack();
};
};





function npcFight() {         //  create a loop function
    setTimeout(function() {   //  call a 3s setTimeout when the loop is called
                               //  your code here
      npcUseAttack();
      npc_charger_check();
                                
      if (check_game_status() != "game over") {           //  if the counter < 10, call the loop function
        npcFight();             //  ..  again which will trigger another 
      }                       //  ..  setTimeout()
    }, 270)
  }

  function readyPlayerOne(){
    var one = document.querySelector("div.one_tagged_in");
    return (one ? true:false);
     
  };
