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

  $('#new_captain').on('submit', function(e) {
    e.preventDefault();
    let values = $(this).serialize();
    let posting = $.post('/captains', values);

    posting.done(function(data){
        console.log(data);
        var capt = new Captain(data);
        const htmlToAdd = capt.formatShow();
        $('#postResult').html(htmlToAdd);
    });
  });

  function Captain(captain){
    this.id = captain.id;
    this.name = captain.name;
    this.ships = captain.ships;
  }

  Captain.prototype.formatShow = function() {
    let captainHtml = `
      <h3>${this.name}</h3>
      <p>Has been enlisted in his majesty's navy!<p>`

    return captainHtml;
  }

  function makeCaptLink(captain) {
    $('#captain_index').append(`<li id="captid-${captain.id}"><a href="/captains/${captain.id}">${captain.name}</a><button id="infobutton-${captain.id}">More Info</button></li>`);
    $(`#infobutton-${captain.id}`).on('click', () => showCaptain(captain));
  }

  function showCaptain(captain) {
    let btn = document.getElementById(`infobutton-${captain.id}`);
    btn.style.display = "none";
    $(`#captid-${captain.id}`).append(`<ul id="show_captid-${captain.id}"></ul>`);
    $(`#show_captid-${captain.id}`).append(`<li>Age: ${captain.age}</li>`);
    $(`#show_captid-${captain.id}`).append(`<li>Under command of: ${captain.user.name}</li>`);
    $(`#show_captid-${captain.id}`).append(`<button id="capt-${captain.id}-ships">Captain's Ships</button>`);
    $(`#capt-${captain.id}-ships`).on('click', () => showShip(captain));
  }

  function showShip(captain) {
    $(`#show_captid-${captain.id}`).append(`<ul id="capt-${captain.id}-ship-list"></ul>`);
    $(`#capt-${captain.id}-ship-list`).empty();
    //$.get(`/ships.json`, (data) => {
    //  data.forEach(makeShipLink);
    //});
    captain.ships.forEach(makeShipLink);
  }

  function makeShipLink(ship) {
    $(`#capt-${ship.captain.id}-ship-list`).append(`<li id="ship-${ship.id}"><a href="/ships/${ship.id}">${ship.name}</a></li>`);
  }
})