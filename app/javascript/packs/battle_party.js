

window.onload = function(){

    select_initial_battle_party();
    var div = document.querySelector("div#selected_members");
    div.lastChild.classList.add("swapable");

};

//defines all the members of your roster as the variable monsters

var monsters = document.querySelectorAll(".member");


//redefines the div variable and swaps the swappable element with a clone of the selected element or builds

function select_member(){
    var div = document.querySelector("div#selected_members");
    var swap = document.querySelector("div#selected_members .swapable");
    var new_div = this.cloneNode(true);
    new_div.classList.add("selected");
    if(div.childElementCount < 3){
    div.appendChild(new_div);
    } else {
     div.replaceChild(new_div, swap);
     swapable_member();
    };
};

//selects a selected div and makes it swapable

function swapable_member(){
    var selects = document.querySelectorAll("div#selected_members div");
    for(let x=0; x < selects.length; x++){
        selects[x].addEventListener("click", function(){
           selects.forEach(el => el.classList.remove("swapable"));
            this.classList.toggle("swapable");
        });
    };

};

//reads the ruby objects set battle_party and parses it into a javascript object

var initial_battle_party = JSON.parse(document.querySelector("#initial_battle_party").innerText);



//creates an array of current users current battle party
var names = [];

initial_battle_party.forEach(element => {
   names.push(element["name"]); 
});


//adds select_member as a click event
//searches for the divs with the same name as the initial battle party

function select_initial_battle_party(){

    for(let x = 0; x < monsters.length; x++ ){
        monsters[x].addEventListener("click", select_member)
    };

    for(let x = 0; x < monsters.length; x++){
        var monster_name = JSON.parse(monsters[x].querySelector("p").innerText)["name"];
        if(names.includes(monster_name)){
         
          monsters[x].click();
        };

    };
};
//needs to show the current battle party up top
//needs to select current battle party with one being 'changable'
//selectmember must replace the swapable member