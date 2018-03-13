App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # appends new messages to the html div with id messages 
    $('#messages').append "<div>#{data}</div>"


  speak: (message) ->
  # @perform goes to public speak action in the room_channel.
    @perform 'speak', message: message

  $(document).on "keypress", '[data-behavior ~= room_speaker]', (event) ->
    if event.keyCode is 13
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()