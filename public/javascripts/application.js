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

  var h2_cpt=0;
  $('h2.toc').each(function(){
      h2_cpt++;
      $(this).prepend(""+h2_cpt+".&nbsp;");
      var h3_cpt=0;
      $('h3.toc',$(this).next('div.toc')).each(function(){
          h3_cpt++;
          $(this).prepend(""+h2_cpt+"."+h3_cpt+".&nbsp;");
          var h4_cpt=0;
          $('h4.toc',$(this).next('div.toc')).each(function(){
              h4_cpt++;
              $(this).prepend(""+h2_cpt+"."+h3_cpt+"."+h4_cpt+".&nbsp;");
          });
      });
  });



});