#!/bin/bash

apt-get update
apt-get -yq install net-tools

GO_VERSION=1.18.1
curl -O https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz
tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz

export GOPATH=/go
export GOCACHE=$GOPATH/cache

# Create a temporary directory for the Go module
temp_dir=$(mktemp -d)

# Change to the temporary directory
cd "$temp_dir"

# Initialize a new Go module
/usr/local/go/bin/go mod init temp

# Install gopls
go install golang.org/x/tools/gopls@v0.14.2
# Install gopls version which is compatible with go
/usr/local/go/bin/go install golang.org/x/tools/gopls@v0.14.2

# Change back to the original directory
cd -

# Remove the temporary directory
rm -rf "$temp_dir"

echo "Go and gopls installed successfully."
