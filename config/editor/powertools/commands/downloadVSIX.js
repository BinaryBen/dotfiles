const https = require('https')
const fs = require('fs')
const path = require('path')

const root = `${process.env.XDG_DOTFILES}/config/editor/profiles/full/data/extensions`

const next = (unprocessedExtensions, processedExtensions, vscode, output) => {
  if (unprocessedExtensions.length === 1) { // They're all done, this is just a remnant
    if (processedExtensions.length === 0) {
      vscode.window.showInformationMessage(`Cached extensions are already up to date`)
      output.dispose()
    } else {
      output.clear()
      output.appendLine(`Downloading ${processedExtensions.length} extension${processedExtensions.length == 1 ? '' : 's\n'}`)
      downloadExtensions(processedExtensions, vscode, output)
    }
  } else if (unprocessedExtensions.length > 1) { // Still getting metadata
    unprocessedExtensions.shift()
    generateDownloadList(unprocessedExtensions, processedExtensions, vscode, output)
  } else if (processedExtensions.length > 1) { // Still downloading
    processedExtensions.shift()
    downloadExtensions(processedExtensions, vscode, output)
  } else { // And done!
    vscode.window.showInformationMessage(`Extension update process finished`)
    output.dispose()
  }
}

const downloadExtensions = (extensions, vscode, output) => {
  extension = extensions[0]

  https.get(extension.url, (res) => {
    let vsix = ''
    res.setEncoding('binary')

    if (res.statusCode === 200) {
      output.appendLine(`Starting download of ${extension.name}`)
      output.append('|=')

      res.on('data', function(chunk){
        output.append(`${new Date().getTime() % 9 === 0 ? '=' : ''}`)
        vsix += chunk
      })

      res.on('end', function(){
        output.append('|')
        fs.writeFile(path.join(root, extension.filename), vsix, 'binary', function(err) {
          if (err) {
            output.appendLine(err)
          } else {
            output.append(` ✅ ${extension.filename} saved\n\n`)
          }
          next([], extensions, vscode, output)
        })
      })
    } else {
      output.appendLine(`⛔️ Download URL for ${extension.name} returned ${res.statusCode} status code`)
      output.appendLine(`   Manually download at: ${extension.url}\n`)
      setTimeout(() => {
        next([], extensions, vscode, output)
      }, 5000) // Slow down in case of rate limiting
    }
  })
}

const generateDownloadList = (unprocessedExtensions, processedExtensions, vscode, output) => {
  const extension = unprocessedExtensions[0]
  const publisher = extension.split('.')[0]
  const slug = extension.split('.')[1]
  const homepage = `https://marketplace.visualstudio.com/items?itemName=${extension}`

  output.appendLine(`\nFetching homepage for ${extension}`)
  output.append('Downloading metadata: |')

  https.get(homepage, (res) => {
    let body = ''

    if (res.statusCode === 200) {
      res.on('data', (data) => {
        body += data.toString()
        output.append('=')
      })

      res.on('end', () => {
        let version = body.match( /\"version\":\"[0-9]*.[0-9]*.[0-9]*\"/ ).toString()
        version = version.split(":")[1]
        version = version.replace(/"/g,"")

        let name = body.match( /<title>[\s\S]+<\/title>/ ).toString()
        name = name.split("- Visual Studio Marketplace")[0]
        name = name.replace(/<title>/g,"").replace(/\r?\n|\r/g, "").trim()

        const filename = `${extension}-${version}.vsix`

        output.append(`| ✅ ${name} (v${version})`)

        downloadURL = `https://${publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${publisher}/extension/${slug}/${version}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage`

        // * NOTE: This URL was getting 429 errors more often than not
        // ? NOTE: Also, this URL gets gzipped files rather than zipped files

        // downloadURL = `https://marketplace.visualstudio.com/_apis/public/gallery/publishers/${publisher}/vsextensions/${slug}/${version}/vspackage`

        if (!fs.existsSync(path.join(root, filename))) {
          output.appendLine('')
          processedExtensions.push({
            name,
            filename,
            url: downloadURL,
          })
        } else {
          output.append(' Status: Up to date\n')
        }

        next(unprocessedExtensions, processedExtensions, vscode, output)
      })
    } else {
      output.append(` ⛔️ ${res.statusCode}\n`)
      vscode.window.showErrorMessage(`Possible issue in manifest: ${extension} (${res.statusCode})`)
      next(unprocessedExtensions, processedExtensions, vscode, output)
    }
  })
}

exports.execute = async (args) => {
  const vscode = args.require('vscode')

  const output = vscode.window.createOutputChannel('Powertools')
  output.show()

  fs.readFile(`${root}/manifest`, 'utf8', function(err, data) {
    if (err) {
      vscode.window.showErrorMessage(`Could not read the manifest at ${root}`)
      output.dispose()
    } else {
      output.appendLine('Checking latest versions')
      generateDownloadList(data.split(/\r?\n/), [], vscode, output)
    }
  })
}
