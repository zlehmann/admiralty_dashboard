function captainIndex() {
    //$('#captain_index').empty();
    $.get("/captains", (captList) => {
        $('#captain_index').append(`<li><a href='*'>captList.name</a></li><br>`);
        $("#gameid-" + game.id).on('click', () => reloadGame(game.id));
    });
  }