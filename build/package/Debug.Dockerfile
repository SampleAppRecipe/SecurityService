# SecurityService handles authenticating users and securing their information.
# Copyright (C) 2019 Holosym

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.



# Build the application using Go 1.13 on Alpine
FROM golang:1.13.1

# Receive package path for Go.
ARG PACKAGE

# Receive version for project.
ARG VERSION

# Receive the operating system the Go applications are built for
ARG GOOS=linux

# Receive the architecture the Go applications are built for
ARG GOARCH=amd64

# Define Go's layout path
ENV GOPATH=/work/

# Define where Go saves binaries
ENV GOBIN=${GOPATH}/bin

# This build type is purely for debugging
ENV BUILD_TYPE="debug"

# Define the working directory
WORKDIR /work/src/${PACKAGE}

# Copy project files to container
COPY ./ ./

# Build all applications in "cmd" directory
RUN bash scripts/build-cmd.bash

# The entry point will be directed towards the service executable
ENTRYPOINT [ "/work/bin/security-service" ]

# The health check will be directed towards the health check executable
HEALTHCHECK CMD [ "/work/bin/security-health" ]