$(function(){

  // COMMENT FORMS
  $('form.new_comment').hide().before('<span class="form comment toggle">Comment</span>');
  $('span.comment.form.toggle').click(function(){
    $(this).next('form.new_comment').toggle();
  });

  // TOC HEADERS
  $('.toc:header').click(function(){
      $(this).next('div.toc').toggle();
  });


});