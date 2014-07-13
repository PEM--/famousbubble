Template.index.rendered = ->
  window.appView = new AppView()
  mainCtx.add appView
  appView.addDragger()
  appView.addBubbles()
