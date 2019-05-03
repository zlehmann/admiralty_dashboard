$(document).ready(function() {
  $("button#btn_captains").on('click', (e) => {
    e.preventDefault;
    captainIndex();
  })

  function captainIndex() {
    $('#captain_index').empty();
    $.get(`/captains.json`, (data) => {
        data.forEach(makeCaptLink);
    });
  }

  function makeCaptLink(captain) {
    $('#captain_index').append(`<li><a href="/captains/${captain.id}">${captain.name}</a></li><br>`);
  }
})