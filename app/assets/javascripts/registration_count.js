$(document).on('turbolinks:load',function(){
  $('.signup-nickname__text_field').keyup(function(){
    var count = $(this).val().length;
    console.log(count);
    $('.signup-nickname__count').text("文字数: " + count);
  });

  $('.signup-username__text_field').keyup(function(){
    var count = $(this).val().length;
    console.log(count);
    $('.signup-username__count').text("文字数: " + count);
  });
});
