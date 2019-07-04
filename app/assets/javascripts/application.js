//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap


$(document).on("turbolinks:load", function () {
  $('#modal').on('hidden.bs.modal', function () {
    Turbolinks.visit(window.location, { action: 'replace' })
  });
});

