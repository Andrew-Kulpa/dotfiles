# Install cask packages

apps=(
    apache-directory-studio
    arc
    azure-data-studio
    dbeaver-community
    background-music
    clickup
    docker
    fig
    google-drive
    keka
    lastpass
    macdown
    maltego
    ngrok
    powershell
    slack
    visual-studio-code
    vlc
    wkhtmltopdf
    xquartz
    yt-music
)

brew install --cask "${apps[@]}"