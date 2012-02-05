Chamber.Views.Messages ||= {}

class Chamber.Views.Messages.MessageView extends Backbone.View
  template: JST["backbone/templates/messages/message"]
  
  #events:
  #  "click .destroy" : "destroy"

  initialize: () ->
    console.log("INIT MESSAGEVIEW", this)
    @model.bind('change', @render, this);

  tagName: "tr"
  
  #destroy: () ->
  #  @model.destroy()
  #  this.remove()
  #
  #  return false

  render: ->
    $(@el).html(@template(@model.toJSON()))
    return this
