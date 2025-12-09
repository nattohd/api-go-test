.PHONY: dev tools build run test clean

# Install development tools (air, delve)
tools:
	@echo "Installing development tools..."
	@cat tools.go | grep _ | awk -F'"' '{print $$2}' | xargs -n1 go install

# Download dependencies
deps:
	go mod tidy
	go mod download

# Build the application
build:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ./bin/app .

# Run the application
run:
	go run .

# Run with hot reload (requires air)
dev:
	air

# Run tests
test:
	go test -v ./...

# Clean build artifacts
clean:
	rm -rf ./bin ./tmp

# Setup development environment (for devcontainer)
setup: deps tools
	@echo "Development environment ready!"
