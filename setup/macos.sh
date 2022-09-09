#!/usr/bin/env bash
# Inspired by @mathiasbynens: https://mths.be/macos

clear

echo -e "\nThis computer will be configured with BinaryBen's personal preferences\n"

echo "Your password is required to continue"
sudo -v

# Keep-alive: update existing `sudo` time stamp until finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#################################
# Auto Confirm & Prompt functions
#################################

# These functions allow non-interactive usage of this script without configuration.

echo -e "\n\033[1;43m WARNING! \033[0m  \033[1;33mPrompts will automatically continue with defaults if they timeout.\033[0m\n"

# Set variables below in seconds:

TIMEOUT_PROMPT=60
TIMEOUT_CONFIRM=10

# Example: $ CONTINUE=$(auto_confirm true "Would you like to continue") 
# Output:  $ Would you like to continue? (Y/n)

function auto_confirm {

  # syntax: auto_confirm [default] [prompt]

  local _prompt _response

  if [ "$1" = true ] ; then _prompt="$2 (Y/n)"; else _prompt="$2 (y/N)"; fi

  while true; do
    read -p "$_prompt" -n 1 -r -t $TIMEOUT_CONFIRM _response
    case "$_response" in
      y|Y)
        return 0
        ;;
      n|N)
        return 1
        ;;
      "")
        echo "default"
        ;;
      *)
        ;;
    esac
  done

  echo -ne "\r\"$_response\""
}

TEST=$(auto_confirm false "Would you like to test now?")

echo -e "Test confirm returned: $TEST"

# Is this machine used for ...

# development (Y/n)
# engineering (Y/n)
# design (Y/n)
# gaming (Y/n)

############################
# Install or update Homebrew
############################

if command -v brew &> /dev/null
then
  echo -e "\nHomebrew already installed. Updating now...\n"
  brew update
  brew upgrade
else
  echo -e "\nHomebrew not found. Installing...\n"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

###################
# MacOS Preferences
###################



# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true





# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to downloads
defaults write com.apple.screencapture location -string "${HOME}/Downloads/Screenshots"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true





# Activity Monitor

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Disable the annoying line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

# System Preferences > Mission Controll > Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# System Preferences > Desktop & Screen Saver > Start after: Never
defaults -currentHost write com.apple.screensaver idleTime -int 0

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #




for app in "Dock" \
	"Finder" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done



echo -e "\nAll done. Note that some of these changes require a restart to take effect.\n"

# REBOOT=$(auto_confirm 0 "Reboot now?")

# echo -e "The previous function returned $REBOOT"

