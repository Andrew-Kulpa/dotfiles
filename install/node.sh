# Check if Angular CLI is installed
if ! command -v ng &> /dev/null; then
    echo "Angular CLI is not installed. Installing..."
    npm install -g @angular/cli
else
    echo "Angular CLI is already installed."
fi