// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function () {
  $('#questions th a, #questions .pagination a').on('click', function () { //
    $.getScript(this.href);
    return false;
  });

  $('#questions_search input').keyup(function () {
    $.get($("#questions_search").attr("action"), $("#questions_search").serialize(), null, 'script');
    return false;
  });
});
