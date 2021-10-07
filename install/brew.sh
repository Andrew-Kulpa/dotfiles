# Install Homebrew (if not already installed) and update/upgrade

if ! command -v brew &> /dev/null
then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
brew upgrade

# Install packages


apps=(
    ansible
    awscli
    azure-cli
    bfg
    cocoapods
    cpanminus
    docker
    docker-compose
    freetds
    git
    git-filter-repo
    git-lfs
    gitleaks
    go
    graphviz
    jq
    tfsec
    mysql-client
    nmap
    node
    packer
    perltidy
    protobuf
    python@3.8
    terraform
    tflint
    tree
    vips
    watchman
    wget
)

brew install "${apps[@]}"
