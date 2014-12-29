makePDF = (html, options, callback) ->
  if options.omit
    options.elementHandlers = {} unless options.elementHandlers
    for selector in options.omit
      options.elementHandlers[selector] = -> return true
    delete options.omit
  
  doc = new jsPDF options.orientation, options.unit, options.format
  
  onDone = ->
    callback doc
  
  doc.fromHTML html, options.x, options.y, options, onDone, options.margins
  return

Blaze.outputAsPDF = (templateOrView, type, options, callback) ->
  if typeof callback isnt 'function' and typeof options is 'function'
    callback = options
    options = {}

  options = {} unless options
  
  if options.data
    html = Blaze.toHTMLWithData templateOrView, options.data
  else
    html = Blaze.toHTML templateOrView
  
  if type is 'save'
    unless options.filename
      options.filename = "document.pdf"

  makePDF html, options, (doc) ->
    result = doc.output type, options.filename
    if callback
      callback result
  return

Blaze.saveAsPDF = (templateOrView, options, callback) ->
  return Blaze.outputAsPDF templateOrView, 'save', options, callback
