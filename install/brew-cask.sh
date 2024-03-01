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
    microsoft-edge
    ngrok
    powershell
    slack
    visual-studio-code
    vlc
    wkhtmltopdf
    xquartz
    yt-music
    zoom
)

brew install --cask "${apps[@]}"