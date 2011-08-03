$(document).ready(function() {
  $('div.key').hide();
  
  $('a#showhide_key').hover(
    function() {
      $('div.key').show();
    },
    function () {
      $('div.key').hide();
    }
  );
});