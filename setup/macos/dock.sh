#!/usr/bin/env bash
# Update dock preferences

echo -e "\n\033[1;1mConfiguring the dock preferences:\033[1;0m\n"

echo -e "\033[1;90mResetting dock preferences to defaults...\033[1;0m"
defaults delete com.apple.dock;

echo -e "\033[1;90mRestarting dock with defaults applied...\033[1;0m"
killall Dock; sleep 10 # Sleep is needed for next step to work

echo -e "\033[1;90mWriting personal preferences now...\033[1;0m"

# Use mouse or trackpad to expose the hovered app
defaults write com.apple.dock scroll-to-open -bool TRUE;

# System Preferences > Dock > Size:
defaults write com.apple.dock tilesize -int 64

# System Preferences > Dock > Magnification:
defaults write com.apple.dock magnification -bool true

# System Preferences > Dock > Size (magnified):
defaults write com.apple.dock largesize -int 128

# System Preferences > Dock > Minimize windows using effect (suck|genie|scale)
defaults write com.apple.dock mineffect -string "suck"

# System Preferences > Dock > Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# System Preferences > Dock > Automatically hide and show the Dock:
defaults write com.apple.dock autohide -bool true

# System Preferences > Dock > Automatically hide and show the Dock (duration)
defaults write com.apple.dock autohide-time-modifier -float 0.5

# System Preferences > Dock > Automatically hide and show the Dock (delay)
defaults write com.apple.dock autohide-delay -float 0

# System Preferences > Dock > Show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

echo -e "\033[1;90mAdding apps to the dock...\033[1;0m"

# Remove all default icons from dock first
defaults write com.apple.dock persistent-apps -array

for app in "Applications/Chromium" \
  "System/Applications/Standard Notes" \
	"Applications/VSCodium" \
	"Applications/iTerm" \
  "Applications/Cider"; do
  defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/${app}.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
done

echo -e "\033[1;90mRestarting the dock with new preferences...\033[1;0m"

killall cfprefsd
killall Dock &> /dev/null
