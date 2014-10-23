css = new CSSC

css.add 'html',
  backgroundColor: CSSC.orange

css.add '.bubble-main-box',
  backgroundColor: CSSC.yellow
  borderRadius: CSSC.x 8

css.add '.bubble-bluebubble',
  backgroundColor: CSSC.aqua
  border: "#{CSSC.x 3} solid #{CSSC.blue}"

css.add '.bubble-dragger',
  backgroundColor: 'rgba(255, 255, 255, .5)'
  border: "#{CSSC.x 2} solid #{CSSC.red}"

