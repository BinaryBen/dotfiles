exports.execute = async (args) => {
  const vscode = args.require('vscode');

  vscode.window.showInformationMessage(
    `Hello, from ${process.env.XDG_DOTFILES}`
  );
};