$(function(){

  // TEXTILE PREVIEW
  $('textarea').each(function(){
    var self = $(this);
    var div = $('<div class="textile_preview"/>');
    var edit = $('<div class="edit content"/>');
    var preview = $('<div class="preview content"/>');

    div.append(edit);
    div.append(preview);
    div.append('<hr/>');

    self.after(div);
    self.remove().appendTo(edit);
    self.after('<a class="tip" href="http://textile.thresholdstate.com/">Format your content with Textile</a>');

    self.keyup(function(){
      preview.html($.textile(self.val()));
    });
    self.keyup();

  });

  // COMMENT FORMS
  $('div.comment form.new_comment').hide().before('<span class="form comment toggle">Comment</span>');
  $('span.comment.form.toggle').click(function(){
    $(this).next('form.new_comment').toggle();
  });

  $('div.comment_head').click(function(){
    $(this).next('div.comment_body').toggle();
  });


  // TOC HEADERS

  $('div.toc.forum').each(function(){
    var self = $(this);
    var closeAll = $('<span/>')
      .append('Close all')
      .addClass('action')
      .click(function(){
        $('div.comment_body',self).hide();
      });
    var openAll  = $('<span/>')
      .append('Open all')
      .addClass('action')
      .click(function(){
        $('div.comment_body',self).show();
      });
      self
        .prepend(closeAll)
        .prepend('&nbsp;')
        .prepend(openAll);

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

  $('h2,h3,h4,h5').filter('.toc').each(function(){
    var self = $(this);
    var span = $("<span class='ui-icon ui-icon-triangle-2-n-s'>&nbsp;</span>");
    self.prepend(span);
    span.click(function(){
      self.next('div.toc').slideToggle('fast');
    });
  });


  $('div[id^=flash_]').fadeOut(5000);

});



$(function(){

  var items = $('ul.list li');
  $('span.action.sortby').click(function(){
    $('span.action.sortby span').remove();
    var self = $(this);
    var arrow = $("<span class='ui-icon'>&nbsp;</span>");
    self.prepend(arrow);
    var sortDir;
    if (self.hasClass('asc')){
      sortDir="desc";
      arrow.addClass('ui-icon-triangle-1-n');
      self.addClass('desc').removeClass('asc');
    }
    else {
      sortDir = "asc";
      arrow.addClass('ui-icon-triangle-1-s');
      self.addClass('asc').removeClass('desc');
    }
    var sortby = self.attr('alt');
    var extractFn = function(e){
      return $('span.'+sortby,e).text();
    };
    items.selso({
      extract:extractFn,
      type:'alpha',
      direction:sortDir
    });
  });

  $('span.action.sortby[alt=title]').click();

});


