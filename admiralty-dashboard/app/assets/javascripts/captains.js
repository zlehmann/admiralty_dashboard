document.addEventListener("turbolinks:load", function() {
  $(".btn_captains").on('click', (e) => {
    e.preventDefault();
    captainIndex();
  })

  function captainIndex() {
    $('#captain_index').empty();
    $.get(`/captains.json`, (data) => {
        data.forEach(makeCaptLink);
    });
  }

  $(".btn_a_capts").on('click', (e) => {
    e.preventDefault();
    sortedCapt();
  })

  function sortedCapt() {
    $('#captain_index').empty();
    $.get('/captains.json', (data) => {
      data.sort(function(a, b) {
        var nameA = a.name.toUpperCase(); // ignore upper and lowercase
        var nameB = b.name.toUpperCase(); // ignore upper and lowercase
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }

        // names must be equal
        return 0;
      })
      data.forEach(makeCaptLink);
    });
  }

  function makeCaptLink(captain) {
    $('#captain_index').append(`<li id="captid-${captain.id}"><a href="/captains/${captain.id}">${captain.name}</a><button id="infobutton-${captain.id}">More Info</button></li>`);
    $(`#infobutton-${captain.id}`).on('click', () => showCaptain(captain));
  }

  function showCaptain(captain) {
    let btn = document.getElementById(`infobutton-${captain.id}`);
    btn.style.display = "none";
    $.get(`/captains/${captain.id}.json`, (data) => {
      $(`#captid-${data.id}`).append(`<ul id="show_captid-${data.id}"></ul>`);
      $(`#show_captid-${data.id}`).append(`<li>Age: ${data.age}</li>`);
      $(`#show_captid-${data.id}`).append(`<li>Under command of: ${data.user.name}</li>`);
      $(`#show_captid-${data.id}`).append(`<button id="capt-${data.id}-ships">Captain's Ships</button>`);
      $(`#capt-${data.id}-ships`).on('click', () => showShip(captain));
    })
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