//= require jquery
//= require jquery_ujs
//= require_self
//= require bootstrap-modal
//= require all
//= require github.js 

function randomOrder(){
  return (Math.round(Math.random())-0.5); 
}

$(document).ready(function(){
  var repo = gh.repo("diaspora", "diaspora"),
             default_url = "404";

  repo.contributors(function(data){
    var contributors = data['contributors'].sort(randomOrder);
    var contributions = 0;

    $.each(contributors, function(key,val){
      var img = new Image();
      img.src = "http://gravatar.com/avatar/"+val["gravatar_id"]+"?s=60&d=" + default_url;
      img.height = 60;
      img.id = val['login'];
      img.title = val['login'];
      img.width = 60;
      img.onload = function(){
        $("#contributors").append($(img).fadeIn());
      }
      contributions = parseInt(contributions) + val['contributions'];
    });

    $('#contributor-count').hide().html("<strong>" + contributions + "</strong> code commits from <strong>" + data['contributors'].length + "</strong> unique contributors & counting").fadeIn(1000);
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
