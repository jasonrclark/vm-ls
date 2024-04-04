#!/bin/bash

# Pinning go and gopls version to ensure compatibility
GO_VERSION="1.22.0"
GO_PLS_VERSION="v0.15.2"

# Download and extract Go
curl -sO https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz
tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
rm -rf go${GO_VERSION}.linux-amd64.tar.gz

# Set environment variables (required for installing go modules)
export GOPATH=/go
export GOCACHE=$GOPATH/cache

# Create a temporary directory for the Go module
temp_dir=$(mktemp -d)
cd "$temp_dir"
/usr/local/go/bin/go mod init temp

# Install gopls
/usr/local/go/bin/go install golang.org/x/tools/gopls@${GO_PLS_VERSION}

# Clean up
cd -
rm -rf "$temp_dir"