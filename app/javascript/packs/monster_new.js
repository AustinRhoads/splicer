 show_head();
 show_arms();
 show_legs();
 show_back();





var head_select = document.querySelector("select#monster_head_id");

head_select.addEventListener("click", show_head);
head_select.addEventListener("click", crisper);

function show_head(){
    
    var head_select = document.getElementById("monster_head_id");

    if(head_select.value){

    var head_image = document.querySelector("img.avatar_head_" + head_select.value);

    var all_head_images = document.querySelectorAll("img.head");
   
   all_head_images.forEach(el => el.classList.remove("selected"));
   
    head_image.classList.add("selected");
   
    };

};


var arms_select = document.querySelector("select#monster_arm_id");

arms_select.addEventListener("click", show_arms);
arms_select.addEventListener("click", crisper);

function show_arms(){
    
    var arms_select = document.getElementById("monster_arm_id");
    if(arms_select.value){
    var arms_image = document.querySelector("img.avatar_arms_" + arms_select.value);
    var all_arm_images = document.querySelectorAll("img.arms");
   
   all_arm_images.forEach(el => el.classList.remove("selected"));
    arms_image.classList.add("selected");
    
    };

};

var legs_select = document.querySelector("select#monster_leg_id");

legs_select.addEventListener("click", show_legs);
legs_select.addEventListener("click", crisper);

function show_legs(){
    
    var legs_select = document.getElementById("monster_leg_id");

    if(legs_select.value){

    var legs_image = document.querySelector("img.avatar_legs_" + legs_select.value);

    var all_leg_images = document.querySelectorAll("img.legs");
   
   all_leg_images.forEach(el => el.classList.remove("selected"));

    legs_image.classList.add("selected");
    
    };

};

var back_select = document.querySelector("select#monster_back_id");

back_select.addEventListener("click", show_back);
back_select.addEventListener("click", crisper);

function show_back(){
    
    var back_select = document.getElementById("monster_back_id");

    if( back_select.value){

    var back_image = document.querySelector("img.avatar_back_" + back_select.value);

    var all_back_images = document.querySelectorAll("img.back");
   
   all_back_images.forEach(el => el.classList.remove("selected"));

    back_image.classList.add("selected");

    };


};


var my_canvas = document.querySelector("#my_canvas");
var ctx = my_canvas.getContext("2d");
const grid = document.querySelector(".avatar_grid");
var other_canvas = document.querySelector("#other_canvas");
var ctx_2 = other_canvas.getContext("2d");




function crisper(){
    ctx.clearRect(0, 0, my_canvas.width, my_canvas.height);
    ctx_2.clearRect(0, 0, other_canvas.width, other_canvas.height);
        var images_head = document.querySelector("img.head.selected");
        var images_arms = document.querySelector("img.arms.selected");
        var images_legs = document.querySelector("img.legs.selected");
        var images_back = document.querySelector("img.back.selected");

        var images_array = [images_back, images_legs, images_arms, images_head ];

        var filtered = images_array.filter(function (el) {
            return el != null;
        });

        filtered.forEach(img => ctx_2.drawImage(img, 0,0));
        hi_res_draw(other_canvas);

};


  // scale the 1000x669 image in half to 500x334 onto a temp canvas
  

  // scale the 500x335 canvas in half to 250x167 onto the main canvas

function hi_res_draw(img){
    

    for(let x = 0; x < 33; x++){
        var c1 = scaleIt(img,0.99999999999999999);
        };

        my_canvas.width = c1.width/2;
        my_canvas.height = c1.height/2;
    ctx.drawImage(c1, 0,0, c1.width, c1.height, 0, 0,  my_canvas.width, my_canvas.height);

};





function scaleIt(source,scaleFactor){
  var c = document.createElement('canvas');
  var ctx = c.getContext('2d');
  var w = source.width*scaleFactor;
  var h = source.height*scaleFactor;
  c.width = w;
  c.height = h;
  ctx.drawImage(source,0,0,w,h);
  return(c);
}

document.getElementById('create-drawing').addEventListener('click', image_printer);


function image_printer(){

    const dataURI = other_canvas.toDataURL("image/png");

    var dataImg = document.createElement('img');

    dataImg.src = dataURI;

    var drawingField = document.createElement('div');

    drawingField.innerHTML = "<input type='hidden' name='monster[image]' id='monster_image' value='" + dataImg.src + "'>" ;

    document.getElementById('monster_image').value = dataURI;
 

    
};








