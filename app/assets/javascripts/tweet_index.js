$(document).on('turbolinks:load',function(){
    $('.global__right-user-menu__link').hover(function(){
      $(".global__right-user-menu__link-pulldown:not(:animated)", this).stop().slideDown('fast');
    }, function(){
      console.log(this);
      $(".global__right-user-menu__link-pulldown",this).stop().slideUp('fast');
    });
});
