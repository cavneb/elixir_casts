/**
 * Module dependencies
 */

var stack = require('poe-ui/server');

/**
 * Expose the app
 */

var app = module.exports = stack({});

app.builder.resolve.modulesDirectories.push('./src/modules');

app.builder.addES6({
  test: /.(js)$/,
  include: /ui-kit/
});
