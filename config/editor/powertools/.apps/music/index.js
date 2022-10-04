// The MIT License (MIT)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER

/**
 * Is invoked on an event.
 */
exports.onEvent = async (args) => {
  const vscode = args.require('vscode');

  switch (args.event) {
    case 'on.command':
      // is invoked, when the web view has
      // been post a (command) message
      {
        const COMMAND_NAME = args.data.command;
        const COMMAND_DATA = args.data.data;

        if ('hello_from_webview_command' === COMMAND_NAME) {
          // this has been send from
          // 'mounted()' hook
          // in 'app.vue'

          // s. https://code.visualstudio.com/api/references/vscode-api
          vscode.window.showInformationMessage(
            "From 'app.vue': " + JSON.stringify(COMMAND_DATA, null, 2)
          );

          // send this back to 'app.vue'
          await args.post('hello_back_from_extension', {
            'message': 'Hello, Otto!'
          });
        }
      }
      break;

    case 'on.loaded':
      // page inside web view has been completely loaded
      break;

    case 'on.hidden':
      // web view has went to the background
      break;
    case 'on.shown':
      // web view has went to the foreground
      break;

    case 'on.close':
      // the web view is going to be closed
      break;

    case 'on.disposed':
      // the web view has been disposed
      break;
  }
};

/**
 * The web view is going to be disposed.
 */
exports.onDispose = (args) => {
};


/**
 * This returns the title, which is displayed in the tab
 * of the web view.
 */
exports.getTitle = () => {
  return "Music";
};

/**
 * This returns the Vue code for the body.
 */
exports.getHtml = (args) => {
  return args.readTextFile(
    __dirname + '/app.vue',
  );
};
