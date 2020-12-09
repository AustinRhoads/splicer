 





var head_select = document.querySelector("select#monster_head_id");

head_select.addEventListener("click", show_head);

function show_head(){
    
    var head_select = document.getElementById("monster_head_id");
    var head_image = document.querySelector("img.avatar_head_" + head_select.value);
    var all_head_images = document.querySelectorAll("img.head");
   
   all_head_images.forEach(el => el.classList.add("hide_img"));
    head_image.classList.remove("hide_img");
   


};


var arms_select = document.querySelector("select#monster_arm_id");

arms_select.addEventListener("click", show_arms);

function show_arms(){
    
    var arms_select = document.getElementById("monster_arm_id");
    var arms_image = document.querySelector("img.avatar_arms_" + arms_select.value);
    var all_arm_images = document.querySelectorAll("img.arms");
   
   all_arm_images.forEach(el => el.classList.add("hide_img"));
    arms_image.classList.remove("hide_img");
    


};

var legs_select = document.querySelector("select#monster_leg_id");

legs_select.addEventListener("click", show_legs);

function show_legs(){
    
    var legs_select = document.getElementById("monster_leg_id");
    var legs_image = document.querySelector("img.avatar_legs_" + legs_select.value);
    var all_leg_images = document.querySelectorAll("img.legs");
   
   all_leg_images.forEach(el => el.classList.add("hide_img"));
    legs_image.classList.remove("hide_img");
    


};

var back_select = document.querySelector("select#monster_back_id");

back_select.addEventListener("click", show_back);

function show_back(){
    
    var back_select = document.getElementById("monster_back_id");
    var back_image = document.querySelector("img.avatar_back_" + back_select.value);
    var all_back_images = document.querySelectorAll("img.back");
   
   all_back_images.forEach(el => el.classList.add("hide_img"));
    back_image.classList.remove("hide_img");
    


};




