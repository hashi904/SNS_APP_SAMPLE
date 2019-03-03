$(document).on('turbolinks:load',function(){
  $('.profile-user-tweet__title li').click(function(){

    var index = $('.profile-user-tweet__title li').index(this);

    $('.profile-user-tweet-main__content').css('display','none');
    $('.profile-user-tweet-main__follow').css('display','none');
    $('.profile-user-tweet-main__follower').css('display','none');
    $('.profile-user-tweet__title li').removeClass('select__notice');

    $(this).addClass('select__notice');
    $('.profile-user-tweet-main .tab').eq(index).css('display','block');
  });
});
