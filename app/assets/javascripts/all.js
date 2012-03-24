$(document).ready(function(){
  $('#overlay_container a,ul.pills a').live('click', function(evt){
    var link = $(this).attr('href');
    if(link.charAt(0) === '#')
      var anchor = $(link);
      var offset = anchor.offset().top - 80;
      evt.preventDefault();
      window.scrollTo(0, offset); 
  });
});
