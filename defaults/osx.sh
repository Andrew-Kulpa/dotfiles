# Defaults for OSX

SCREENSHOTS_FOLDER="${HOME}/Screenshots"

# Finder: show hidden files by default
echo "Enable: Show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true

# Display full POSIX path as Finder window title
echo "Enable: Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

###############################################################################
# Screen                                                                      #
###############################################################################
#### Sourced from: https://github.com/webpro/dotfiles/blob/master/macos/defaults.sh

# Require password immediately after sleep or screen saver begins
echo "Enable: Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the ~/Screenshots folder
echo "Enable: Save screenshots to the ~/Screenshots folder"
mkdir -p "${SCREENSHOTS_FOLDER}"
defaults write com.apple.screencapture location -string "${SCREENSHOTS_FOLDER}"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
echo "Enable: Save screenshots in PNG format"
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
echo "Enable: Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true