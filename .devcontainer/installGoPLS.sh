#!/bin/bash

apt-get update
apt-get -yq install golang
export GOPATH=/go
export GOCACHE=$GOPATH/cache

# Create a temporary directory for the Go module
temp_dir=$(mktemp -d)

# Change to the temporary directory
cd "$temp_dir"

# Initialize a new Go module
go mod init temp

# Install gopls
go install golang.org/x/tools/gopls@latest

# Change back to the original directory
cd -

# Remove the temporary directory
rm -rf "$temp_dir"
