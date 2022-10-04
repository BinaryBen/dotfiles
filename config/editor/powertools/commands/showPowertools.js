exports.execute = async (args) => {
  const vscode = args.require('vscode');

  vscode.window.showInformationMessage(
    `This will list available powertools`
  );
};