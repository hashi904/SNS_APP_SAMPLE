$(document).on('turbolinks:load',function(){
   $('#search_text').keyup(function(){
    var countWord = $(this).val().length;
    console.log(countWord);
    $("#icon-search").prop('disabled', false);

    if(countWord == 0){
      $("#icon-search").prop('disabled', true);
    }
  });
});
