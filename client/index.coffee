Template.index.rendered = ->
  famousPolyfills
  mainCtx = famous.core.Engine.createContext()
  appView = new BubbleBox()
  mainCtx.add appView
  appView.addDragger()
  appView.addBubbles()
