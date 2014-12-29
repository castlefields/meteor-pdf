/* global Package */

Package.describe({
  name: "ongoworks:pdf",
  summary: "Generate PDFs on the client from Meteor templates",
  version: "1.1.0",
  git: "https://github.com/ongoworks/meteor-pdf.git"
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@1.0');
  api.use(['blaze', 'coffeescript']);
  api.imply(['blaze']);
  api.addFiles(['jspdf.debug.js', 'pdf.coffee'], ['client']);
});
