# Script to install Cloudsmith CLI on Darwin systems
#!/bin/bash
# Check if the script is being run on a Darwin system
if [[ "$(uname)" != "Darwin" ]]; then
  echo "This script is only intended for Darwin systems."
  exit 1
fi
# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Please install Homebrew first."
  exit 1
fi
# Install Cloudsmith CLI using Homebrew
brew install cloudsmith-cli
# Verify the installation
if command -v cloudsmith &> /dev/null; then
  echo "Cloudsmith CLI has been successfully installed."
else
  echo "Failed to install Cloudsmith CLI."
  exit 1
fi  