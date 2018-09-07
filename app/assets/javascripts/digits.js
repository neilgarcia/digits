document.addEventListener("DOMContentLoaded",function(){
  var button = document.getElementById("js-roll")

  button.onclick = function() {
    var roomId = document.querySelector(".js-room-id").textContent
    App.digitChannel.send({room_id: roomId})
  }
});
