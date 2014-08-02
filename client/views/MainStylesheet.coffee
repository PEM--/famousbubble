window.mainStylesheet = new Gs

mainStylesheet.add 'html',
  width: Gs.p 100
  height: Gs.p 100
  margin: Gs.x 0
  padding: Gs.x 0
  overflow: 'hidden'
  # FIXME polyfill
  webkitTransformStyle: 'preserve-3d'
  transformStyle: 'preserve-3d'

mainStylesheet.add 'body',
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

mainStylesheet.add '.famous-container',
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

mainStylesheet.add '.famous-group',
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

mainStylesheet.add '.famous-surface',
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

mainStylesheet.add '.famous-container-group',
  position: 'relative'
  width: Gs.p 100
  height: Gs.p 100

mainStylesheet.add '.bubble-main-box',
  backgroundColor: '#FFDC00'
  borderRadius: '8px'

mainStylesheet.add '.bubble-bluebubble',
  backgroundColor: '#7FDBFF'
  border: '3px solid #0074D9'

mainStylesheet.add '.bubble-dragger',
  border: '2px solid #FF4136'
  backgroundColor: 'rgba(255, 255, 255, 0.5)'
