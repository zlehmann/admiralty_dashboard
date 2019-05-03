$(document).ready(
  attachListeners()
);

function attachListeners() {
  $("button#btn_captains").on('click', (e) => {
    e.preventDefault;
    console.log("hello");
  });

  function captainIndex() {
    $('#captain_index').empty();
    $.get(`/captains.json`, (data) => {
        data.forEach(makeCaptLink);
    });
  }

  function makeCaptLink(captain) {
    $('#captain_index').append(`<li><a href="/captains/#{captain.id}>#{captain.name}</a></li><br>`);
  }

};


