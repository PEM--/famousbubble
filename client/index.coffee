Template.index.rendered = ->
  famousPolyfills

  stylesheet = new Gs

  stylesheet.add 'html',
    width: Gs.p 100
    height: Gs.p 100
    margin: Gs.x 0
    padding: Gs.x 0
    overflow: 'hidden'
    # FIXME polyfill
    webkitTransformStyle: 'preserve-3d'
    transformStyle: 'preserve-3d'

  stylesheet.add 'body',
    backgroundColor: '#FF851B'
    position: 'absolute'
    width: Gs.p 100
    height: Gs.p 100
    margin: Gs.x 0
    padding: Gs.x 0
    # FIXME polyfill
    webkitTransformStyle: 'preserve-3d'
    transformStyle: 'preserve-3d'
    # FIXME iOS only?
    webkitFontSmoothing: 'antialiased'
    webkitTapHighlightColor: 'transparent'
    webkitPerspective: 0
    perspective: 'none'
    overflow: 'hidden'

  stylesheet.add '.famous-container',
    position: 'absolute'
    top: Gs.x 0
    left: Gs.x 0
    bottom: Gs.x 0
    right: Gs.x 0
    overflow: 'visible'
    # FIXME polyfill
    webkitTransformStyle: 'preserve-3d'
    transformStyle: 'preserve-3d'
    # FIXME polyfill
    webkitBackfaceVisibility: 'visible'
    backfaceVisibility: 'visible'
    pointerEvents: 'none'

  stylesheet.add '.famous-group',
    position: 'absolute'
    top: Gs.x 0
    left: Gs.x 0
    bottom: Gs.x 0
    right: Gs.x 0
    overflow: 'visible'
    # FIXME polyfill
    webkitTransformStyle: 'preserve-3d'
    transformStyle: 'preserve-3d'
    # FIXME polyfill
    webkitBackfaceVisibility: 'visible'
    backfaceVisibility: 'visible'
    pointerEvents: 'none'
    width: Gs.x 0
    height: Gs.x 0
    margin: Gs.x 0
    padding: Gs.x 0

  stylesheet.add '.famous-surface',
    position: 'absolute'
    # FIXME polyfill
    webkitTransformOrigin: 'center center'
    transformOrigin: 'center center'
    # FIXME polyfill
    webkitBackfaceVisibility: 'hidden'
    backfaceVisibility: 'hidden'
    # FIXME polyfill
    webkitTransformStyle: 'flat'
    transformStyle: 'preserve-3d'
    # FIXME polyfill
    webkitBoxSizing: 'border-box'
    mozBoxSizing: 'border-box'
    # FIXME iOS only?
    webkitTapHighlightColor: 'transparent'
    pointerEvents: 'auto'

  stylesheet.add '.famous-container-group',
    position: 'relative'
    width: Gs.p 100
    height: Gs.p 100

  window.mainCtx = famous.core.Engine.createContext()

  window.appView = new AppView()
  mainCtx.add appView
  appView.addDragger()
  appView.addBubbles()
