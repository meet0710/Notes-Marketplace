/*eslint-env es6*/
/* eslint-disable*/



/* ===========================
        Modal
============================ */
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("download");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}



/* ===========================
        Mobile Menu
============================ */

$(function() {

    //Show mobile navigation
    $("#mobile-nav-open-btn").click(function() {
        
        $("#mobile-nav").css("height", "100%");
        
    });
    
    //Hide mobile navigation
    $("#mobile-nav-close-btn, #mobile-nav a").click(function() {
        
        $("#mobile-nav").css("height", "0%");
        
    });
    
	
});


$(function(){
	$(".dropdown").click(function(){
		$(this).find(".dropdown-content").toggleClass("show");
	})
})

$(document).on("click", function(event){
        var $trigger = $(".dropdown");
        if($trigger !== event.target && !$trigger.has(event.target).length){
            $(".dropdown-content").removeClass("show");
        }            
    });
