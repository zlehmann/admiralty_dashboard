function captainIndex() {
    $('#captain_index').empty();
    $.get("/captains", (captList) => {
        $('#captain_index').append(`<li><a href="/captains/#{captList.id}>#{captList.name}</a></li><br>`);
    });
  }


function attachListeners() {
  $("button#btn_captains").click(function (e) {
    e.preventDefault;
    captainIndex();
  });
};

$(document).ready(
    attachListeners()
);