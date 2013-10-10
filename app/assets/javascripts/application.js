// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
$(document).ready(function() {		
  $("#change-password-link").click(function(){  
         $("#change-password-box").toggle("slow");
         // http://stackoverflow.com/questions/10436231/tooltips-with-twitter-bootstrap
         $('[rel=tooltip]').tooltip()
  });
  $("#activate-channel-link").click(function(){  
         $("#cctivate-channel-box").toggle("slow");
         // http://stackoverflow.com/questions/10436231/tooltips-with-twitter-bootstrap
         $('[rel=tooltip]').tooltip()
  });
})


function toggle_visibility(id) {
 	    var e = document.getElementById(id);
	if(e.style.display == 'block')
	{
		e.style.display = 'none';
		event.preventDefault();
	}
	else
	{
	       e.style.display = 'block';
		event.preventDefault();
	}

}
