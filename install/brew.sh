# Install Homebrew (if not already installed) and update/upgrade

if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew update
brew upgrade

# Install packages
## generate new list via `brew leaves`
apps=(
    ansible
    awscli
    azure-cli
    azure/functions/azure-functions-core-tools
    berkeley-db
    bfg
    cocoapods
    cpanminus
    diffutils
    docker
    docker-compose
    docker-machine
    docutils
    fbthrift
    freetds
    gh
    git
    git-filter-repo
    git-lfs
    gitleaks
    go
    golangci-lint
    graphviz
    groff
    guile
    jpeg
    jq
    libgsf
    libproxy
    libpthread-stubs
    microsoft/mssql-release/mssql-tools18
    mysql-client
    nmap
    node
    openconnect
    packer
    pmd
    protobuf
    pyenv-virtualenv
    qt
    scc
    szip
    terraform
    tflint
    tfsec
    tree
    vips
    watchman
    wget
    xmlto
)

brew install "${apps[@]}"
