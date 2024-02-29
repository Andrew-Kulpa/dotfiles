# install perlbrew if its not installed
if command -v perlbrew &>/dev/null; then
    echo "perlbrew is already installed."
else
    echo "perlbrew is not installed. Installing perlbrew..."
    curl -L https://install.perlbrew.pl | bash
    echo "perlbrew installed successfully."

    echo "create and set default lib for perl-blead"
    perlbrew lib create perl-blead@main
    perlbrew switch perl-blead@main
fi

source ~/perl5/perlbrew/etc/bashrc

# initialize perlbrew if needed
if [[ -n "$PERLBREW_ROOT" && -d "$PERLBREW_ROOT" && -d "$PERLBREW_ROOT/bin" ]]; then
    echo "perlbrew is initialized."
else
    echo "perlbrew is not initialized. Initializing..."
    perlbrew init
fi

perlbrew install-cpanm

# setup perl-blead
if perlbrew list | grep -q "\*"; then
    echo "Perlbrew is enabled and a Perl version is selected."
    echo "Installing perl-blead and switching to it..."
    perlbrew install perl-blead
    perlbrew switch perl-blead
else
    echo "Perlbrew is not enabled or no Perl version is selected."
    echo "Please ensure perlbrew is enabled and a Perl version is selected before running this script."
fi

# install perl tidy and perl critic
cpanm -n Perl::Tidy Perl::Critic

