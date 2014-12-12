doSave = (html, options) ->
  unless options.filename
    options.filename = "document.pdf"
  
  if options.omit
    options.elementHandlers = {} unless options.elementHandlers
    for selector in options.omit
      options.elementHandlers[selector] = -> return true
    delete options.omit
  
  doc = new jsPDF options.orientation, options.unit, options.format
  
  onDone = ->
    doc.save options.filename
  
  doc.fromHTML html, options.x, options.y, options, onDone, options.margins
  return

Blaze.saveAsPDF = (templateOrView, options) ->
  options = {} unless options
  
  if options.data
    html = Blaze.toHTMLWithData templateOrView, options.data
  else
    html = Blaze.toHTML templateOrView
  
  doSave html, options
  return