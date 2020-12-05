


var monsters = document.querySelectorAll(".member");
    select_initial_battle_party();
    var div = document.querySelector("div#selected_members");
    div.lastChild.classList.add("swapable");
    swapable_member();




//defines all the members of your roster as the variable monsters




//redefines the div variable, checks to see if selected is already on the list, and then swaps the swappable element with a clone of the selected element or builds the div up to three

function select_member(){
    var div = document.querySelector("div#selected_members");
    var swap = document.querySelector("div#selected_members .swapable");
    var new_div = this.cloneNode(true);
    new_div.querySelector("input").checked = true;
    var new_div_name = JSON.parse(new_div.querySelector("p.data").innerText)["name"];
    if(!compile_div_names().includes(new_div_name)){
        new_div.classList.add("selected");
        if(div.childElementCount < 3){
        div.appendChild(new_div);
        new_div.click();
        } else {
         div.replaceChild(new_div, swap);
         swapable_member();
         new_div.click();
        };
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





//creates an array of current users current battle party



//adds select_member as a click event
//searches for the divs with the same name as the initial battle party

function select_initial_battle_party(){

//reads the ruby objects set battle_party and parses it into a javascript object

var initial_battle_party = JSON.parse(document.querySelector("#initial_battle_party").innerText);

    var names = [];

initial_battle_party.forEach(element => {
   names.push(element["name"]); 
});

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


//creates an array of currently selected monsters names

function compile_div_names(){
    var names = [];
    var div_list = [];

    var selects = document.querySelectorAll("div#selected_members div");
    selects.forEach(el => div_list.push(JSON.parse(el.querySelector("p.data").innerText)));
    
    div_list.forEach(element => {
        names.push(element["name"]); 
    });
    
    return names;

};




// <!-- <%= f.collection_check_boxes :monster_ids, current_user.monsters, :id, :name%><br> -->