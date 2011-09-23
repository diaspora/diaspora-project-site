// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function randomOrder(){
  return (Math.round(Math.random())-0.5); 
}

$(document).ready(function(){
  var repo = gh.repo("diaspora", "diaspora");
  var default_url = "404"//escape("https://joindiaspora.com/images/asterisk.png");
  repo.contributors(function(data){
    var  contributors = data['contributors'].sort(randomOrder);
    $.each(contributors, function(key,val){
      var img = new Image();
      img.src = "http://gravatar.com/avatar/"+val["gravatar_id"]+"?d=" + default_url;
      img.height = 60;
      img.id = val['login'];
      img.classList.add("faded")
      img.width = 60;
      img.onload = function(){
        $("#contributors").append($(img).fadeIn("fast"));
      }
      var number = $('#number').text();
      number = parseInt(number) + val['contributions']
      $('#number').text(number);
    });
  });

  $("img.faded").live('mouseover', function(){
    this.classList.remove("faded");
    this.classList.add("opaque");
    this.addEventListener("webkitTransitionEnd", function(){
    }, true)
  });

  $("img.opaque").live('mouseout', function(){
      this.classList.remove("opaque");
      this.classList.add("faded");
  });
});
