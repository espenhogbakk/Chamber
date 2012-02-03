$(function() {

  if (room) {

    var messages = new Chamber.Collections.MessagesCollection
    messages.url = '/rooms/' + room.id + '/messages'
    messages.fetch()
    
    var room_show_view = new Chamber.Views.Rooms.ShowView(
      {
        collection: messages,
        model: room,
        el: $("#room")
      }
    )

    var jug = new Juggernaut
    jug.subscribe("/observer", function(data){
        //console.log(data)
        //room_show_view.render()
      
        if (data.klass == 'Message') {
          console.log(messages.length)
          message = new Chamber.Models.Message(data.record)
          messages.add(message)
        }
      
    })
  }


})