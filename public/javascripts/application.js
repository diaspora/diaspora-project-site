// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function(){
  var repo = gh.repo("diaspora", "diaspora");
  var default_url = "404"//escape("https://joindiaspora.com/images/asterisk.png");
  repo.contributors(function(data){
    $.each(data["contributors"], function(key,val){
      var img = new Image();
      img.src = "http://gravatar.com/avatar/"+val["gravatar_id"]+"?d=" + default_url;
      img.height = 60;
      img.classList.add("faded")
      img.width = 60;
      img.onload = function(){
        $(".backing", "#contributors").append($(img).fadeIn());
      }
    });
  });
  
  $("img.faded").live('mouseover', function(){
    this.classList.remove("faded");
    this.classList.add("opaque");
    this.addEventListener("webkitTransitionEnd", function(){
      this.classList.remove("opaque");
      this.classList.add("faded");
    }, true)
  })
});
