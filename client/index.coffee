Template.index.rendered = ->
  $(document).ready ->
    window.appView = new AppView()
    mainCtx.add appView
    appView.addDragger()
    appView.addBubbles()
