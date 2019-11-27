$( document ).ready(function() {
  ('.rem-widget').live("click", function() {
    var currentId2 = (this).parents(".main-container").attr('id');
    ('#' + currentId2).hide('slow');

    var currentId2 = (this).parents(".nav-widget-add").attr('id');
    ('#' + currentId2).show('slow');
});

('.nav-widget-add').live("click", function() {
    var currentId2 = (this).parents(".main-containe").attr('id');
    ('#' + currentId2).show('slow');

    var currentId2 = (this).parents("").attr('id');
    ('#' + currentId2).hide('slow');
});
});
