# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
    perl
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
