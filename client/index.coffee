Template.index.rendered = ->
  mainCtx = famous.core.Engine.createContext()
  window.appView = new BubbleBox()
  mainCtx.add appView
