ongoworks:pdf
=========================

A Meteor package that allows you to save a Meteor template as a PDF on the client. This package is simply a nice wrapper around [jsPDF](https://parall.ax/products/jspdf).

*Note: jsPDF HTML-to-PDF support is still experimental. Don't expect magic here.*

## Installation

```bash
$ meteor add ongoworks:pdf
```

## Usage

The `saveAsPDF` method will save/download to the browser's downloads folder (or prompt with Save As dialog, depending on browser settings).

```js
Blaze.saveAsPDF(Template.report, {
  filename: "report.pdf", // optional, default is "document.pdf"
  data: myData, // optional, render the template with this data context
  x: 0, // optional, left starting position on resulting PDF, default is 4 units
  y: 0, // optional, top starting position on resulting PDF, default is 4 units
  orientation: "landscape", // optional, "landscape" or "portrait" (default)
  unit: "in", // optional, unit for coordinates, one of "pt", "mm" (default), "cm", or "in"
  format: "letter" // optional, see Page Formats, default is "a4"
});
```

## Other Output Types

There are many other output types supported as well. All of these accept the same `options` as `saveAsPDF`.

```js
// API
Blaze.outputAsPDF(templateOrView, type, [options], callback);

// Examples

// ArrayBuffer
Blaze.outputAsPDF(Template.report, 'arraybuffer', function (arrayBuffer) {

});

// Blob
Blaze.outputAsPDF(Template.report, 'blob', function (blob) {

});

// Object URL
Blaze.outputAsPDF(Template.report, 'bloburi', function (objectUrl) {

});

// DataURI string
Blaze.outputAsPDF(Template.report, 'datauristring', function (dataUriString) {

});

// Opens the document in the current window/tab
Blaze.outputAsPDF(Template.report, 'datauri');

// Opens the document in a new window/tab
Blaze.outputAsPDF(Template.report, 'dataurlnewwindow');
```

## Page Formats

The `format` option may be any of the following format strings, which map to standard page sizes:

```
"a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "a8", "a9", "a10",
"b0", "b1", "b2", "b3", "b4", "b5", "b6", "b7", "b8", "b9", "b10",
"c0", "c1", "c2", "c3", "c4", "c5", "c6", "c7", "c8", "c9", "c10",
"dl", "letter", "government-letter", "legal", "junior-legal",
"ledger", "tabloid", "credit-card"
```

## Contributing

You are welcome to submit pull requests if you have ideas for fixing or improving the API.
