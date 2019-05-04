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
    $('#captain_index').append(`<li id="captid-${captain.id}"><a href="/captains/${captain.id}">${captain.name}</a><button id="captid-${captain.id}">More Info</button></li><br>`);
    $(`#captid-${captain.id}`).on('click', () => showCaptain(captain));
  }

  function showCaptain(captain) {
    $(`#captid-${captain.id}`).append(`<ul id="show_captid-${captain.id}"></ul>`);
    $(`#show_captid-${captain.id}`).append(`<li>Age: ${captain.age}</li>`);
    $(`#show_captid-${captain.id}`).append(`<li>Under command of: ${captain.user.name}</li>`);
  }
})