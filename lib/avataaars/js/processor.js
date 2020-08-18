// Setup imports
try {
  const Module = require('module');
  // resolve libraries from the CWD instead of where this script is located
  const libraryPaths = Module._nodeModulePaths(process.cwd());
  var React = require(require.resolve('react', { paths: libraryPaths }));
  var ReactDOMServer = require(require.resolve('react-dom/server', { paths: libraryPaths }));
  var Avatar = require(require.resolve('avataaars', { paths: libraryPaths })).default;
} catch (e) {
  process.stdout.write(JSON.stringify(['err', e.toString()]));
  process.stdout.write("\n");
  process.exit(1);
}
process.stdout.write("[\"ok\"]\n");

const _createAvatar = (async (options) => {
  return ReactDOMServer.renderToString(
    React.createElement(Avatar, options)
  );
});

function _handleError(error) {
  if (error instanceof Error) {
    process.stdout.write(
      JSON.stringify(['err', error.toString().replace(new RegExp('^' + error.name + ': '), ''), error.name])
    );
  } else {
    process.stdout.write(JSON.stringify(['err', error.toString()]));
  }
  process.stdout.write("\n");
}

// Interface for communicating between Ruby processor and Node processor
require('readline').createInterface({
  input: process.stdin,
  terminal: false,
}).on('line', function(line) {
  try {
    Promise.resolve(_createAvatar.apply(null, JSON.parse(line)))
      .then(function (result) {
        process.stdout.write(JSON.stringify(['ok', result]));
        process.stdout.write("\n");
      })
      .catch(_handleError);
  } catch(error) {
    _handleError(error);
  }
});
