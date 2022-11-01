// TODO: write your code here
document.addEventListener("DOMContentLoaded", function run () {
  function keyPress() { (e) => {
    if (e.charCode == "e"){
        var tile = document.querySelector("#player1_strip > .active");  // get player tile
        var nextTile = 'tile' + (tile.id[4] + 1) + 'e';  // get id of the next tile
        tile.className = "";
        document.getElementById(nextTile).className = "active";

    }
    else if (e.charCode == "d"){
        var tile = document.querySelector("#player2_strip > .active");  // get player tile
        var nextTile = 'tile' + (tile.id[4] + 1) + 'd';  // get id of the next tile
        tile.className = "";
        document.getElementById(nextTile).className = "active";

    }
    else{
        alert("Invalid key stroke");
    }
}

});
