class GhostS

  @pe: (val) -> "#{val}%"
  @px: (val) -> "#{val}px"

  constructor: ->
    style = document.createElement 'style'
    style.setAttribute 'media', 'screen'
    # Hack for WebKit
    style.appendChild document.createTextNode ''
    document.head.appendChild style
    @sheet = style.sheet
    @rulesIdx = 0

  add: (tag, properties) ->
    @sheet.insertRule "#{tag} {}", @rulesIdx
    rule = @sheet.cssRules[@rulesIdx]
    rule.style[key] = val for key, val of properties
    @rulesIdx++

Template.index.rendered = ->
  famousPolyfills

  stylesheet = new GhostS

  window.truc = stylesheet

  stylesheet.add 'html',
    width: GhostS.pe 100
    height: GhostS.pe 100
    margin: GhostS.px 0
    padding: GhostS.px 0
    overflow: 'hidden'
    # FIXME polyfill
    webkitTransformStyle: 'preserve-3d'
    transformStyle: 'preserve-3d'

  stylesheet.add 'body',
    backgroundColor: '#FF851B'
    position: 'absolute'
    width: GhostS.pe 100
    height: GhostS.pe 100
    margin: GhostS.px 0
    padding: GhostS.px 0
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
    top: GhostS.px 0
    left: GhostS.px 0
    bottom: GhostS.px 0
    right: GhostS.px 0
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
    top: GhostS.px 0
    left: GhostS.px 0
    bottom: GhostS.px 0
    right: GhostS.px 0
    overflow: 'visible'
    # FIXME polyfill
    webkitTransformStyle: 'preserve-3d'
    transformStyle: 'preserve-3d'
    # FIXME polyfill
    webkitBackfaceVisibility: 'visible'
    backfaceVisibility: 'visible'
    pointerEvents: 'none'
    width: GhostS.px 0
    height: GhostS.px 0
    margin: GhostS.px 0
    padding: GhostS.px 0


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
    width: GhostS.pe 100
    height: GhostS.pe 100

  window.mainCtx = famous.core.Engine.createContext()

  window.appView = new AppView()
  mainCtx.add appView
  appView.addDragger()
  appView.addBubbles()
