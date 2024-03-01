desired_version="3.12.2"

# install if not already in versions list
if ! pyenv versions | grep -q $desired_version; then
    echo "Installing Python $desired_version..."
    pyenv install $desired_version
fi

# Set the installed version of Python as the default
echo "Setting Python $desired_version as the default..."
pyenv global $desired_version