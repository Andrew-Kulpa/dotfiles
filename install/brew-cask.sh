# Install cask packages

apps=(
    apache-directory-studio
    arc
    azure-data-studio
    dbeaver-community
    background-music
    clickup
    fig
    keka
    macdown
    maltego
    ngrok
    powershell
    visual-studio-code
    vlc
    wkhtmltopdf
    xquartz
    yt-music
)

brew install --cask "${apps[@]}"