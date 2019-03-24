$(document).on('turbolinks:load',function(){
  $('.signup-nickname__text_field').keyup(function(){
    var count = $(this).val().length;
    $('.signup-nickname__count').text("文字数: " + count);
  });

  $('.signup-username__text_field').keyup(function(){
    var count = $(this).val().length;
    $('.signup-username__count').text("文字数: " + count);
  });

  $('.signup-profile__text_field').keyup(function(){
    var count = $(this).val().length;
    $('.signup-profile__count').text("文字数: " + count);
  });
});
