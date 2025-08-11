.PHONY: run build test clean docker-build docker-run docker-rmi

# Default target
all: build run

# Build the project
build:
	mkdir -p bin
	go build -o bin/bookings ./cmd/bookings

# Run the application
run:
	go run ./cmd/bookings

# Run tests
test:
	go test -v ./...

# Clean build artifacts
clean:
	rm -rf bin/

#Docker commands
docker-build:
	docker build -t bookings:dev .

docker-run:
	docker run --rm -p 8080:8080 bookings:dev

docker-rmi:
	docker rmi -f bookings:dev

test-h:
	curl localhost:8080/api/healthz