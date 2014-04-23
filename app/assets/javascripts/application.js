//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){
  $(document).foundation({
    abide : {
      patterns: {
        password: /(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/,
        alpha: /^[\wçğıöşüÇĞİÖŞÜ\-_\.,;\s]+$/
      }
    }
  });
});
