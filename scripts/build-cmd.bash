#!/bin/bash

# Build every application within the "cmd" directory
for dir in cmd/*/; do

    # Build as debug application
    if [[ -n BUILD_TYPE=="debug" ]]; then
        # Enable linking to C library so race detection is on
        CGO_ENABLED=1
        # Build the binaries into the Go bin directory
        go install -race $PACKAGE/$dir
    fi

    # Build as release application
    if [[ -n BUILD_TYPE=="release" ]]; then
        # Disable linking to C library so binary is completely static
        CGO_ENABLED=0
        # Build the binaries into the Go bin directory
        go install -ldflags="-s -w" $PACKAGE/$dir
        # Strip the binaries down
        strip --strip-unneeded $GOBIN/$(basename $dir)
    fi

done