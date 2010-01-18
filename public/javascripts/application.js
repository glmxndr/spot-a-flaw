$(function(){

  // TEXTILE PREVIEW
  $('textarea').each(function(){
    var self = $(this);
    var div = $('<div class="textile_preview">');
    var edit = $('<div class="edit content">');
    var preview = $('<div class="preview content">');

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
    self.resize(function(){
      preview.height(self.height());
    });
    self.resize();

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
  $('.toc:header').click(function(){
      $(this).next('div.toc').toggle();
  });

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

  $('div[id^=flash_]').fadeOut(5000);

});


SpotAFlaw = {};
$S = SpotAFlaw;

$S.sortTopicList = function(el, items){
  var self = $(el);
  var creation = self.hasClass('creation');
  var update = self.hasClass('update');
  var title = self.hasClass('title');
  items.selso({
    extract:function(e){
      return creation
        ?$('input.creation',e).val()
        :update
          ?$('input.update',e).val()
          :$('span.title',e).text();
    },
    type:'alpha',
    direction:$('input.sortby:checked').val() || 'asc'
  });
};

$S.sortFallacyList = function(el, items){
  var self = $(el);
  var creation = self.hasClass('creation');
  var update = self.hasClass('update');
  var shortname = self.hasClass('short');
  var title = self.hasClass('title');
  items.selso({
    extract:function(e){
      return creation
        ?$('input.creation',e).val()
        :update
          ?$('input.update',e).val()
            :shortname
              ?$('span.shortname',e).text()
              :$('span.title',e).text();
    },
    type:'alpha',
    direction:$('input.sortby:checked').val() || 'asc'
  });
};

