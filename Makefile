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

# Define the package path for Go
PACKAGE := github.com/SampleAppRecipe/SecurityService

# Define the image path for Docker
DOCKER_IMAGE := sampleapprecipe/security-service

# Define the version of the project
VERSION := "0.0.1"

# Default make recipe
all:
	@$(MAKE) -s stub

stub:
	@echo I don't do anything :)

debug: debug-build
	@docker run --rm ${DOCKER_IMAGE}:${VERSION}-debug

debug-build: debug-test
	@docker build --force-rm --tag=${DOCKER_IMAGE}:${VERSION}-debug --build-arg PACKAGE=${PACKAGE} -f build/package/Debug.Dockerfile ./

debug-test:
	@echo I don't do anything :)