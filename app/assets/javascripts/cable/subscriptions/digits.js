document.addEventListener("DOMContentLoaded",function(){
  var roomId = document.getElementsByClassName("js-room-id")[0].textContent

  App.digitChannel = App.cable.subscriptions.create({ channel: "DigitChannel", room: roomId }, {
    connected() {
      console.log("connected")
    },
    received(data) {
      var container = document.querySelector("#digits-container")
      container.innerHTML = ""

      data.forEach(function (e) {
        container.innerHTML += "<div class='d-inline border border-primary p-4 m-3'>" + e + "</div>"
      })
    }
  })
});
